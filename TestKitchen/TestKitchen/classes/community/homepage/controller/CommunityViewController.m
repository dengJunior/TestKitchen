//
//  CommunityViewController.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CommunityViewController.h"
#import "KTCSegmentCtrl.h"
#import "CommunityNewsModel.h"
#import "CommunityNewsView.h"
#import "CommunityRecommendModel.h"
#import "CommunityRecommendView.h"
#import "CommunityFollowView.h"
#import "MainTabBarController.h"
#import "AppDelegate.h"

@interface CommunityViewController ()<KTCSegmentCtrlDelegate,UIScrollViewDelegate>

//导航选择控件
@property (nonatomic,strong)KTCSegmentCtrl *segCtrl;

//滚动视图
@property (nonatomic,strong)UIScrollView *scrollView;


//关注
@property (nonatomic,assign)NSInteger pageIndex;
@property (nonatomic,strong)CommunityNewsModel *followModel;
@property (nonatomic,strong)CommunityFollowView *followView;

//推荐
@property (nonatomic,strong)CommunityRecommendModel *recommendModel;
@property (nonatomic,strong)CommunityRecommendView *recommendView;


//最新
@property (nonatomic,strong)NSString *lastId;
@property (nonatomic,strong)CommunityNewsModel *newsModel;
@property (nonatomic,strong)CommunityNewsView *newsView;

@end

@implementation CommunityViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //显示tabBar
    AppDelegate *appDele = (AppDelegate *)[UIApplication sharedApplication].delegate;
    MainTabBarController *mainTabBar = (MainTabBarController *)appDele.window.rootViewController;
    [mainTabBar showTabBar];
    
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    //隐藏tabBar
    AppDelegate *appDele = (AppDelegate *)[UIApplication sharedApplication].delegate;
    MainTabBarController *mainTabBar = (MainTabBarController *)appDele.window.rootViewController;
    [mainTabBar hideTabBar];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //导航
    [self createMyNav];
    
    //创建视图
    [self createHomePageView];
    
    
    //最新的数据
    self.lastId = @"0";
    [self downloadNewsData];
    
    //推荐的数据
    [self downloadRecommendData];
    
    //关注的数据
    self.pageIndex = 1;
    [self downloadFollowData];
}


//关注的数据
- (void)downloadFollowData
{
    //methodName=ShequFollow&page=1&size=10&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"ShequFollow" forKey:@"methodName"];
    [dict setObject:[NSString stringWithFormat:@"%ld",self.pageIndex] forKey:@"page"];
    [dict setObject:@"10" forKey:@"size"];
    
    WS(ws)
    [KTCDownloader postWithUrlString:kHostUrl params:dict success:^(NSData *data) {
        
        CommunityNewsModel *model = [[CommunityNewsModel alloc] initWithData:data error:nil];
        
        if (ws.pageIndex == 1) {
            ws.followModel = model;
        }else{
            [ws.followModel.data.data addObjectsFromArray:model.data.data];
        }        //在主线程刷新
        [ws performSelectorOnMainThread:@selector(showFollowData) withObject:nil waitUntilDone:NO];
        
    } failBlock:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
}

- (void)showFollowData
{
    self.followView.userBlock = ^(NSString *userId){
    
    };
    
    //刷新
    WS(ws)
    self.followView.refreshBlock = ^(BOOL isHeader){
        if (isHeader) {
            
            ws.pageIndex = 1;
            
            [ws downloadFollowData];
            
        }else{
            
            if (ws.newsModel.data.total.intValue > ws.newsModel.data.data.count) {
                ws.pageIndex ++;                
                [ws downloadFollowData];
            }
            
        }
    };
    
    self.followView.newsModel = self.followModel;
    
    [self.followView endRefresh];
}


//推荐的数据
- (void)downloadRecommendData
{
    //methodName=ShequRecommend&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.33
    
    NSDictionary *dict = @{@"methodName":@"ShequRecommend"};
    
    WS(ws)
    [KTCDownloader postWithUrlString:kHostUrl params:dict success:^(NSData *data) {
        
        ws.recommendModel = [[CommunityRecommendModel alloc] initWithData:data error:nil];
        
        [ws performSelectorOnMainThread:@selector(showRecommendData) withObject:nil waitUntilDone:NO];
        
    } failBlock:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
}

- (void)showRecommendData
{
    self.recommendView.clickBlock = ^(NSString *urlString, LinkType type) {
    
    };
    
    self.recommendView.model = self.recommendModel;
}


//创建视图
- (void)createHomePageView
{
    //滚动视图
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, kScreenW, kScreenH-64-49)];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    [self.view addSubview:self.scrollView];
    
    
    //关注
    self.followView = [[CommunityFollowView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, self.scrollView.bounds.size.height)];
    [self.scrollView addSubview:self.followView];
    
    //推荐
    self.recommendView = [[CommunityRecommendView alloc] initWithFrame:CGRectMake(kScreenW, 0, kScreenW, self.scrollView.bounds.size.height)];
    [self.scrollView addSubview:self.recommendView];
    
    //最新
    self.newsView = [[CommunityNewsView alloc] initWithFrame:CGRectMake(kScreenW*2, 0, kScreenW, self.scrollView.bounds.size.height)];
    [self.scrollView addSubview:self.newsView];
    
    self.scrollView.contentSize = CGSizeMake(kScreenW*3, self.scrollView.bounds.size.height);
    self.scrollView.contentOffset = CGPointMake(kScreenW, 0);
    
    
}


//导航
- (void)createMyNav
{
    self.segCtrl = [[KTCSegmentCtrl alloc] initWithFrame:CGRectMake(80, 0, kScreenW-80*2, 44) titleArray:@[@"关注",@"推荐",@"最新"]];
    self.segCtrl.delegate = self;
    self.navigationItem.titleView = self.segCtrl;
    
    self.segCtrl.selectedIndex = 1;
}


//最新的数据
- (void)downloadNewsData
{
    //last_id=0&methodName=ShequList&page=1&size=10&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:self.lastId forKey:@"last_id"];
    [dict setObject:@"ShequList" forKey:@"methodName"];
    [dict setObject:@"1" forKey:@"page"];
    [dict setObject:@"10" forKey:@"size"];
    
    WS(ws)
    [KTCDownloader postWithUrlString:kHostUrl params:dict success:^(NSData *data) {
        
        CommunityNewsModel *model = [[CommunityNewsModel alloc] initWithData:data error:nil];

        if ([ws.lastId isEqualToString:@"0"]) {
            ws.newsModel = model;
        }else{
            [ws.newsModel.data.data addObjectsFromArray:model.data.data];
        }
        
        //主线程刷新UI
        [ws performSelectorOnMainThread:@selector(showNewsData) withObject:nil waitUntilDone:NO];
        
        
    } failBlock:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
}


- (void)showNewsData
{
    WS(ws)
    self.newsView.clickUserBlock = ^(NSString *userId){
    
    };
    
    self.newsView.cellClickBlock = ^(NSString *workId){
    
    };
    
    
    self.newsView.refreshBlock = ^(BOOL isHeader){
        if (isHeader) {
            
            ws.lastId = @"0";
            
            [ws downloadNewsData];
            
        }else{
            
            if (ws.newsModel.data.total.intValue > ws.newsModel.data.data.count) {
                CommunityNewsDetailModel *model =  [ws.newsModel.data.data lastObject];
                ws.lastId = model.dId;
                
                [ws downloadNewsData];
            }
            
        }
    };
    
    
    self.newsView.newsModel = self.newsModel;
    
    [self.newsView endRefresh];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - KTCSegmentCtrl代理
- (void)didSelectSegCtrlAtIndex:(NSInteger)index
{
    self.scrollView.contentOffset = CGPointMake(kScreenW*index, 0);
}


#pragma mark - UIScrollView代理
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
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
