//
//  ADDetailSerialCell.m
//  TestKitchen_1524
//
//  Created by gaokunpeng on 16/3/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ADDetailSerialCell.h"

@implementation ADDetailSerialCell


-(void)setNum:(NSInteger)num
{
    _num = num;
    
    //先删除之前的子视图
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //首先计算应该显示多少集
    NSInteger showNumber = num;

    if (self.isExpand) {
        //展开
        showNumber = num;
    }else{
        //收起
        if (num > 16) {
            showNumber = 16;
        }else{
            showNumber = num;
        }
    }
    //下面的代码等价于上面的代码
    //    if (self.isExpand == NO && num > 16) {
    //        showNumber = 16;
    //    }
    
    
    //循环创建按钮
    CGFloat w = 40;       //按钮宽度
    CGFloat h = 40;       //按钮高度
    CGFloat offsetX = 20; //横向偏移量
    CGFloat space = 2;    //左右和上下两个按钮之间的间距
    for (int i=0; i<showNumber; i++) {
        //行
        int row = i/8;
        //列
        int col = i%8;
        //frame
        CGRect frame = CGRectMake(offsetX+col*(w+space), row*(h+space), w, h);
        ADDetailSerialButton *btn = [[ADDetailSerialButton alloc] initWithFrame:frame];
        
        //设置tag值
        btn.tag = 300+i;
        //设置选中状态
        if (self.selectSerialIndex == i) {
            btn.clicked = YES;
        }else{
            btn.clicked = NO;
        }
        
        //点击事件
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.text = [NSString stringWithFormat:@"%d", i];
        [self.contentView addSubview:btn];
    }
    
    //展开按钮
    //判断是否显示展开或者收起的按钮
    BOOL hasExpandBtn = NO;
    if (num > 16) {
        hasExpandBtn = YES;
    }
    //按钮的图片
    if (hasExpandBtn) {
        
        NSString *imageName = @"pull.png";
        if (self.isExpand==YES) {
            imageName = @"push.png";
        }
        
        //一共多少行
        NSInteger rowNum = showNumber/8;
        if (showNumber % 8 > 0) {
            rowNum++;
        }
        CGFloat y = (h+space)*rowNum;
        UIButton *btn = [KTCUtil createBtnTitle:nil imageName:imageName selectImageName:nil target:self action:@selector(expandAction)];
        btn.frame = CGRectMake((kScreenW-40)/2, y+10, 40, 20);
       
        [self.contentView addSubview:btn];

    }
    
}

- (void)expandAction
{
    //展开或者收起的操作
    
    //1.切换展开和收起的状态
    self.isExpand = !self.isExpand;
    
    //2.刷新表格的当前行
    if (self.expandBlock) {
        self.expandBlock(self.isExpand);
    }
}

- (void)clickBtn:(ADDetailSerialButton *)btn
{
    //取消选中之前的按钮
    ADDetailSerialButton *lastBtn = (ADDetailSerialButton *)[self.contentView viewWithTag:300+self.selectSerialIndex];
    lastBtn.clicked = NO;

    
    //选中当前点击的按钮
    btn.clicked = YES;
    
    //修改当前选中的序号
    self.selectSerialIndex = btn.tag-300;
    
    //刷新表格
    if (self.serialBlock) {
        self.serialBlock(self.selectSerialIndex);
    }
}

//计算高度
+ (CGFloat)heightWithNum:(NSInteger)num isExpand:(BOOL)isExpand
{

    CGFloat h = 40;       //按钮高度
    CGFloat space = 2;    //左右和上下两个按钮之间的
    
    //有多少行显示多少行
    NSInteger rowNum = num/8;
    if (num % 8 > 0) {
        rowNum++;
    }
    
    //只显示两行
    if (isExpand==NO && num > 16) {
        rowNum = 2;
    }
    //30是展开按钮高度
    CGFloat btnH = 0;
    if (num > 16) {
        btnH = 30;
    }
    
    //20是cell与下面cell的偏移量
    return (h+space)*rowNum + btnH + 20;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end


@implementation ADDetailSerialButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //标题
        self.titleLabel = [KTCUtil createLabelText:nil font:[UIFont systemFontOfSize:14] textColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentCenter];
        self.titleLabel.frame = self.bounds;
        [self addSubview:self.titleLabel];
        
        //设置背景颜色
        self.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    }
    return self;
}

-(void)setClicked:(BOOL)clicked
{
    _clicked = clicked;
    
    if (clicked) {
        //选中
        self.titleLabel.textColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor orangeColor];
    }else{
        //取消选中
        self.titleLabel.textColor = [UIColor lightGrayColor];
        self.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    }
}

@end
