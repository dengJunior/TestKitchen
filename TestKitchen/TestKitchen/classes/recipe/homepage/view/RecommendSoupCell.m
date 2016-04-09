//
//  RecommendSoupCell.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RecommendSoupCell.h"
#import "RecommendModel.h"
#import "UIImageView+WebCache.h"

@implementation RecommendSoupCell


-(void)setModelArray:(NSArray *)modelArray
{
    _modelArray = modelArray;
    
    //左边图片
    if (modelArray.count > 0) {
        RecommendWidgetDataModel *imageModel = modelArray[0];
        if ([imageModel.type isEqualToString:@"image"]) {
            [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:imageModel.content]];
        }
    }
    
    //标题
    if (modelArray.count > 2) {
        RecommendWidgetDataModel *textModel = modelArray[2];
        if ([textModel.type isEqualToString:@"text"]) {
            self.nameLabel.text = textModel.content;
        }
    }
    
    //描述
    if (modelArray.count > 3) {
        RecommendWidgetDataModel *textModel = modelArray[3];
        if ([textModel.type isEqualToString:@"text"]) {
            self.descLabel.text = textModel.content;
        }
    }

    //播放
    if (modelArray.count > 4) {
        RecommendWidgetDataModel *textModel = modelArray[4];
        if ([textModel.type isEqualToString:@"video"]) {
            self.playLabel.text = textModel.content;
        }
    }
    
    //星级
    if (modelArray.count > 5) {
        RecommendWidgetDataModel *textModel = modelArray[5];
        if ([textModel.type isEqualToString:@"video"]) {
            self.favoriteLabel.text = textModel.content;
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

- (IBAction)clickLeft:(id)sender {
    
    if (self.modelArray.count > 1) {
        RecommendWidgetDataModel *videoModel = self.modelArray[1];
        if ([videoModel.type isEqualToString:@"video"]) {
            if (self.clickBlock) {
                self.clickBlock(videoModel.content, nil,LinkTypeVideo);
            }
        }
    }
    
}
@end
