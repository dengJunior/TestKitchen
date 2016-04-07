//
//  CommunityFollowView.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CommunityFollowView.h"
#import "CommunityFollowCell.h"
#import "CommunityNewsModel.h"

@interface CommunityFollowView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tbView;

@end

@implementation CommunityFollowView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //创建表格
        self.tbView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        self.tbView.delegate = self;
        self.tbView.dataSource = self;
        self.tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:self.tbView];
        
        //下拉刷新
        self.tbView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
        
        self.tbView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooter)];
    }
    return self;
}

-(void)endRefresh
{
    [self.tbView.mj_header endRefreshing];
    [self.tbView.mj_footer endRefreshing];
    
}

- (void)refreshHeader
{
    if (self.refreshBlock) {
        self.refreshBlock(YES);
    }
}

- (void)refreshFooter
{
    if (self.refreshBlock) {
        self.refreshBlock(NO);
    }
}

-(void)setNewsModel:(CommunityNewsModel *)newsModel
{
    _newsModel = newsModel;
    
    self.tbView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tbView reloadData];
    
    if (newsModel.data.total.intValue == newsModel.data.data.count) {
        self.tbView.mj_footer.hidden = YES;
    }
}

#pragma mark - UITableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.newsModel.data.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommunityNewsDetailModel *model = self.newsModel.data.data[indexPath.row];
    return [CommunityFollowCell heightWithModel:model];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"communityFollowCellId";
    CommunityFollowCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CommunityFollowCell" owner:nil options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    //点击事件
    cell.userBlock = self.userBlock;
    
    //显示数据
    CommunityNewsDetailModel *model = self.newsModel.data.data[indexPath.row];
    cell.model = model;
    
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
