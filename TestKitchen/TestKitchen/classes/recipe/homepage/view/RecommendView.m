//
//  RecommendView.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RecommendView.h"
#import "RecommendModel.h"

@interface RecommendView ()<UITableViewDataSource,UITableViewDelegate>

//表格
@property (nonatomic,strong)UITableView *tbView;

@end

@implementation RecommendView

-(instancetype)init
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
    NSInteger sections = 0;
    if (self.rModel.data.banner.count > 0) {
        sections = 1;
    }
    
    sections += self.rModel.data.widgetList.count;
    
    return sections;
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
    if (listModel.widgetType.intValue == 1) {
        //猜你喜欢
        rowNum = 1;
    }
    
    return rowNum;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat h = 0;
    if (indexPath.section == 0 && self.rModel.data.banner.count > 0) {
        h = 160;
        return h;
    }
    
    NSInteger secIndex = indexPath.section;
    if (self.rModel.data.banner.count > 0) {
        secIndex--;
    }
    
    RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[secIndex];
    if (listModel.widgetType.intValue == 1) {
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
    }
    
    NSInteger secIndex = indexPath.section;
    if (self.rModel.data.banner.count > 0) {
        secIndex--;
    }
    
    RecommendDataWidgetListModel *listModel = self.rModel.data.widgetList[secIndex];
    if (listModel.widgetType.intValue == 1) {
        //猜你喜欢
        cell = [self createLikeCellForTableView:tableView atIndexPath:indexPath];
    }
    
    return cell;
    
}

- (UITableViewCell *)createAdCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (UITableViewCell *)createLikeCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
