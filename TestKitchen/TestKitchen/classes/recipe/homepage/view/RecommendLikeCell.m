//
//  RecommendLikeCell.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RecommendLikeCell.h"
#import "RecommendModel.h"
#import "UIImageView+WebCache.h"

@implementation RecommendLikeCell


-(void)setModel:(RecommendDataWidgetListModel *)model
{
    _model = model;
    
    //循环显示图片和文字
    for (int i=0; i<model.widget_data.count; i++) {
        //获取序号
        int j= i/2;
        
        RecommendWidgetDataModel *widgetModel = model.widget_data[i];
        if ([widgetModel.type isEqualToString:@"image"]) {
            UIImageView *imgView = (UIImageView *)[self.contentView viewWithTag:200+j];
            [imgView sd_setImageWithURL:[NSURL URLWithString:widgetModel.content]];
        }else if ([widgetModel.type isEqualToString:@"text"]) {
            UILabel *label = (UILabel *)[self.contentView viewWithTag:300+j];
            label.text = widgetModel.content;
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
    
    NSInteger index = sender.tag - 100;
    
    if (self.model.widget_data.count > index*2) {
        RecommendWidgetDataModel *imageModel = self.model.widget_data[index*2];
        if ([imageModel.type isEqualToString:@"image"]) {
            if (self.clickBlock) {
                if ([imageModel.link hasSuffix:@".html"]) {
                    //网页
                    self.clickBlock(imageModel.link, LinkTypeHTML);
                }else if ([imageModel.link rangeOfString:@"app://foodmatch"].location != NSNotFound) {
                    //食材搭配
                    self.clickBlock(imageModel.link,LinkTypeFoodMatch);
                }else if ([imageModel.link rangeOfString:@"app://scenelist"].location != NSNotFound) {
                    //场景菜谱
                    self.clickBlock(imageModel.link,LinkTypeSceneList);
                }else if ([imageModel.link rangeOfString:@"app://favorites"].location != NSNotFound) {
                    //猜你喜欢
                    self.clickBlock(imageModel.link,LinkTypeFavorites);
                }
                
            }
        }
    }
    
    
    
    
    
}
@end
