//
//  KTCUtil.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KTCUtil : NSObject

//创建按钮
+ (UIButton *)createBtnTitle:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName target:(id)target action:(SEL)action;
//创建标签
+ (UILabel *)createLabelText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignement;
//创建图片
+ (UIImageView *)createImageView:(NSString *)imageName;
//创建视图
+ (UIView *)createUIView;
//文本输入框
+ (UITextField *)createTextField:(NSString *)placeHolder leftImageName:(NSString *)leftImageName rightImageName:(NSString *)rightImageName;



@end
