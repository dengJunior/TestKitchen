//
//  CommunityFollowCell.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CommunityNewsDetailModel;
@interface CommunityFollowCell : UITableViewCell

- (IBAction)clickUserBtn:(id)sender;

- (IBAction)clickBtn:(UIButton *)sender;

@property (nonatomic,strong)CommunityNewsDetailModel *model;

@property (weak, nonatomic) IBOutlet UIImageView *topImageView;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *userBtn;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *agreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentViewHCons;

//评论视图
@property (weak, nonatomic) IBOutlet UIView *commentView;

@property (weak, nonatomic) IBOutlet UIButton *agreeBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;



//点击进入用户界面
@property (nonatomic,strong)void (^userBlock)(NSString *userId);


//返回cell的高度
+ (CGFloat)heightWithModel:(CommunityNewsDetailModel *)model;

@end
