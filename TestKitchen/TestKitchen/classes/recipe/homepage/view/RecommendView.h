//
//  RecommendView.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecommendModel;
@interface RecommendView : UIView

@property (nonatomic,strong)RecommendModel *rModel;

//点击事件
@property (nonatomic,strong)void (^clickBlock)(NSString *urlString,NSString *title ,LinkType type);

@end
