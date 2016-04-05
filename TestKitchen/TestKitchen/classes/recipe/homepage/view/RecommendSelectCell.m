//
//  RecommendSelectCell.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RecommendSelectCell.h"
#import "UIButton+WebCache.h"
#import "RecommendModel.h"

@implementation RecommendSelectCell

-(void)setListModel:(RecommendDataWidgetListModel *)listModel
{
    _listModel = listModel;
    
    for (int i=0; i<listModel.widget_data.count; i+=3) {
        int j = i/3;
        //图片
        RecommendWidgetDataModel *imageModel = listModel.widget_data[i];
        if ([imageModel.type isEqualToString:@"image"]) {
            UIButton *btn = (UIButton *)[self.contentView viewWithTag:100+j];
            [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:imageModel.content] forState:UIControlStateNormal];
        }
        
        //用户图片
        RecommendWidgetDataModel *userImageModel = listModel.widget_data[i+1];
        if ([userImageModel.type isEqualToString:@"image"]) {
            UIButton *btn = (UIButton *)[self.contentView viewWithTag:200+j];
            [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:userImageModel.content] forState:UIControlStateNormal];
            btn.layer.cornerRadius = 20;
        }
        
        //用户名
        RecommendWidgetDataModel *userNameModel = listModel.widget_data[i+2];
        if ([userNameModel.type isEqualToString:@"text"]) {
            UILabel *label = (UILabel *)[self.contentView viewWithTag:300+j];
            label.text = userNameModel.content;
        }
        
    }
    
    //描述文字
    UILabel *descLabel = (UILabel *)[self.contentView viewWithTag:400];
    descLabel.text = listModel.desc;
    
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
    
    if (self.listModel.widget_data.count > 3*index) {
        RecommendWidgetDataModel *imageModel = self.listModel.widget_data[3*index];
        if ([imageModel.type isEqualToString:@"image"] && [imageModel.link rangeOfString:@"app://post"].location != NSNotFound) {
            if (self.clickBlock) {
                self.clickBlock(imageModel.link, LinkTypePost);
            }
        }
        
    }
}

- (IBAction)clickUserBtn:(UIButton *)sender {
    
    NSInteger index = sender.tag-200;
    
    if (self.listModel.widget_data.count > 3*index+1) {
        RecommendWidgetDataModel *imageModel = self.listModel.widget_data[3*index+1];
        if ([imageModel.type isEqualToString:@"image"] && [imageModel.link rangeOfString:@"app://talent"].location != NSNotFound) {
            if (self.clickBlock) {
                self.clickBlock(imageModel.link, LinkTypeTalent);
            }
        }
        
    }
}
@end
