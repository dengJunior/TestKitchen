//
//  CommunityTopicCell.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CommunityTopicCell.h"
#import "CommunityRecommendModel.h"
#import "UIButton+WebCache.h"

@implementation CommunityTopicCell


- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    
    //删除之前的子视图
    [self.myScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    if (self.type == LinkTypeMarrow) {
        //精选作品
        
        //图片
        self.typeImageView.image = [UIImage imageNamed:@"精品"];
        //文字
        self.titleLabel.text = @"精选作品";
        
        
        CGFloat w = 90;
        CGFloat h = 90;
        for (int i=0; i<dataArray.count; i++) {
            UIButton *btn = [KTCUtil createBtnTitle:nil imageName:nil selectImageName:nil target:self action:@selector(clickBtn:)];
            btn.frame = CGRectMake(w*i, 0, w, h);
            btn.tag = 200+i;
            CommunityMarrowModel *model = dataArray[i];
            [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:model.image] forState:UIControlStateNormal];
            [self.myScrollView addSubview:btn];
        }
        
        
    }else if (self.type == LinkTypeTopic) {
        //专题
        
        //图片
        self.typeImageView.image = [UIImage imageNamed:@"标签"];
        
        CGFloat w = 90;
        CGFloat h = 90;
        for (int i=0; i<dataArray.count; i++) {
            UIButton *btn = [KTCUtil createBtnTitle:nil imageName:nil selectImageName:nil target:self action:@selector(clickBtn:)];
            btn.frame = CGRectMake(w*i, 0, w, h);
            btn.tag = 200+i;
            CommunityTopicDetailModel *model = dataArray[i];
            [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:model.image] forState:UIControlStateNormal];
            [self.myScrollView addSubview:btn];
        }
    }
}

- (void)clickBtn:(UIButton *)btn
{
    NSInteger index = btn.tag-200;
    
    if (self.clickBlock) {
        if (self.type == LinkTypeMarrow) {
            
            //精选作品
            CommunityMarrowModel *model = self.dataArray[index];
            
            self.clickBlock(model.mId, LinkTypeMarrow);
            
        }else if (self.type == LinkTypeTopic) {
            
            //专题
            CommunityTopicDetailModel *model = self.dataArray[index];
            
            self.clickBlock(model.user_id, LinkTypeMarrow);
        }
        
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
