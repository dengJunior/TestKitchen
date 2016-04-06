//
//  CommunityTopicCell.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommunityTopicCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *typeImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;

//类型
@property (nonatomic,assign)LinkType type;

//点击事件
@property (nonatomic,strong)void (^clickBlock)(NSString *urlString, LinkType type);

//显示数据
@property (nonatomic,strong)NSArray *dataArray;


@end
