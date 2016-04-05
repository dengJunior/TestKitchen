//
//  RecommendHeaderView.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RecommendHeaderView.h"

@interface RecommendHeaderView ()

@property (nonatomic,strong)UILabel *titleLabel;

@end

@implementation RecommendHeaderView


- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title
{
    if (self = [super initWithFrame:frame]) {
        
        //背景白色视图
        UIView *bgView = [KTCUtil createUIView];
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.frame = CGRectMake(0, 16, kScreenW, 28);
        [self addSubview:bgView];
        
        //文字
        self.titleLabel = [KTCUtil createLabelText:nil font:[UIFont systemFontOfSize:20] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentRight];
        self.titleLabel.frame = CGRectMake(kScreenW-280, 0, 160, 28);
        [bgView addSubview:self.titleLabel];
        
        //图片
        UIImageView *imgView = [KTCUtil createImageView:@"more_icon"];
        imgView.frame = CGRectMake(kScreenW-80, 0, 40, 40);
        [bgView addSubview:imgView];
        
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
