//
//  RecommendSelectCell.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecommendDataWidgetListModel;
@interface RecommendSelectCell : UITableViewCell
- (IBAction)clickBtn:(UIButton *)sender;
- (IBAction)clickUserBtn:(UIButton *)sender;

//显示数据
@property (nonatomic,strong)RecommendDataWidgetListModel *listModel;

//点击事件
@property (nonatomic,strong)void (^clickBlock)(NSString *urlString,NSString *title ,LinkType type);

@end
