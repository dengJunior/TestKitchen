//
//  LikeHeaderView.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LikeHeaderView.h"

@implementation LikeHeaderView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //设置背景颜色
        self.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
        
        
        //输入框
        UITextField *textField = [KTCUtil createTextField:@"输入菜名或食材搜索" leftImageName:@"search1" rightImageName:nil];
        textField.delegate = self;
        [self addSubview:textField];
        
        
        WS(ws)
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(ws).with.insets(UIEdgeInsetsMake(8, 40, 8, 40));
        }];
        
        
        
    }
    return self;
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if (self.clickBlock) {
        self.clickBlock(nil, nil, LinkTypeSearch);
    }
    
    return NO;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
