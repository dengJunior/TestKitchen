//
//  CommunityRecommendView.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CommunityRecommendModel;
@interface CommunityRecommendView : UIView

//点击事件
@property (nonatomic,strong)void (^clickBlock)(NSString *urlString, LinkType type);

//显示数据
@property (nonatomic,strong)CommunityRecommendModel *model;

@end
