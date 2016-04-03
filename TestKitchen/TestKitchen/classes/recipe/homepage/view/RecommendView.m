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

@interface RecommendView ()<UITableViewDataSource,UITableViewDelegate>

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
    if (section == 0 && self.rModel.data.banner.count > 0) {
        //广告
        rowNum = 1;
        return rowNum;
    }
    
    NSInteger secIndex = section;
    if (self.rModel.data.banner.count > 0) {
        secIndex--;
    }
    
    RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[secIndex];
    if (listModel.widget_type.intValue == 1) {
        //猜你喜欢
        rowNum = 1;
    }
    
    return rowNum;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat h = 0;
    if (indexPath.section == 0 && self.rModel.data.banner.count > 0) {
        h = 120;
        return h;
    }
    
    NSInteger secIndex = indexPath.section;
    if (self.rModel.data.banner.count > 0) {
        secIndex--;
    }
    
    RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[secIndex];
    if (listModel.widget_type.intValue == 1) {
        //猜你喜欢
        h = 120;
    }

    return h;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = nil;

    if (indexPath.section == 0 && self.rModel.data.banner.count > 0) {
        cell = [self createAdCellForTableView:tableView atIndexPath:indexPath];
        return cell;
    }
    
    NSInteger secIndex = indexPath.section;
    if (self.rModel.data.banner.count > 0) {
        secIndex--;
    }
    
    RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[secIndex];
    if (listModel.widget_type.intValue == 1) {
        //猜你喜欢
        cell = [self createLikeCellForTableView:tableView atIndexPath:indexPath];
    }
    
    return cell;
    
}

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


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
