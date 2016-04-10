//
//  ShoppingMallViewController.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ShoppingMallViewController.h"
#import "AppDelegate.h"
#import "MainTabBarController.h"

@interface ShoppingMallViewController ()

@end

@implementation ShoppingMallViewController


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //显示tabBar
    AppDelegate *appDele = (AppDelegate *)[UIApplication sharedApplication].delegate;
    MainTabBarController *mainTabBar = (MainTabBarController *)appDele.window.rootViewController;
    [mainTabBar showTabBar];
    
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    //隐藏tabBar
    AppDelegate *appDele = (AppDelegate *)[UIApplication sharedApplication].delegate;
    MainTabBarController *mainTabBar = (MainTabBarController *)appDele.window.rootViewController;
    [mainTabBar hideTabBar];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
