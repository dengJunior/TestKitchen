//
//  CommunityTalentCell.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CommunityTalentModel;
@interface CommunityTalentCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;

//点击事件
@property (nonatomic,strong)void (^clickBlock)(NSString *urlString, LinkType type);

//显示数据
@property (nonatomic, strong)NSArray *talentArray;

@end



@interface TalentBtn : UIControl

- (void)configModel:(CommunityTalentModel *)model;

@end

