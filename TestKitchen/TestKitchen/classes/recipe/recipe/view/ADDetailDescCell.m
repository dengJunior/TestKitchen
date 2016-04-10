//
//  ADDetailDescCell.m
//  TestKitchen_1524
//
//  Created by gaokunpeng on 16/3/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ADDetailDescCell.h"
#import "ADDetailModel.h"


@interface ADDetailDescCell ()
//标题
@property (nonatomic,strong)UILabel *titleLabel;
//描述文字
@property (nonatomic,strong)UILabel *descLabel;
@end

@implementation ADDetailDescCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //标题
        self.titleLabel = [KTCUtil createLabelText:nil font:[UIFont systemFontOfSize:17] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft];
        self.titleLabel.frame = CGRectMake(20, 0, 200, 20);
        
        [self.contentView addSubview:self.titleLabel];
        //描述
        self.descLabel = [KTCUtil createLabelText:nil font:[UIFont systemFontOfSize:14] textColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentLeft];
        self.descLabel.frame = CGRectMake(20, 30, kScreenW-20*2, 0);
        
        [self.contentView addSubview:self.descLabel];
    }
    return self;
}

//计算行高
+ (CGFloat)heightWithModel:(ADDetailDataCourseModel *)model
{
    CGFloat h = 30;
    /*
     第一个参数:文字显示的最大范围
     第二个参数:文字的显示方式
     第三个参数:文字的显示属性(字体大小)
     第四个参数:上下文(nil)
     */
    CGFloat descH = [model.course_subject boundingRectWithSize:CGSizeMake(335, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height;
    
    return h+descH+20;
}

//显示数据
-(void)setModel:(ADDetailDataCourseModel *)model
{
    _model = model;
    //标题
    self.titleLabel.text = model.course_name;
    //描述文字
    self.descLabel.text = model.course_subject;
    self.descLabel.numberOfLines = 0;
    
    //设置frame
    CGFloat h = [model.course_subject boundingRectWithSize:CGSizeMake(335, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height;
    CGRect frame = self.descLabel.frame;
    frame.size.height = h;
    self.descLabel.frame = frame;
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
