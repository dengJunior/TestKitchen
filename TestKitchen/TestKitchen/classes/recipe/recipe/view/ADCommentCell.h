//
//  ADCommentCell.h
//  TestKitchen_1524
//
//  Created by gaokunpeng on 16/3/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ADCommentDataDetailModel;
@interface ADCommentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
- (IBAction)clickBtn:(id)sender;

//显示数据
- (void)configModel:(ADCommentDataDetailModel *)model;

//计算cell的高度
+ (CGFloat)heightWithModel:(ADCommentDataDetailModel *)model;

@end
