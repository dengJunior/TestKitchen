//
//  CommunityNewsView.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CommunityNewsView.h"
#import "CommunityNewsCell.h"
#import "CommunityNewsModel.h"

#define    kNewsCellID    (@"communityNewsCellId")

@interface CommunityNewsView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong)UICollectionView *collView;

@end

@implementation CommunityNewsView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //创建网格视图
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0);
        layout.minimumInteritemSpacing = 6;
        layout.minimumLineSpacing = 10;
        layout.itemSize = CGSizeMake((kScreenW-6)/2, 220);
        
        self.collView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        self.collView.delegate = self;
        self.collView.dataSource = self;
        self.collView.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
        [self.collView registerNib:[UINib nibWithNibName:@"CommunityNewsCell" bundle:nil] forCellWithReuseIdentifier:kNewsCellID];
        [self addSubview:self.collView];
        
        
    }
    return self;
}


-(void)setNewsModel:(CommunityNewsModel *)newsModel
{
    _newsModel = newsModel;
    
    [self.collView reloadData];
}

#pragma mark - UICollectionView代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.newsModel.data.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CommunityNewsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kNewsCellID forIndexPath:indexPath];
    
    //显示数据
    CommunityNewsDetailModel *detailModel = self.newsModel.data.data[indexPath.item];
    
    cell.detailModel = detailModel;
    
    cell.backgroundColor = [UIColor whiteColor];
    return cell;

}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CommunityNewsDetailModel *detailModel = self.newsModel.data.data[indexPath.item];
    
    if (self.cellClickBlock) {
        self.cellClickBlock(detailModel.dId);
    }
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
