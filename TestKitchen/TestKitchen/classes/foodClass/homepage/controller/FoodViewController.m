//
//  FoodViewController.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "FoodViewController.h"
#import "FoodModel.h"
#import "FoodCell.h"
#import "AppDelegate.h"
#import "MainTabBarController.h"

@interface FoodViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign)NSInteger pageIndex;

@property (nonatomic,strong)FoodModel *foodModel;

@property (nonatomic,strong)UITableView *tbView;

@end

@implementation FoodViewController

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
    
    //导航
    [self createMyNav];
    
    //创建表格
    [self createTableView];
    
    //下载数据
    self.pageIndex = 1;
    [self downloadData];
}


//导航
- (void)createMyNav
{
    [self addNavTitle:@"食课"];
}


//创建表格
- (void)createTableView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //创建表格
    self.tbView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tbView.delegate = self;
    self.tbView.dataSource = self;
    self.tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tbView];
    
    WS(ws)
    [self.tbView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view).with.insets(UIEdgeInsetsMake(64, 0, 49, 0));
    }];
    
    //下拉刷新
    self.tbView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
    
    self.tbView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooter)];
}


- (void)refreshHeader
{
    self.pageIndex = 1;
    
    self.tbView.mj_footer.hidden = NO;
    [self downloadData];
}

- (void)refreshFooter
{
    self.pageIndex++;
    
    [self downloadData];
}


//下载数据
- (void)downloadData
{
    //methodName=CourseIndex&page=1&size=10&token=8ABD36C80D1639D9E81130766BE642B7&user_id=1386387&version=4.32
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"CourseIndex" forKey:@"methodName"];
    [dict setObject:[NSString stringWithFormat:@"%ld",self.pageIndex] forKey:@"page"];
    [dict setObject:@"10" forKey:@"size"];
    
    WS(ws)
    [KTCDownloader postWithUrlString:kHostUrl params:dict success:^(NSData *data) {
        
        
        FoodModel *model = [[FoodModel alloc] initWithData:data error:nil];
        if (ws.pageIndex == 1) {
            ws.foodModel = model;
        }else{
            [ws.foodModel.data.data addObjectsFromArray:model.data.data];
        }
        
        [ws performSelectorOnMainThread:@selector(refreshData) withObject:nil waitUntilDone:NO];
        
    } failBlock:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
    
}

- (void)refreshData
{
    [self.tbView reloadData];
    
    if (self.foodModel.data.total.intValue == self.foodModel.data.data.count) {
        self.tbView.mj_footer.hidden = YES;
    }
    
    
    [self.tbView.mj_footer endRefreshing];
    [self.tbView.mj_header endRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.foodModel.data.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *foodCellId = @"foodCellId";
    FoodCell *cell = [tableView dequeueReusableCellWithIdentifier:foodCellId];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FoodCell" owner:nil options:nil] lastObject];
    }
    
    //显示数据
    FoodDataDetailModel *model = self.foodModel.data.data[indexPath.row];
    [cell configModel:model];
    
    return cell;
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
