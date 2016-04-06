//
//  CommunityNewsCell.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CommunityNewsCell.h"
#import "CommunityNewsModel.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"


@implementation CommunityNewsCell

-(void)setDetailModel:(CommunityNewsDetailModel *)detailModel
{
    _detailModel = detailModel;
    
    //图片
    [self.topImageView sd_setImageWithURL:[NSURL URLWithString:detailModel.image]];
    
    //头像
    [self.userBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:detailModel.head_img] forState:UIControlStateNormal];
    
    //名字
    self.nameLabel.text = detailModel.nick;
    
    //事件
    self.timeLabel.text = detailModel.create_time;
    
    //评论数
    self.agreeLabel.text = detailModel.agree_count;
}



- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)clickUserBtn:(id)sender {
}
@end
