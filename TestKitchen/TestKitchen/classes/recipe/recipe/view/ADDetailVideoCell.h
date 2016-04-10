//
//  ADDetailVideoCell.h
//  TestKitchen_1524
//
//  Created by gaokunpeng on 16/3/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ADDetailDataCourseModel;
@interface ADDetailVideoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *serialImageView;
- (IBAction)clickBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;

//显示数据
@property (nonatomic,strong)ADDetailDataCourseModel *courseModel;
//播放数量
@property (nonatomic,assign)NSNumber *playNum;

//按钮的点击事件
@property (nonatomic,strong)void (^videoBlock)(NSString *urlString);


@end
