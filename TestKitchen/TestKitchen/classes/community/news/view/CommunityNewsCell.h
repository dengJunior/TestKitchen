//
//  CommunityNewsCell.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CommunityNewsDetailModel;
@interface CommunityNewsCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *topImageView;


@property (weak, nonatomic) IBOutlet UIButton *userBtn;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *agreeLabel;

- (IBAction)clickUserBtn:(id)sender;

//点击用户
@property (nonatomic,strong)void (^clickUserBlock)(NSString *userId);


//显示数据
@property (nonatomic,strong)CommunityNewsDetailModel *detailModel;

@end
