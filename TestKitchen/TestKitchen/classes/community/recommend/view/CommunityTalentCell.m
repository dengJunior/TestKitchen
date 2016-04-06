//
//  CommunityTalentCell.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CommunityTalentCell.h"
#import "CommunityRecommendModel.h"
#import "UIImageView+WebCache.h"


@implementation CommunityTalentCell


-(void)setTalentArray:(NSArray *)talentArray
{
    _talentArray = talentArray;
    
    //删除之前的子视图
    [self.myScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //循环创建按钮
    CGFloat w = 40;
    CGFloat space = 20;
    CGFloat h = 90;
    for (int i=0; i<talentArray.count; i++) {
        
        TalentBtn *btn = [[TalentBtn alloc] initWithFrame:CGRectMake((w+space)*i, 0, w, h)];
        btn.tag = 200+i;
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.myScrollView addSubview:btn];
        
        
        CommunityTalentModel *model = self.talentArray[i];
        [btn configModel:model];
        
    }
    
    //设置滚动范围
    self.myScrollView.contentSize = CGSizeMake((w+space)*talentArray.count, 90);
}

- (void)clickBtn:(TalentBtn *)btn
{
    NSInteger index = btn.tag-200;
    
    CommunityTalentModel *model = self.talentArray[index];
    
    if (self.clickBlock) {
        self.clickBlock(model.user_id, LinkTypeUser);
    }
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end


@interface TalentBtn ()

@property (nonatomic,strong)UIImageView *imgView;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *fansLabel;

@end

@implementation TalentBtn


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //图片
        self.imgView = [KTCUtil createImageView:nil];
        self.imgView.frame = CGRectMake(0, 0, 40, 40);
        [self addSubview:self.imgView];
        
        //名字
        self.nameLabel = [KTCUtil createLabelText:nil font:[UIFont systemFontOfSize:17] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter];
        self.nameLabel.frame = CGRectMake(0, 50, 40, 20);
        [self addSubview:self.nameLabel];
        
        //粉丝数
        self.fansLabel = [KTCUtil createLabelText:nil font:[UIFont systemFontOfSize:12] textColor:[UIColor grayColor] textAlignment:NSTextAlignmentCenter];
        self.fansLabel.frame = CGRectMake(0, 70, 40, 20);
        [self addSubview:self.fansLabel];
        
        
        
    }
    return self;
}


- (void)configModel:(CommunityTalentModel *)model
{
    //图片
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.head_img]];
    
    //名字
    self.nameLabel.text = model.nick;
    
    //粉丝数
    self.fansLabel.text = [NSString stringWithFormat:@"粉丝:%@", model.tongji_be_follow];
    
    
}



@end
