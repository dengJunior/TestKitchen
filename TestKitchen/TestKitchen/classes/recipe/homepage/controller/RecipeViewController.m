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

@interface RecipeViewController ()<UIScrollViewDelegate>


@property (nonatomic,strong)UIScrollView *scrollView;


//首页推荐
@property (nonatomic,strong)RecommendModel *recommendModel;
@property (nonatomic,strong)RecommendView *recommendView;

//首页食材
@property (nonatomic,strong)UIView *materialView;

//首页分类
@property (nonatomic,strong)UIView *categoryView;



@end

@implementation RecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    //首页视图
    [self createHomePageView];
    
    
    
    //下载食材首页推荐的数据
    [self downloadRecommendData];
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
    self.materialView = [[UIView alloc] init];
    [container addSubview:self.materialView];
    [self.materialView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.equalTo(container);
        make.width.mas_equalTo(kScreenW);
        make.left.equalTo(self.recommendView.mas_right);
    }];
    
    //首页分类
    self.categoryView = [[UIView alloc] init];
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
    self.recommendView.clickBlock = ^(NSString *urlString, LinkType type){
    
    };
    
    self.recommendView.rModel = self.recommendModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 界面跳转


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
