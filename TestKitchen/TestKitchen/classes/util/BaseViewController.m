//
//  BaseViewController.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)addNavTitle:(NSString *)title
{
    UILabel *label = [KTCUtil createLabelText:title font:[UIFont boldSystemFontOfSize:20] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter];
    label.frame = CGRectMake(0, 0, kScreenW-160, 44);
    self.navigationItem.titleView = label;
}


- (void)addNavBtnImage:(NSString *)imageName target:(id)target action:(SEL)action isLeft:(BOOL)isLeft
{
    UIButton *btn = [KTCUtil createBtnTitle:nil imageName:imageName selectImageName:nil target:target action:action];
    btn.frame = CGRectMake(0, 8, 32, 32);
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    if (isLeft) {
        self.navigationItem.leftBarButtonItem = item;
    }else{
        self.navigationItem.rightBarButtonItem = item;
    }
    
}


-(void)addBackBtnTarget:(id)target action:(SEL)action
{
    
    [self addNavBtnImage:@"nav_back_black" target:target action:action isLeft:YES];
    
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
