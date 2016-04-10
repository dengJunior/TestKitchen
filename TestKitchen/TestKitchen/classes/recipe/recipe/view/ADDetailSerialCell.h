//
//  ADDetailSerialCell.h
//  TestKitchen_1524
//
//  Created by gaokunpeng on 16/3/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADDetailSerialCell : UITableViewCell

//设置集数
@property (nonatomic,assign)NSInteger num;

//当前选中的按钮序号
@property (nonatomic,assign)NSInteger selectSerialIndex;

//当前是收起还是展开状态
@property (nonatomic,assign)BOOL isExpand;

//展开或收起时表格的操作
@property (nonatomic,strong)void (^expandBlock)(BOOL isExpand);

//选中某一集的block
@property (nonatomic,strong) void(^serialBlock)(NSInteger serialIndex);

//返回cell的高度
/*
 @param num:一共多少集
 @param isExpand:是否展开
 */
+ (CGFloat)heightWithNum:(NSInteger)num isExpand:(BOOL)isExpand;

@end

//每一集的按钮
@interface ADDetailSerialButton : UIControl

@property (nonatomic,strong)UILabel *titleLabel;

//设置选中状态
@property (nonatomic,assign)BOOL clicked;

@end
