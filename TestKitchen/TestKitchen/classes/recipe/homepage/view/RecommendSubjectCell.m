//
//  RecommendSubjectCell.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RecommendSubjectCell.h"
#import "RecommendModel.h"
#import "UIImageView+WebCache.h"

@implementation RecommendSubjectCell

-(void)setModelArray:(NSArray *)modelArray
{
    _modelArray = modelArray;
    
    //图片
    if (modelArray.count > 0) {
        RecommendWidgetDataModel *imageModel = modelArray[0];
        if ([imageModel.type isEqualToString:@"image"]) {
            [self.topImageView sd_setImageWithURL:[NSURL URLWithString:imageModel.content]];
        }
        
    }
    
    //名字
    if (modelArray.count > 1) {
        RecommendWidgetDataModel *model = modelArray[1];
        if ([model.type isEqualToString:@"text"]) {
            self.nameLabel.text = model.content;
        }
        
    }
    
    //描述文字
    if (modelArray.count > 2) {
        RecommendWidgetDataModel *model = modelArray[2];
        if ([model.type isEqualToString:@"text"]) {
            self.descLabel.text = model.content;
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
