//
//  FoodMatchViewController.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "FoodMatchViewController.h"
#import "FoodMatchCell.h"
#import "MaterialModel.h"

@interface FoodMatchViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate>

//子类型列表
@property (nonatomic, strong)UICollectionView *subTypeView;

//选中大类型的序号
@property (nonatomic, assign)NSInteger selectedTypeIndex;


//类型列表
@property (nonatomic, strong)UITableView *typeView;

//按钮
@property (nonatomic, strong)UIButton *guideBtn;

//遮罩视图
@property (nonatomic, strong)UIView *maskView;

@end

@implementation FoodMatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //导航
    [self createMyNav];
    
    
    //显示数据
    [self createTypeView];

    
}


- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

//导航
- (void)createMyNav
{
    [self addBackBtnTarget:self action:@selector(backAction)];
    
    [self addNavTitle:@"食材搭配"];
}

- (void)createTypeView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    layout.minimumInteritemSpacing = 20;
    layout.minimumLineSpacing = 20;
    layout.itemSize = CGSizeMake((kScreenW-20*5)/4.0f, 80);
    
    
    self.subTypeView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.subTypeView.delegate = self;
    self.subTypeView.dataSource = self;
    [self.subTypeView registerNib:[UINib nibWithNibName:@"FoodMatchCell" bundle:nil] forCellWithReuseIdentifier:@"foodMatchCellId"];
    self.subTypeView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.subTypeView];
    
    //约束
    WS(ws)
    [self.subTypeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view).with.insets(UIEdgeInsetsMake(64, 0, 50, 0));
    }];
    
    
    //后边的按钮
    self.guideBtn = [KTCUtil createBtnTitle:nil imageName:@"material_guide_bg03" selectImageName:nil target:self action:@selector(showGuide:)];
    [self.view addSubview:self.guideBtn];
    [self.guideBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.right.equalTo(ws.view);
        make.size.mas_equalTo(CGSizeMake(20, 60));
    }];
    
    //图片
    UIImageView *arrowImageView = [KTCUtil createImageView:@"ArrowLeft"];
    arrowImageView.tag = 200;
    [self.guideBtn addSubview:arrowImageView];
    
    [arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.guideBtn);
        make.size.mas_equalTo(CGSizeMake(10, 24));
    }];
    
}


- (void)showGuide:(UIButton *)btn
{
    //显示类型列表
    if (self.typeView) {
        [self hideTypeView];
    }else{
        [self showTypeView];
    }
}


- (void)showTypeView
{
    
    self.typeView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.typeView.delegate = self;
    self.typeView.dataSource = self;
    [self.view addSubview:self.typeView];
    
    //约束
    WS(ws)
    [self.typeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.view.mas_right);
        make.top.equalTo(ws.view).with.offset(64);
        make.bottom.equalTo(ws.view).with.offset(-50);
        make.width.mas_equalTo(160);
    }];
    
    
    [UIView animateWithDuration:0.01 animations:^{
        [ws.typeView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(ws.view);
            make.top.equalTo(ws.view).with.offset(64);
            make.bottom.equalTo(ws.view).with.offset(-50);
            make.width.mas_equalTo(200);
        }];
        
        [ws.guideBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(ws.view);
            make.right.mas_equalTo(ws.typeView.mas_left);
            make.size.mas_equalTo(CGSizeMake(20, 60));
        }];
        
        //修改图片
        UIImageView *arrowImageView = (UIImageView *)[ws.guideBtn viewWithTag:200];
        arrowImageView.image = [UIImage imageNamed:@"ArrowRight"];
        
    }];
}

- (void)hideTypeView
{

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    MaterialTypeModel *typeModel = self.materialModel.data.data[self.selectedTypeIndex];
    return typeModel.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    FoodMatchCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"foodMatchCellId" forIndexPath:indexPath];
    
    //数据
    MaterialTypeModel *typeModel = self.materialModel.data.data[self.selectedTypeIndex];
    MaterialSubtypeModel *model = typeModel.data[indexPath.item];
    
    [cell configModel:model];
    
    return cell;
    
}

#pragma mark - UITableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.materialModel.data.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    //显示文字
    MaterialTypeModel *typeModel = self.materialModel.data.data[indexPath.row];
    cell.textLabel.text = typeModel.text;
    
    if (indexPath.row == self.selectedTypeIndex) {
        cell.textLabel.textColor = [UIColor orangeColor];
    }
    
    return cell;
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
