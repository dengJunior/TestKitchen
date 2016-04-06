//
//  CommunityActivityCell.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CommunityActivityCell.h"
#import "UIImageView+WebCache.h"
#import "CommunityRecommendModel.h"

@implementation CommunityActivityCell


-(void)setActivityArray:(NSArray *)activityArray
{
    _activityArray = activityArray;
    
    //循环创建图片
    [self.myScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //创建视图
    for (int i=0; i<activityArray.count; i++) {
        
        CommunityActivityModel *model = activityArray[i];
        
        UIImageView *tmpImageView = [KTCUtil createImageView:nil];
        tmpImageView.frame = CGRectMake(kScreenW*i, 0, kScreenW, 130);
        [tmpImageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
        [self.myScrollView addSubview:tmpImageView];
        
        //点击手势
        UITapGestureRecognizer *g = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        tmpImageView.userInteractionEnabled = YES;
        tmpImageView.tag = 200+i;
        [tmpImageView addGestureRecognizer:g];
        
    }
    
    self.myScrollView.delegate = self;
    self.myScrollView.pagingEnabled = YES;
    self.myScrollView.contentSize = CGSizeMake(kScreenW*activityArray.count, 130);
    
    //分页
    self.pageCtrl.numberOfPages = activityArray.count;
    
    
}


- (void)tapAction:(UIGestureRecognizer *)g
{
    NSInteger index = g.view.tag-200;
    
    CommunityActivityModel *model = self.activityArray[index];
    if (self.clickBlock) {
        self.clickBlock(model.link, LinkTypeHTML);
    }
}


#pragma mark - UIScrollView代理
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/kScreenW;
    
    self.pageCtrl.currentPage = index;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
