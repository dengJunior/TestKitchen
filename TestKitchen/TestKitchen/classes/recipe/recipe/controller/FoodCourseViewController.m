//
//  FoodCourseViewController.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "FoodCourseViewController.h"

@interface FoodCourseViewController ()

@end

@implementation FoodCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //导航
    [self createMyNav];
    
    //下载数据
    [self downloadData];
}

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

//导航
- (void)createMyNav
{
    //返回按钮
    [self addBackBtnTarget:self action:@selector(backAction)];
    
    //标题
    [self addNavTitle:self.seriesTitle];
    
    //
}

//下载数据
- (void)downloadData
{
    
    //methodName=CourseSeriesView&series_id=22&token=&user_id=&version=4.32
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"CourseSeriesView" forKey:@"methodName"];
    [dict setObject:self.seriesId forKey:@"series_id"];
    
    [KTCDownloader postWithUrlString:kHostUrl params:dict success:^(NSData *data) {
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",str);
    } failBlock:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
    
    
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
