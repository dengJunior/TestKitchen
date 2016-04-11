//
//  FoodMatchCell.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MaterialSubtypeModel;
@interface FoodMatchCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *typeImageView;

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;


//显示数据
- (void)configModel:(MaterialSubtypeModel *)typeModel;

@end
