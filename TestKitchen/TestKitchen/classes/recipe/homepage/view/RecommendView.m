//
//  RecommendView.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RecommendView.h"
#import "RecommendModel.h"
#import "RecommendADCell.h"
#import "RecommendLikeCell.h"
#import "LikeHeaderView.h"
#import "FoodRecordCell.h"
#import "DailyMenuCell.h"
#import "RecommendHeaderView.h"

@interface RecommendView ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

//表格
@property (nonatomic,strong)UITableView *tbView;

@end

@implementation RecommendView

- (instancetype)init
{
    if (self = [super init]) {
        
        //表格
        self.tbView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tbView.delegate = self;
        self.tbView.dataSource = self;
        [self addSubview:self.tbView];
    
        
        //约束
        WS(ws)
        [self.tbView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(ws);
        }];
        
    }
    return self;
}


- (void)setRModel:(RecommendModel *)rModel
{
    _rModel = rModel;
    
    [self.tbView reloadData];
    
}

#pragma mark - UITableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //广告占一行
    return 1+self.rModel.data.widgetList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rowNum = 0;
    if (section == 0) {
        //广告
        if (self.rModel.data.banner.count > 0) {
            rowNum = 1;
        }
    }else{
        RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[section-1];
        if (listModel.widget_type.intValue == 1 || listModel.widget_type.intValue == 2 || listModel.widget_type.intValue == 5) {
            //1----猜你喜欢
            //2----红包入口
            rowNum = 1;
        }
    }
    
    
    
    return rowNum;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat h = 0;
    if (indexPath.section == 0 ) {
        if (self.rModel.data.banner.count > 0) {
            h = 120;
        }
    }else{
        RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[indexPath.section];
        if (listModel.widget_type.intValue == 1) {
            //猜你喜欢
            h = 100;
        }else if (listModel.widget_type.intValue == 2){
            //红包入口
            h = 80;
        }else if (listModel.widget_type.intValue == 5){
            //今日新品
            h = 260;
        }
    }
    
    

    return h;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat h = 0;
    
    if (section > 0) {
        RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[section-1];
        if (listModel.widget_type.intValue == 1 || listModel.widget_type.intValue == 5) {
            //1----猜你喜欢
            //5----今日推荐
            h = 44;
        }
    }
    
    
    
    
    return h;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = nil;
    if (section > 0) {
        RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[section-1];
        if (listModel.widget_type.intValue == 1) {
            //猜你喜欢
            view = [self createLikeHeaderView];
        }else if (listModel.widget_type.intValue == 5) {
            //今日新品
            view = [[RecommendHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 44) title:@"今日新品"];
        }
    }
    
    
    

    
    return view;
}


//猜你喜欢的表头
- (UIView *)createLikeHeaderView
{
    /*
     这种方式实现时搜索框会有灰色的背景颜色
    UIView *bgView = [KTCUtil createUIView];
    bgView.frame = CGRectMake(0, 0, kScreenW, 44);
    bgView.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.barStyle = UIBarStyleDefault;
    searchBar.placeholder = @"输入菜名或食材搜索";
    searchBar.delegate = self;
    [bgView addSubview:searchBar];
    
    [searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(bgView).with.insets(UIEdgeInsetsMake(0, 40, 0, 40));
    }];
     */
    
    LikeHeaderView *headerView = [[LikeHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 44)];

    
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = nil;

    if (indexPath.section == 0) {
        if (self.rModel.data.banner.count > 0) {
            //广告
            cell = [self createAdCellForTableView:tableView atIndexPath:indexPath];
        }
    }else{
        RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[indexPath.section-1];
        if (listModel.widget_type.intValue == 1) {
            //猜你喜欢
            cell = [self createLikeCellForTableView:tableView atIndexPath:indexPath];
        }else if (listModel.widget_type.intValue == 2){
            //红包入口
            cell = [self createFoodRecordCellForTableView:tableView atIndexPath:indexPath];
        }else if (listModel.widget_type.intValue == 5) {
            //今日新品
            cell = [self createDailyMenuCellForTableView:tableView atIndexPath:indexPath];
        }
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

//今日新品
- (UITableViewCell *)createDailyMenuCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"dailyMenuCellId";
    DailyMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DailyMenuCell" owner:nil options:nil] lastObject];
    }
    
    return cell;
}

//广告
- (UITableViewCell *)createAdCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"adCellId";
    
    RecommendADCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"RecommendADCell" owner:nil options:nil] lastObject];
    }
    
    //点击事件
    cell.clickBlock = self.clickBlock;
    
    cell.bannerArray = self.rModel.data.banner;
    
    return cell;
}

//猜你喜欢
- (UITableViewCell *)createLikeCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellId = @"likeCellId";
    
    RecommendLikeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"RecommendLikeCell" owner:nil options:nil] lastObject];
    }
    
    //点击事件
    cell.clickBlock = self.clickBlock;
    
    NSInteger secIndex = indexPath.section;
    if (self.rModel.data.banner.count > 0) {
        secIndex--;
    }
    
    RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[secIndex];
    cell.model = listModel;
    
    return cell;
}

//红包入口
- (UITableViewCell *)createFoodRecordCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"foodRecordCellId";
    
    FoodRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FoodRecordCell" owner:nil options:nil] lastObject];
    }
    
    //点击事件
    cell.clickBlock = self.clickBlock;
    //显示数据
    NSInteger secIndex = indexPath.section;
    if (self.rModel.data.banner.count > 0) {
        secIndex--;
    }
    
    RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[secIndex];
    cell.listModel = listModel;
    
    return cell;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
