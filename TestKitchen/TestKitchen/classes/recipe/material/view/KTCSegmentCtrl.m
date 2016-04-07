//
//  KTCSegmentCtrl.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "KTCSegmentCtrl.h"

@interface KTCSegmentCtrl ()

@property (nonatomic,strong)UIView *lineView;

@end

@implementation KTCSegmentCtrl


- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray
{
    if (self = [super initWithFrame:frame]) {
        
        //循环创建按钮
        CGFloat w = self.bounds.size.width/titleArray.count;
        
        for (int i=0; i<titleArray.count; i++) {
            KTCSegmentBtn *btn = [[KTCSegmentBtn alloc] initWithFrame:CGRectMake(w*i, 0, w, self.bounds.size.height-10)];
            [btn configName:titleArray[i]];
            btn.tag = 100+i;
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }
        
        self.lineView = [KTCUtil createUIView];
        self.lineView.backgroundColor = [UIColor orangeColor];
        self.lineView.frame = CGRectMake(0, self.bounds.size.height-2, w, 2);
        [self addSubview:self.lineView];
        
        self.selectedIndex = 0;
    }
    return self;
}

-(void)setSelectedIndex:(NSInteger)selectedIndex
{
    
    if (_selectedIndex != selectedIndex) {
        //取消之前按钮的选中
        KTCSegmentBtn *oldBtn = [self viewWithTag:100+_selectedIndex];
        oldBtn.clicked = NO;
        
        _selectedIndex = selectedIndex;
        
        KTCSegmentBtn *curBtn = [self viewWithTag:100+selectedIndex];
        curBtn.clicked = YES;
        
        
        [UIView animateWithDuration:0.05 animations:^{
            CGRect frame = self.lineView.frame;
            frame.origin.x = frame.size.width*selectedIndex;
            self.lineView.frame = frame;
        }];
        
        

    }
    

}

- (void)clickBtn:(KTCSegmentBtn *)btn
{
    NSInteger index = btn.tag-100;
    
    self.selectedIndex = index;
    
    if (self.delegate) {
        
        [self.delegate didSelectSegCtrlAtIndex:index];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@interface KTCSegmentBtn ()

@property (nonatomic,strong)UILabel *titleLabel;

@end

@implementation KTCSegmentBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //文字
        self.titleLabel = [KTCUtil createLabelText:nil font:[UIFont boldSystemFontOfSize:20] textColor:[UIColor grayColor] textAlignment:NSTextAlignmentCenter];
        self.titleLabel.frame = self.bounds;
        [self addSubview:self.titleLabel];
    }
    return self;
}

-(void)setClicked:(BOOL)clicked
{
    _clicked = clicked;
    
    if (clicked) {
        self.titleLabel.textColor = [UIColor blackColor];
    }else{
        self.titleLabel.textColor = [UIColor grayColor];
    }
}

- (void)configName:(NSString *)name
{
    self.titleLabel.text = name;
}


@end


