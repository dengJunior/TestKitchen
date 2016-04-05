//
//  RecommendMasterCell.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RecommendMasterCell.h"
#import "UIImageView+WebCache.h"
#import "RecommendModel.h"

@implementation RecommendMasterCell

- (void)setModelArray:(NSArray *)modelArray
{
    _modelArray = modelArray;
    
    //图片
    if (modelArray.count > 0) {
        RecommendWidgetDataModel *imageModel = modelArray[0];
        if ([imageModel.type isEqualToString:@"image"]) {
            [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:imageModel.content]];
        }
    }
    
    //名字
    if (modelArray.count > 1) {
        RecommendWidgetDataModel *textModel = modelArray[1];
        if ([textModel.type isEqualToString:@"text"]) {
            self.nameLabel.text = textModel.content;
        }
    }
    
    //描述
    if (modelArray.count > 2) {
        RecommendWidgetDataModel *textModel = modelArray[2];
        if ([textModel.type isEqualToString:@"text"]) {
            self.descLabel.text = textModel.content;
        }
    }
    
    //粉丝
    if (modelArray.count > 3) {
        RecommendWidgetDataModel *textModel = modelArray[3];
        if ([textModel.type isEqualToString:@"text"]) {
            self.fansNumLabel.text = textModel.content;
        }
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
