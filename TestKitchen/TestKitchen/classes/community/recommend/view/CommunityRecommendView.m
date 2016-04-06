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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
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




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
