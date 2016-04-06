//
//  CommunityActivityCell.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommunityActivityCell : UITableViewCell<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageCtrl;


//点击事件
@property (nonatomic,strong)void (^clickBlock)(NSString *urlString, LinkType type);

//显示数据
@property (nonatomic,strong)NSArray *activityArray;

@end
