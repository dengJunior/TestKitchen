//
//  RecommendSceneCell.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecommendDataWidgetListModel;
@interface RecommendSceneCell : UITableViewCell

- (IBAction)clickTypeBtn:(id)sender;
- (IBAction)clickBtn:(UIButton *)sender;

- (IBAction)playAction:(UIButton *)sender;

//点击事件
@property (nonatomic,strong)void (^clickBlock)(NSString *urlString,LinkType type);

//显示数据
@property (nonatomic,strong)RecommendDataWidgetListModel *listModel;

@end
