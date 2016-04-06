//
//  CommunityNewsView.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CommunityNewsModel;
@interface CommunityNewsView : UIView

//点击用户
@property (nonatomic,strong)void (^clickUserBlock)(NSString *userId);

//点击cell的事件
@property (nonatomic,strong)void (^cellClickBlock)(NSString *workId);

//显示数据
@property (nonatomic,strong)CommunityNewsModel *newsModel;

@end
