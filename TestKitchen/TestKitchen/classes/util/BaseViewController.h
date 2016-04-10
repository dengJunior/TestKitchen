//
//  BaseViewController.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

//导航标题
- (void)addNavTitle:(NSString *)title;
//导航按钮
- (void)addNavBtnImages:(NSArray *)imageArray target:(id)target action:(SEL)action isLeft:(BOOL)isLeft;

//返回按钮
- (void)addBackBtnTarget:(id)target action:(SEL)action;

@end
