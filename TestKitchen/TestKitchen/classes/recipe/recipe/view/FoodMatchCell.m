//
//  FoodMatchCell.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "FoodMatchCell.h"
#import "UIImageView+WebCache.h"
#import "MaterialModel.h"

@implementation FoodMatchCell

- (void)configModel:(MaterialSubtypeModel *)typeModel
{
    [self.typeImageView sd_setImageWithURL:[NSURL URLWithString:typeModel.image]];
    
    self.typeLabel.text = typeModel.text;
    
   
}

- (void)awakeFromNib {
    // Initialization code
}


@end
