//
//  ADCommentCell.m
//  TestKitchen_1524
//
//  Created by gaokunpeng on 16/3/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ADCommentCell.h"
#import "UIImageView+WebCache.h"
#import "ADCommentModel.h"

@implementation ADCommentCell

-(void)configModel:(ADCommentDataDetailModel *)model
{
    //图片
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:model.head_img]];
    self.userImageView.layer.cornerRadius = 30;
    self.userImageView.layer.masksToBounds = YES;
    
    //用户名
    self.nameLabel.text = model.nick;
    
    //评论文字
    //计算文字的高度
    CGFloat h = [model.content boundingRectWithSize:CGSizeMake(220, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size.height;
    //修改frame
    CGRect commentFrame = self.commentLabel.frame;
    commentFrame.size.height = h;
    self.commentLabel.frame = commentFrame;
    //修改文字
    self.commentLabel.text = model.content;
    self.commentLabel.numberOfLines = 0;
    
    //时间
    self.timeLabel.text = model.create_time;
    //修改位置
    CGRect timeFrame = self.timeLabel.frame;
    timeFrame.origin.y = commentFrame.origin.y+commentFrame.size.height+5;
    self.timeLabel.frame = timeFrame;
    
}

+(CGFloat)heightWithModel:(ADCommentDataDetailModel *)model
{
    CGFloat y = 30;
    
    //计算评论文字的高度
    CGFloat h = [model.content boundingRectWithSize:CGSizeMake(220, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size.height;
    
    y += (h + 30);
    
    return y;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)clickBtn:(id)sender {
}
@end
