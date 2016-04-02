//
//  RecipeViewController.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RecipeViewController.h"
#import "RecommendModel.h"
#import "RecommendView.h"

@interface RecipeViewController ()


@property (nonatomic,strong)UIScrollView *scrollView;


//首页推荐
@property (nonatomic,strong)RecommendModel *recommendModel;
@property (nonatomic,strong)RecommendView *recommendView;

//首页食材

//首页分类



@end

@implementation RecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //首页视图
    [self createHomePageView];
    
    
    
    //下载食材首页推荐的数据
    [self downloadRecommendData];
}


- (void)createHomePageView
{
    
    WS(ws)
    self.scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:self.scrollView];
    
    UIView *container = [KTCUtil createUIView];
    [self.scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.scrollView);
    }];
    
   
    //约束
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws).with.insets(UIEdgeInsetsMake(64, 0, 49, 0));
    }];
    
    
    //首页推荐
    self.recommendView = [[RecommendView alloc] init];
    [container addSubview:self.recommendView];
    [self.recommendView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.and.left.equalTo(container);
        make.width.mas_equalTo(kScreenW);
    }];
    
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.recommendView.mas_right);
    }];
    
    
}

//下载食材首页推荐的数据
- (void)downloadRecommendData
{
    NSDictionary *dict = @{@"methodName":@"SceneHome"};
    
    WS(ws)
    [KTCDownloader postWithUrlString:kHostUrl params:dict success:^(NSData *data) {
       //JSON解析
        ws.recommendModel = [[RecommendModel alloc] initWithData:data error:nil];
        
        //在主线程修改UI
        [ws performSelectorOnMainThread:@selector(showRecommendView) withObject:nil waitUntilDone:NO];
        
    } failBlock:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
}

- (void)showRecommendView
{
    self.recommendView.rModel = self.recommendModel;
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
