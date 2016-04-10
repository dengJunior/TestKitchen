//
//  ADDetailVideoCell.m
//  TestKitchen_1524
//
//  Created by gaokunpeng on 16/3/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ADDetailVideoCell.h"
#import "UIImageView+WebCache.h"
#import "ADDetailModel.h"

@implementation ADDetailVideoCell

-(void)setPlayNum:(NSNumber *)playNum
{
    _playNum = playNum;
    
    self.numLabel.text = [NSString stringWithFormat:@"%@人做过",playNum];
}

-(void)setCourseModel:(ADDetailDataCourseModel *)courseModel
{
    _courseModel = courseModel;
    
    //显示数据
    //图片
    [self.serialImageView sd_setImageWithURL:[NSURL URLWithString:courseModel.course_image]];
//    //文字
//    self.numLabel.text = courseModel.episode.stringValue;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//播放视频
- (IBAction)clickBtn:(id)sender {
    
    if (self.videoBlock) {
        self.videoBlock(self.courseModel.course_video);
    }
    
}
@end
