//
//  KTCSegmentCtrl.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KTCSegmentCtrlDelegate <NSObject>

- (void)didSelectSegCtrlAtIndex:(NSInteger)index;

@end

@interface KTCSegmentCtrl : UIView


- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray;

//代理
@property (nonatomic,weak)id<KTCSegmentCtrlDelegate> delegate;

//选中的序号
@property (nonatomic,assign)NSInteger selectedIndex;


@end


@interface KTCSegmentBtn : UIControl

@property (nonatomic,assign)BOOL clicked;

//显示文字
- (void)configName:(NSString *)name;

@end
