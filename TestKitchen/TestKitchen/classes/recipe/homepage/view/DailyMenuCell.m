//
//  DailyMenuCell.m
//  TestKitchen_1526
//
//  Created by gaokunpeng on 16/4/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "DailyMenuCell.h"
#import "RecommendModel.h"
#import "UIImageView+WebCache.h"

@implementation DailyMenuCell

-(void)setListModel:(RecommendDataWidgetListModel *)listModel
{
    _listModel = listModel;
    
    //显示图片和文字
    for (int i=0; i<12; i+=4) {
        //计算当前的列数
        int j = i/4;
        
        //图片
        RecommendWidgetDataModel *imageModel = listModel.widget_data[i];
        if ([imageModel.type isEqualToString:@"image"]) {
            UIImageView *imgView = (UIImageView *)[self.contentView viewWithTag:200+j];
            [imgView sd_setImageWithURL:[NSURL URLWithString:imageModel.content]];
        }
        
        //视频
        //标题
        RecommendWidgetDataModel *titleModel = listModel.widget_data[i+2];
        if ([titleModel.type isEqualToString:@"text"]) {
            UILabel *nameLabel = (UILabel *)[self.contentView viewWithTag:300+j];
            nameLabel.text = titleModel.content;
        }
        //描述
        RecommendWidgetDataModel *descModel = listModel.widget_data[i+3];
        if ([descModel.type isEqualToString:@"text"]) {
            UILabel *descLabel = (UILabel *)[self.contentView viewWithTag:400+j];
            descLabel.text = descModel.content;
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

- (IBAction)clickBtn:(UIButton *)sender {
    
    NSInteger index = sender.tag-100;
    
    if (self.listModel.widget_data.count > index*4) {
        RecommendWidgetDataModel *widgetModel = self.listModel.widget_data[index*4];
        if ([widgetModel.type isEqualToString:@"image"]) {
            if (self.clickBlock && [widgetModel.link rangeOfString:@"app://dish"].location != NSNotFound) {
                self.clickBlock(widgetModel.link, LinkTypeDish);
            }
        }
    }
    
}

- (IBAction)playAction:(UIButton *)sender {
    
    NSInteger index = sender.tag-100;
    if (self.listModel.widget_data.count > index*4+1) {
        RecommendWidgetDataModel *widgetModel = self.listModel.widget_data[index*4+1];
        if ([widgetModel.type isEqualToString:@"video"]) {
            if (self.clickBlock) {
                self.clickBlock(widgetModel.content, LinkTypeVideo);
            }
        }
    }
}
@end
