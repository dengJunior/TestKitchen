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
#import "RecommendSceneCell.h"
#import "RecommendSceneListCell.h"
#import "RecommendSoupCell.h"
#import "RecommendMasterCell.h"
#import "RecommendSelectCell.h"
#import "RecommendSubjectCell.h"

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
        if (listModel.widget_type.intValue == 1 || listModel.widget_type.intValue == 2 || listModel.widget_type.intValue == 5 || listModel.widget_type.intValue == 3 || listModel.widget_type.intValue == 9 || listModel.widget_type.intValue == 8) {
            //1----猜你喜欢
            //2----红包入口
            //5----今日新品
            //3----推荐的场景
            //9----场景列表
            //8----精选作品
            rowNum = 1;
        }else if (listModel.widget_type.intValue == 6) {
            //养生靓汤等
            rowNum = listModel.widget_data.count/6;
        }else if (listModel.widget_type.intValue == 4) {
            //推荐达人
            rowNum = listModel.widget_data.count/4;
        }else if (listModel.widget_type.intValue == 7) {
            //美食专题
            rowNum = listModel.widget_data.count/3;
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
        RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[indexPath.section-1];
        if (listModel.widget_type.intValue == 1) {
            //猜你喜欢
            h = 100;
        }else if (listModel.widget_type.intValue == 2){
            //红包入口
            h = 80;
        }else if (listModel.widget_type.intValue == 5){
            //今日新品
            h = 260;
        }else if (listModel.widget_type.intValue == 3){
            //推荐的场景
            h = 200;
        }else if (listModel.widget_type.intValue == 9) {
            //场景列表
            h = 60;
        }else if (listModel.widget_type.intValue == 6) {
            //养生靓汤等
            h = 120;
        }else if (listModel.widget_type.intValue == 4) {
            //推荐大人
            h = 80;
        }else if (listModel.widget_type.intValue == 8) {
            //精选作品
            h = 240;
        }else if (listModel.widget_type.intValue == 7) {
            //美食专题
            h = 180;
        }
    }
    
    

    return h;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat h = 0;
    
    if (section > 0) {
        RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[section-1];
        if (listModel.widget_type.intValue == 1 || listModel.widget_type.intValue == 5 || listModel.widget_type.intValue == 3 || listModel.widget_type.intValue == 6 || listModel.widget_type.intValue == 4 || listModel.widget_type.intValue == 8 || listModel.widget_type.intValue == 7) {
            //1----猜你喜欢
            //5----今日推荐
            //3----推荐的场景
            //6----养生靓汤等
            //4----推荐达人
            //8----精选作品
            //7----美食专题
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
        }else if (listModel.widget_type.intValue == 5 || listModel.widget_type.intValue == 3 || listModel.widget_type.intValue == 6 || listModel.widget_type.intValue == 4 || listModel.widget_type.intValue == 8 ||listModel.widget_type.intValue == 7) {
            //5-----今日新品
            //3----推荐的场景
            //6----养生靓汤等
            //4----推荐达人
            //8----精选作品
            view = [[RecommendHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 44) title:listModel.title];
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
        }else if (listModel.widget_type.intValue == 3){
            //推荐的场景
            cell = [self createRecommendSceneCellForTableView:tableView atIndexPath:indexPath];
        }else if (listModel.widget_type.intValue == 9) {
            //场景列表
            cell = [self createRecommendSceneListCellForTableView:tableView atIndexPath:indexPath];
        }else if (listModel.widget_type.intValue == 6) {
            //靓汤等
            cell = [self createRecommendSoupCellForTableView:tableView atIndexPath:indexPath];
        }else if (listModel.widget_type.intValue == 4) {
            //推荐达人
            cell = [self createRecommendMasterCellForTableView:tableView atIndexPath:indexPath];
        }else if (listModel.widget_type.intValue == 8) {
            //精选作品
            cell = [self createRecommendSelectCellForTableView:tableView atIndexPath:indexPath];
        }else if (listModel.widget_type.intValue == 7) {
            //美食专题
            cell = [self createRecommendSubjectCellForTableview:tableView atIndexPath:indexPath];
        }
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

//美食专题
- (UITableViewCell *)createRecommendSubjectCellForTableview:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"recommendSubjectCellId";
    RecommendSubjectCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"RecommendSubjectCell" owner:nil options:nil] lastObject];
    }
    //显示数据
    RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[indexPath.section-1];
    cell.modelArray = [listModel.widget_data subarrayWithRange:NSMakeRange(indexPath.row*3, 3)];
    
    return cell;
    
}

//精选作品
- (UITableViewCell *)createRecommendSelectCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"recommendSelectCellId";
    RecommendSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"RecommendSelectCell" owner:nil options:nil] lastObject];
    }
    
    //点击事件
    cell.clickBlock = self.clickBlock;
    //数据
    RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[indexPath.section-1];
    cell.listModel = listModel;
    return cell;
    
}

//推荐达人
- (UITableViewCell *)createRecommendMasterCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"recommendMasterCellId";
    RecommendMasterCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"RecommendMasterCell" owner:nil options:nil] lastObject];
    }
    
    //显示数据
    RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[indexPath.section-1];
    cell.modelArray = [listModel.widget_data subarrayWithRange:NSMakeRange(4*indexPath.row, 4)];
    return cell;
    
}

//养生靓汤等
- (UITableViewCell *)createRecommendSoupCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"recommendSoupCellId";
    RecommendSoupCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"RecommendSoupCell" owner:nil options:nil] lastObject];
    }
    
    //点击事件
    cell.clickBlock = self.clickBlock;
    
    //显示数据
    RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[indexPath.section-1];
    cell.modelArray = [listModel.widget_data subarrayWithRange:NSMakeRange(6*indexPath.row, 6)];
    return cell;
}

//recommendSceneListCellId
//场景列表
- (UITableViewCell *)createRecommendSceneListCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"recommendSceneListCellId";
    RecommendSceneListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"RecommendSceneListCell" owner:nil options:nil] lastObject];
    }
    //数据
    RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[indexPath.section-1];
    cell.titleLabel.text = listModel.title;
    return cell;
}

//推荐的场景
- (UITableViewCell *)createRecommendSceneCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"recommendSceneCellId";
    RecommendSceneCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"RecommendSceneCell" owner:nil options:nil] lastObject];
    }
    
    //点击事件
    cell.clickBlock = self.clickBlock;
    
    //显示数据
    RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[indexPath.section-1];
    cell.listModel = listModel;
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
    
    //点击事件
    cell.clickBlock = self.clickBlock;
    
    //显示数据
    RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[indexPath.section-1];
    cell.listModel = listModel;
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
    
    //显示数据
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

    //显示数据
    RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[indexPath.section-1];
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
    RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[indexPath.section-1];
    cell.listModel = listModel;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:( NSIndexPath *)indexPath{
    
    if (indexPath.section > 0) {
        RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[indexPath.section-1];
        
        if (listModel.widget_type.intValue == 9) {
            //场景菜谱
            if ([listModel.title_link rangeOfString:@"app://scenelist"].location != NSNotFound) {
                if (self.clickBlock) {
                    self.clickBlock(listModel.title_link, LinkTypeSceneList);
                }
            }
        }else if (listModel.widget_type.intValue == 6){
            //养生靓汤
            if (listModel.widget_data.count > 6*indexPath.row) {
                RecommendWidgetDataModel *imageModel = listModel.widget_data[6*indexPath.row];
                if ([imageModel.type isEqualToString:@"image"] && [imageModel.link rangeOfString:@"app://dish"].location != NSNotFound) {
                    if (self.clickBlock) {
                        self.clickBlock(imageModel.link, LinkTypeDish);
                    }
                }
            }
            
        }else if (listModel.widget_type.intValue == 4) {
            //推荐达人
            if (listModel.widget_data.count > 4*indexPath.row) {
                RecommendWidgetDataModel *imageModel = listModel.widget_data[4*indexPath.row];
                if ([imageModel.type isEqualToString:@"image"] && [imageModel.link rangeOfString:@"app://talent"].location != NSNotFound) {
                    if (self.clickBlock) {
                        self.clickBlock(imageModel.link, LinkTypeTalent);
                    }
                }
            }
        }else if (listModel.widget_type.intValue == 7) {
            //美食专题
            RecommendWidgetDataModel *imageModel = listModel.widget_data[3*indexPath.row];
            if ([imageModel.type isEqualToString:@"image"]) {
                if (self.clickBlock) {
                    self.clickBlock(imageModel.link, LinkTypeHTML);
                }
            }
        }
        
        
    }
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
