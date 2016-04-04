//
//  KTCUtil.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "KTCUtil.h"

@implementation KTCUtil

+(UIButton *)createBtnTitle:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (imageName) {
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    if (selectImageName) {
        [btn setBackgroundImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
    }
    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
    
}

+ (UILabel *)createLabelText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignement
{
    UILabel *label = [[UILabel alloc] init];
    if (text) {
        label.text = text;
    }
    if (font) {
        label.font = font;
    }
    if (textColor) {
        label.textColor = textColor;
    }
    label.textAlignment = textAlignement;
    return label;
}

+ (UIImageView *)createImageView:(NSString *)imageName
{
    UIImageView *imgView = [[UIImageView alloc] init];
    if (imageName) {
        imgView.image = [UIImage imageNamed:imageName];
    }
    return imgView;
}

+(UIView *)createUIView
{
    UIView *aView = [[UIView alloc] init];
    return aView;
}

+(UITextField *)createTextField:(NSString *)placeHolder leftImageName:(NSString *)leftImageName rightImageName:(NSString *)rightImageName
{
    UITextField *textField = [[UITextField alloc] init];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = placeHolder;
    
    if (leftImageName) {
        UIImageView *leftImageView = [self createImageView:leftImageName];
        leftImageView.frame = CGRectMake(4, 4, 16, 16);
        textField.leftViewMode = UITextFieldViewModeAlways;
        textField.leftView = leftImageView;
    }
    
    if (rightImageName) {
        UIImageView *rightImageView = [self createImageView:rightImageName];
        rightImageView.frame = CGRectMake(4, 4, 16, 16);
        textField.leftViewMode = UITextFieldViewModeAlways;
        textField.leftView = rightImageView;
    }

    
    return textField;
}




@end
