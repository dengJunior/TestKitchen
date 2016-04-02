//
//  MainTabBarController.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

//自定制tabbar的背景视图
@property (nonatomic,strong)UIView *bgTabView;

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建视图控制器
    [self createViewControllers];
    
    //自定制tabbar
    [self createMyTabbar];
}

//自定制tabbar
- (void)createMyTabbar
{
    self.bgTabView = [KTCUtil createUIView];
    self.bgTabView.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    [self.view addSubview:self.bgTabView];
    
    //约束
    WS(ws)
    [self.bgTabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(ws.view);
        make.bottom.equalTo(ws.view);
        make.height.mas_equalTo(49);
    }];
    
    
    //循环创建按钮
    NSArray *imageArray = @[@"home_normal",@"community_normal",@"shop_normal",@"shike_normal",@"mine_normal"];
    NSArray *sImageArray = @[@"home_select",@"community_select",@"shop_select",@"shike_select",@"mine_select"];
    NSArray *nameArray = @[@"食材",@"社区",@"商城",@"食课",@"我的"];
    
    CGFloat w = kScreenW/imageArray.count;
    for (int i=0; i<imageArray.count; i++) {
        //按钮
        UIButton *btn = [KTCUtil createBtnTitle:nil imageName:imageArray[i] selectImageName:sImageArray[i] target:self action:@selector(clickBtn:)];
        btn.tag = 200+i;
        [self.bgTabView addSubview:btn];
        
        //文字
        UILabel *label = [KTCUtil createLabelText:nameArray[i] font:[UIFont systemFontOfSize:10] textColor:[UIColor grayColor] textAlignment:NSTextAlignmentCenter];
        label.tag = 300;
        [btn addSubview:label];
        
        if (i == 0) {
            //默认选中第一个
            btn.selected = YES;
            label.textColor = [UIColor orangeColor];
        }
        
        
        //添加约束
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.bottom.equalTo(ws.bgTabView);
            make.width.mas_equalTo(w);
            make.left.mas_equalTo(w*i);
        }];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(btn);
            make.bottom.equalTo(btn).with.offset(-4);
            make.height.mas_equalTo(12);
        }];
    }
    
   
}

- (void)clickBtn:(UIButton *)btn
{
    NSInteger index = btn.tag-200;
    //取消之前的选中
    UIButton *lastBtn = (UIButton *)[self.bgTabView viewWithTag:200+self.selectedIndex];
    lastBtn.selected = NO;
    UILabel *lastLabel = (UILabel *)[lastBtn viewWithTag:300];
    lastLabel.textColor = [UIColor grayColor];
    
    //选中当前的按钮
    btn.selected = YES;
    UILabel *curLabel = (UILabel *)[btn viewWithTag:300];
    curLabel.textColor = [UIColor orangeColor];
    
    self.selectedIndex = index;
    
}

//创建视图控制器
- (void)createViewControllers
{
    NSArray *nameArray = @[@"RecipeViewController",@"CommunityViewController",@"ShoppingMallViewController",@"FoodViewController",@"MineViewController"];
    NSMutableArray *ctrlArray = [NSMutableArray array];
    
    for (int i=0; i<nameArray.count; i++) {
        Class cls = NSClassFromString(nameArray[i]);
        
        UIViewController *vc = [[cls alloc] init];
        UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:vc];
        [ctrlArray addObject:navCtrl];
    }
    self.viewControllers = ctrlArray;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
