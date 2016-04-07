//
//  FoodCell.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "FoodCell.h"
#import "FoodModel.h"
#import "UIImageView+WebCache.h"

@implementation FoodCell


-(void)configModel:(FoodDataDetailModel *)model
{
    //图片
    [self.foodImageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    
    //名字
    NSArray *array = [model.series_name componentsSeparatedByString:@"#"];
    if (array.count > 1) {
        self.nameLabel.text = array[1];
    }
    
    //描述
    NSString *descString = [NSString stringWithFormat:@"%@ %@/%@集  %@人做过",[array firstObject],model.episode, model.episode_sum,model.play];
    self.descLabel.text = descString;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
