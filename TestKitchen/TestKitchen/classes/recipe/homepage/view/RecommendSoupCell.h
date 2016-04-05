//
//  RecommendSoupCell.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecommendSoupCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (weak, nonatomic) IBOutlet UILabel *playLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteLabel;
- (IBAction)clickLeft:(id)sender;

//显示数据
@property (nonatomic,strong)NSArray *modelArray;

//点击事件
@property (nonatomic,strong)void (^clickBlock)(NSString *urlString,LinkType type);

@end
