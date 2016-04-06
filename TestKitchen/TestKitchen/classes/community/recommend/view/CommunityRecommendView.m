//
//  CommunityRecommendView.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CommunityRecommendView.h"
#import "CommunityRecommendModel.h"
#import "CommunityActivityCell.h"
#import "CommunityTalentCell.h"
#import "CommunityTopicCell.h"


@interface CommunityRecommendView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tbView;

@end

@implementation CommunityRecommendView


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //表格
        self.tbView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        self.tbView.delegate = self;
        self.tbView.dataSource = self;
        self.tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tbView.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
        [self addSubview:self.tbView];
    }
    
    return self;
}

-(void)setModel:(CommunityRecommendModel *)model
{
    _model = model;
    
    self.tbView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tbView reloadData];
}


#pragma mark - UITableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //活动       1
    //掌厨达人    1
    //精选作品    1
    return 3+self.model.data.shequ_topics.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130+10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    if (indexPath.row == 0) {
        //活动
        cell = [self createActivityCellForTableView:tableView atIndexPath:indexPath];
    }else if (indexPath.row == 1) {
        //掌厨达人
        cell = [self createTalentCellForTableView:tableView atIndexPath:indexPath];
    }else{
        //精选作品
        //专题
        cell = [self createTopicCellForTableView:tableView atIndexPath:indexPath];
    }
    
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}


//精选作品
- (UITableViewCell *)createTopicCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"communityTopicCellId";
    
    CommunityTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CommunityTopicCell" owner:nil options:nil] lastObject];
    }
    
    //点击事件
    cell.clickBlock = self.clickBlock;
    
    if (indexPath.row == 2) {
        
        cell.type = LinkTypeMarrow;
        
        cell.dataArray = self.model.data.shequ_marrow;
        
    }else{
        cell.type = LinkTypeTopic;
        
        //数据
        CommunityTopicModel *model = self.model.data.shequ_topics[indexPath.row-3];
        cell.titleLabel.text = model.topic_name;
        
        cell.dataArray = model.data;
    }
    
    return cell;
    
}


//掌厨达人
- (UITableViewCell *)createTalentCellForTableView:(UITableView *)tableview atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"communityTalentCellId";
    
    CommunityTalentCell *cell = [tableview dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CommunityTalentCell" owner:nil options:nil] lastObject];
    }
    
    //点击事件
    cell.clickBlock = self.clickBlock;
    
    //显示数据
    cell.talentArray = self.model.data.shequ_talent;
    
    return cell;
}


//活动
- (UITableViewCell *)createActivityCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"communityActivityCellId";
    
    CommunityActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CommunityActivityCell" owner:nil options:nil] lastObject];
    }
    
    //点击事件
    cell.clickBlock = self.clickBlock;
    
    //显示数据
    cell.activityArray = self.model.data.activity;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        //推荐达人
        
        
    }else if (indexPath.row == 2) {
        //精选作品
        
    }else if (indexPath.row > 2){
        //掌厨学院
        
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
