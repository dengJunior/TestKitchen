//
//  CommunityFollowView.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CommunityNewsModel;
@interface CommunityFollowView : UIView

@property (nonatomic,strong)CommunityNewsModel *newsModel;

//点击进入用户界面
@property (nonatomic,strong)void (^userBlock)(NSString *userId);


//下拉刷新
@property (nonatomic,strong) void(^refreshBlock)(BOOL isHeader);

//结束刷新
- (void)endRefresh;

@end
