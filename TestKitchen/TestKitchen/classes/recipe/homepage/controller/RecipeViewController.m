//
//  RecipeViewController.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RecipeViewController.h"
#import "RecommendModel.h"
#import "RecommendView.h"
#import "MaterialModel.h"
#import "MaterialView.h"
#import "KTCSegmentCtrl.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "WebViewController.h"

@interface RecipeViewController ()<UIScrollViewDelegate,KTCSegmentCtrlDelegate>


@property (nonatomic,strong)UIScrollView *scrollView;


//首页推荐
@property (nonatomic,strong)RecommendModel *recommendModel;
@property (nonatomic,strong)RecommendView *recommendView;

//首页食材
@property (nonatomic,strong)MaterialView *materialView;
@property (nonatomic,strong)MaterialModel *materialModel;

//首页分类
@property (nonatomic,strong)MaterialView *categoryView;
@property (nonatomic,strong)MaterialModel *categoryModel;

//导航的选择控件
@property (nonatomic,strong)KTCSegmentCtrl *segCtrl;

@end

@implementation RecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    //首页视图
    [self createHomePageView];
    
    //首页导航
    [self createMyNav];
    
    //下载食材首页推荐的数据
    [self downloadRecommendData];
    
    //下载食材数据
    [self downloadMaterialData];
    
    //下载分类的数据
    [self downloadCategoryData];
}


//首页导航
- (void)createMyNav
{
    //扫一扫
    [self addNavBtnImage:@"saoyisao" target:self action:@selector(scanAction) isLeft:YES];
    
    
    self.segCtrl = [[KTCSegmentCtrl alloc] initWithFrame:CGRectMake(80, 0, kScreenW-80*2, 44) titleArray:@[@"推荐",@"食材",@"分类"]];
    self.segCtrl.delegate = self;
    self.navigationItem.titleView = self.segCtrl;
    
    //搜索
    [self addNavBtnImage:@"search" target:self action:@selector(searchAction) isLeft:NO];
    
    
}

//扫一扫
- (void)scanAction
{
    
}

//搜索
- (void)searchAction
{
    
}


//下载分类的数据
- (void)downloadCategoryData
{
   
    WS(ws)
    NSDictionary *dict = @{@"methodName":@"CategoryIndex"};
    [KTCDownloader postWithUrlString:kHostUrl params:dict success:^(NSData *data) {
        
        ws.categoryModel = [[MaterialModel alloc] initWithData:data error:nil];
        
        [ws performSelectorOnMainThread:@selector(showCategory) withObject:nil waitUntilDone:NO];
        
    } failBlock:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (void)showCategory
{
    self.categoryView.model = self.categoryModel;
}

//下载食材数据
- (void)downloadMaterialData
{
   
    WS(ws)
    NSDictionary *dict = @{@"methodName":@"MaterialSubtype"};
    [KTCDownloader postWithUrlString:kHostUrl params:dict success:^(NSData *data) {
        
        ws.materialModel = [[MaterialModel alloc] initWithData:data error:nil];
        
        [ws performSelectorOnMainThread:@selector(showMaterial) withObject:nil waitUntilDone:NO];
        
    } failBlock:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

//刷新食材数据
- (void)showMaterial
{
    self.materialView.model = self.materialModel;
}


- (void)createHomePageView
{
    
    WS(ws)
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    //约束
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view).with.insets(UIEdgeInsetsMake(64, 0, 49, 0));
    }];

    
    UIView *container = [KTCUtil createUIView];
    container.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.scrollView);
        //高度一定要设置
        make.height.equalTo(ws.scrollView.mas_height);
    }];

    
    //首页推荐
    self.recommendView = [[RecommendView alloc] init];
    self.recommendView.backgroundColor = [UIColor orangeColor];
    [container addSubview:self.recommendView];
    [self.recommendView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.and.left.equalTo(container);
        make.width.mas_equalTo(kScreenW);
    }];
    
    //首页食材
    self.materialView = [[MaterialView alloc] init];
    [container addSubview:self.materialView];
    [self.materialView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.equalTo(container);
        make.width.mas_equalTo(kScreenW);
        make.left.equalTo(self.recommendView.mas_right);
    }];
    
    //首页分类
    self.categoryView = [[MaterialView alloc] init];
    [container addSubview:self.categoryView];
    [self.categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.equalTo(container);
        make.width.mas_equalTo(kScreenW);
        make.left.equalTo(self.materialView.mas_right);
    }];
    
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.categoryView.mas_right);
    }];
    
    
}

//下载食材首页推荐的数据
- (void)downloadRecommendData
{
    NSDictionary *dict = @{@"methodName":@"SceneHome"};
    
    WS(ws)
    [KTCDownloader postWithUrlString:kHostUrl params:dict success:^(NSData *data) {
       //JSON解析
        ws.recommendModel = [[RecommendModel alloc] initWithData:data error:nil];
        
        //在主线程修改UI
        [ws performSelectorOnMainThread:@selector(showRecommendView) withObject:nil waitUntilDone:NO];
        
    } failBlock:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
}

- (void)showRecommendView
{
    //点击事件
    WS(ws)
    self.recommendView.clickBlock = ^(NSString *urlString ,NSString *title, LinkType type){
        
        if (type == LinkTypeVideo) {
            //视频
            [ws playVideo:urlString];
        }else if (type == LinkTypeHTML) {
            //网页
            [ws gotoHTMLPage:urlString];
        }
        
    };
    
    self.recommendView.rModel = self.recommendModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 界面跳转

//视频播放
- (void)playVideo:(NSString *)urlString
{
    AVPlayerViewController *ctrl = [[AVPlayerViewController alloc] init];
    
    AVPlayer *player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:urlString]];
    ctrl.player = player;
    
    [player play];
    
    [self presentViewController:ctrl animated:YES completion:nil];
}

//网页
- (void)gotoHTMLPage:(NSString *)urlString
{
    WebViewController *ctrl = [[WebViewController alloc] init];
    ctrl.urlString = urlString;
    
    [self.navigationController pushViewController:ctrl animated:YES];
}


#pragma mark - 选择控件的代理
- (void)didSelectSegCtrlAtIndex:(NSInteger)index
{
    [self.scrollView setContentOffset:CGPointMake(kScreenW*index, 0) animated:YES];
}

#pragma mark - UIScrollView代理
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/kScreenW;
    
    self.segCtrl.selectedIndex = index;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
