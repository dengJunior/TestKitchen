//
//  ADDetailDescCell.h
//  TestKitchen_1524
//
//  Created by gaokunpeng on 16/3/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ADDetailDataCourseModel;
@interface ADDetailDescCell : UITableViewCell

//显示数据
@property (nonatomic,strong)ADDetailDataCourseModel *model;
//计算行高
+ (CGFloat)heightWithModel:(ADDetailDataCourseModel *)model;

@end
