//
//  RecommendSceneCell.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RecommendSceneCell.h"
#import "RecommendModel.h"
#import "UIButton+WebCache.h"

@implementation RecommendSceneCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setListModel:(RecommendDataWidgetListModel *)listModel
{
    _listModel = listModel;
    
    //左边图片
    if (listModel.widget_data.count > 3) {
        //图片
        RecommendWidgetDataModel *imageModel = listModel.widget_data[0];
        if ([imageModel.type isEqualToString:@"image"]) {
            UIButton *typeBtn = (UIButton *)[self.contentView viewWithTag:100];
            [typeBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:imageModel.content] forState:UIControlStateNormal];
        }
        //标题
        RecommendWidgetDataModel *titleModel = listModel.widget_data[1];
        if ([titleModel.type isEqualToString:@"text"]) {
            UILabel *titleLabel = (UILabel *)[self.contentView viewWithTag:110];
            titleLabel.text = titleModel.content;
        }
        //数量
        RecommendWidgetDataModel *numModel = listModel.widget_data[2];
        if ([numModel.type isEqualToString:@"text"]) {
            UILabel *numLabel = (UILabel *)[self.contentView viewWithTag:120];
            numLabel.text = numModel.content;
        }
        
    }
    
    //右边图片
    for (int i=3; i<11; i+=2) {
        //列数
        int j = (i-3)/2;
        
        //图片
        RecommendWidgetDataModel *imageModel = listModel.widget_data[i];
        if ([imageModel.type isEqualToString:@"image"]) {
            UIButton *btn = (UIButton *)[self.contentView viewWithTag:200+j];
            [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:imageModel.content] forState:UIControlStateNormal];
        }
        
    }
    
    //描述文字
    UILabel *descLabel = (UILabel *)[self.contentView viewWithTag:400];
    descLabel.text = listModel.desc;
    
    
    
}

- (IBAction)clickTypeBtn:(id)sender {
    
    if (self.listModel.widget_data.count > 0) {
        RecommendWidgetDataModel *imageModel = self.listModel.widget_data[0];
        if ([imageModel.type isEqualToString:@"image"] && [imageModel.link rangeOfString:@"app://scene"].location != NSNotFound) {
            if (self.clickBlock) {
                self.clickBlock(imageModel.link, LinkTypeScene);
            }
        }
    }
    
}

- (IBAction)clickBtn:(UIButton *)sender {
    NSInteger index = sender.tag-200;
    
    if (self.listModel.widget_data.count > 3+index*2) {
        RecommendWidgetDataModel *imageModel = self.listModel.widget_data[3+index*2];
        if ([imageModel.type isEqualToString:@"image"] && [imageModel.link rangeOfString:@"app://dish"].location != NSNotFound) {
            if (self.clickBlock) {
                self.clickBlock(imageModel.link, LinkTypeDish);
            }
        }
    }
    
}

- (IBAction)playAction:(UIButton *)sender {
    NSInteger index = sender.tag-300;
    
    if (self.listModel.widget_data.count > 3+index*2+1) {
        RecommendWidgetDataModel *imageModel = self.listModel.widget_data[3+index*2+1];
        if ([imageModel.type isEqualToString:@"video"]) {
            if (self.clickBlock) {
                self.clickBlock(imageModel.content, LinkTypeVideo);
            }
        }
    }
}
@end
