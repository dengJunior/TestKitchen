//
//  FoodCell.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FoodDataDetailModel;
@interface FoodCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *foodImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *descLabel;

- (void)configModel:(FoodDataDetailModel *)model;

@end
