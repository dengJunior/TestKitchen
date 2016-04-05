//
//  RecommendMasterCell.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecommendMasterCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansNumLabel;

//显示数据
@property (nonatomic,strong)NSArray *modelArray;

@end
