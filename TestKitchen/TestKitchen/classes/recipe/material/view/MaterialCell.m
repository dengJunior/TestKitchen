//
//  MaterialCell.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MaterialCell.h"
#import "MaterialModel.h"
#import "UIImageView+WebCache.h"

@implementation MaterialCell

-(void)setTypeModel:(MaterialTypeModel *)typeModel
{
    _typeModel = typeModel;
    
    //先删除之前的子视图
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //添加新的视图
    CGFloat titleH = 44;//标题高度
    CGFloat btnH = 40;//按钮高度
    CGFloat space = 10;//间距
    
    //计算按钮宽度
    CGFloat btnW = (kScreenW-6*space)/5;
    
    //标题
    UILabel *titleLabel = [KTCUtil createLabelText:typeModel.text font:[UIFont systemFontOfSize:20] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft];
    titleLabel.frame = CGRectMake(10, 0, 240, titleH);
    [self.contentView addSubview:titleLabel];
    
    //图片
    UIImageView *leftImageView = [KTCUtil createImageView:nil];
    leftImageView.frame = CGRectMake(space, titleH, btnW*2+space, btnH*2+space);
    [leftImageView sd_setImageWithURL:[NSURL URLWithString:typeModel.image]];
    [self.contentView addSubview:leftImageView];
    
    for (int i=0; i<typeModel.data.count; i++) {
        
        CGRect frame = CGRectZero;
        if (i < 6) {
            int row = i/3;
            int col = i%3;
            frame = CGRectMake((space+btnW)*2+space+(space+btnW)*col, titleH+(space+btnH)*row, btnW, btnH);
            
        }else{
            int row = (i-6)/5;
            int col = (i-6)%5;
            frame = CGRectMake(space+(space+btnW)*col, titleH+(space+btnH)*(row+2), btnW, btnH);
        }
        
        //创建按钮
        MaterialTypeBtn *btn = [[MaterialTypeBtn alloc] initWithFrame:frame];
        MaterialSubtypeModel *subModel = typeModel.data[i];
        [btn configName:subModel.text];
        //点击事件
        btn.tag = 200+i;
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
        
    }
    
}

- (void)clickBtn:(MaterialTypeBtn *)btn
{
    NSInteger index = btn.tag-200;
    
    MaterialSubtypeModel *subModel = self.typeModel.data[index];
    if (self.clickBlock) {
        self.clickBlock(subModel.sId);
    }
}

+(CGFloat)heightWithTypeModel:(MaterialTypeModel *)typeModel
{
    CGFloat titleH = 44;//标题高度
    CGFloat btnH = 40;//按钮高度
    CGFloat space = 10;//间距
    
    //先计算有几行
    //小于6个都显示两行
    NSInteger row = 2;
    if (typeModel.data.count > 6) {
        
        row += (typeModel.data.count-6)/5;
        if ( (typeModel.data.count-6)%5 > 0 ) {
            row ++;
        }
    }
    
    return titleH+(btnH+space)*row+20;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

@interface MaterialTypeBtn ()

@property (nonatomic,strong)UILabel *titleLabel;

@end

@implementation MaterialTypeBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //文字
        self.titleLabel = [KTCUtil createLabelText:nil font:[UIFont systemFontOfSize:16] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter];
        self.titleLabel.frame = self.bounds;
        self.titleLabel.numberOfLines = 0;
        
        [self addSubview:self.titleLabel];
        
        //修改背景颜色
        self.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    }
    return self;
}

-(void)configName:(NSString *)subTypeName
{
    self.titleLabel.text = subTypeName;
}


@end
