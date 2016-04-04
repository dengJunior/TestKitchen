//
//  FoodRecordCell.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "FoodRecordCell.h"
#import "UIButton+WebCache.h"
#import "RecommendModel.h"

@implementation FoodRecordCell


-(void)setListModel:(RecommendDataWidgetListModel *)listModel
{
    _listModel = listModel;
    
    
    for (int i=0; i<listModel.widget_data.count; i++) {
        RecommendWidgetDataModel *model = listModel.widget_data[i];
        
        if ([model.type isEqualToString:@"image"]) {
            UIButton *btn = (UIButton *)[self.contentView viewWithTag:100+i];
            [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:model.content] forState:UIControlStateNormal];
            
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
    
    if (self.listModel.widget_data.count > index) {
        RecommendWidgetDataModel *model = self.listModel.widget_data[index];
        if (self.clickBlock) {
            if ([model.link rangeOfString:@"app://food_course_series"].location != NSNotFound) {
                self.clickBlock(model.link, LinkTypeFoodCourseSerial);
            }
        }
        
    }
    
}
@end
