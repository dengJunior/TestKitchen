//
//  RecommendADCell.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RecommendADCell.h"
#import "UIImageView+WebCache.h"
#import "RecommendModel.h"


@implementation RecommendADCell


-(void)setBannerArray:(NSArray *)bannerArray
{
    _bannerArray = bannerArray;
    
    //删除之前的子视图
    [self.myScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    WS(ws)
    UIView *containerView = [KTCUtil createUIView];
    [self.myScrollView addSubview:containerView];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.myScrollView);
        //高度一定要设置
        make.height.equalTo(ws.myScrollView.mas_height);
    }];
    
    //循环创建图片
    UIView *lastView = nil;
    for (int i=0; i<bannerArray.count; i++) {
        RecommendDataBannerModel *model = bannerArray[i];
        
        //图片
        UIImageView *tmpImageView = [KTCUtil createImageView:nil];
        [tmpImageView sd_setImageWithURL:[NSURL URLWithString:model.banner_picture]];
        [containerView addSubview:tmpImageView];
        
        //添加点击手势
        tmpImageView.userInteractionEnabled = YES;
        tmpImageView.tag = 100+i;
        UITapGestureRecognizer *g = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [tmpImageView addGestureRecognizer:g];
        
        //约束
        [tmpImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.bottom.equalTo(containerView);
            make.width.mas_equalTo(kScreenW);
            if (lastView == nil) {
                make.left.equalTo(containerView);
            }else{
                make.left.equalTo(lastView.mas_right);
            }
        }];
        
        lastView = tmpImageView;
        
    }
    
    //修改容器视图的大小
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lastView.mas_right);
    }];
    
    //设置分页控制器页数
    self.pageCtrl.numberOfPages = bannerArray.count;
    
    self.myScrollView.pagingEnabled = YES;
    self.myScrollView.delegate = self;
    
    
}


- (void)tapAction:(UIGestureRecognizer *)g
{
    NSInteger index = g.view.tag-100;
    
    RecommendDataBannerModel *bannerModel = self.bannerArray[index];
    
    if (self.clickBlock) {
        self.clickBlock(bannerModel.banner_link, LinkTypeFoodCourseSerial);
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UIScrollView代理
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/scrollView.bounds.size.width;
    
    self.pageCtrl.currentPage = index;
}



@end
