//
//  MaterialCell.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MaterialTypeModel;
@interface MaterialCell : UITableViewCell

//点击事件
@property (nonatomic,strong) void(^clickBlock)(NSString *mId);
//显示数据
@property (nonatomic,strong)MaterialTypeModel *typeModel;

//计算高度
+ (CGFloat)heightWithTypeModel:(MaterialTypeModel *)typeModel;

@end


//每个食材的按钮
@interface MaterialTypeBtn : UIControl

- (void)configName:(NSString *)subTypeName;

@end



