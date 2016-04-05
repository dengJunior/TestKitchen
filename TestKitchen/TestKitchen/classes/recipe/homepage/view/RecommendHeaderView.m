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
        
        //白色背景
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 8, kScreenW, 36)];
        bgView.backgroundColor = [UIColor whiteColor];
        [self addSubview:bgView];
        
        //文字
        //宽度
        CGFloat w = [title boundingRectWithSize:CGSizeMake(320, 36) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} context:nil].size.width;
        
        //200
        //20+20
        CGFloat x = (kScreenW-w-20-20)/2;
        
        UILabel *titleLabel = [KTCUtil createLabelText:title font:[UIFont systemFontOfSize:20] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentRight];
        titleLabel.frame = CGRectMake(x, 0, w, 36);
        [bgView addSubview:titleLabel];
        
        //图片
        UIImageView *rightImageView = [KTCUtil createImageView:@"more_icon"];
        rightImageView.frame = CGRectMake(x+w+20, 8, 20, 20);
        [bgView addSubview:rightImageView];
        
        
        self.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
        
        
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
