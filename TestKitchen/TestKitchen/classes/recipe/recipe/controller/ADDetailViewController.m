//
//  ADDetailViewController.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ADDetailViewController.h"
#import "ADDetailModel.h"
#import "ADDetailVideoCell.h"
#import "ADDetailDescCell.h"
#import "ADDetailSerialCell.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "ADCommentModel.h"
#import "ADCommentCell.h"

@interface ADDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

//数据
@property (nonatomic,strong)ADDetailModel *detailModel;
//表格
@property (nonatomic,strong)UITableView *tbView;
//当前选择了第几集
@property (nonatomic,assign)NSInteger selectedIndex;
//当前集数的cell是展开还是收起
@property (nonatomic,assign)BOOL isExpand;

//评论数据
@property (nonatomic,strong)ADCommentModel *commentModel;
//分页
//是否正在加载
@property (nonatomic,assign)BOOL isLoading;
//当前的页数
@property (nonatomic,assign)NSInteger curPage;
//最大的数据量
@property (nonatomic,assign)NSInteger maxNum;


@end

@implementation ADDetailViewController

//创建表格
- (void)createTableView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreenW, kScreenH-64) style:UITableViewStylePlain];
    self.tbView.dataSource = self;
    self.tbView.delegate = self;
    //设置背景颜色
    self.tbView.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    [self.view addSubview:self.tbView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //表格
    [self createTableView];
    
    //下载数据
    [self downloadData];
    
    //评论
    self.curPage = 1;
    [self downloadCommentData];
    
    //返回按钮
    [self addNavBtnImages:@[@"nav_back_black"] target:self action:@selector(backAction) isLeft:YES];
    
    
    
    
}
- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

//下载评论的数据
- (void)downloadCommentData
{
    
    //进入下载状态
    self.isLoading = YES;
    
    //methodName=CommentList&page=1&relate_id=22&size=10&token=&type=2&user_id=&version=4.32
    //参数
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"CommentList" forKey:@"methodName"];
    //当前第几页
    NSString *page = [NSString stringWithFormat:@"%ld",self.curPage];
    [dict setObject:page forKey:@"page"];
    [dict setObject:self.serialId forKey:@"relate_id"];
    [dict setObject:@"10" forKey:@"size"];
    [dict setObject:@"2" forKey:@"type"];
    
    __weak typeof(self) weakSelf = self;
    [KTCDownloader postWithUrlString:kHostUrl params:dict success:^(NSData *data) {
        //JOSN解析
        ADCommentModel *curModel = [[ADCommentModel alloc] initWithData:data error:nil];
        if (self.curPage == 1) {
            //评论的第一页
            self.commentModel = curModel;
        }else{
            //加载更多
            [self.commentModel.data.data addObjectsFromArray:curModel.data.data];
        }
        
        //刷新UI
        [weakSelf performSelectorOnMainThread:@selector(refreshComment) withObject:nil waitUntilDone:NO];
    } failBlock:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
    
}

//评论
- (void)refreshComment {
    
    //结束下载
    self.isLoading = NO;
    
    //刷新setion == 1的所有cell
    //NSIndexSet *ist = [NSIndexSet indexSetWithIndex:1];
    //[self.tbView reloadSections:ist withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tbView reloadData];
}

//下载数据
- (void)downloadData
{
    
    //参数
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"CourseSeriesView" forKey:@"methodName"];
    [dict setObject:self.serialId forKey:@"series_id"];
    
    //请求数据
    __weak typeof(self) weakSelf = self;
    [KTCDownloader postWithUrlString:kHostUrl params:dict success:^(NSData *data) {
        weakSelf.detailModel = [[ADDetailModel alloc] initWithData:data error:nil];
        //        NSLog(@"%@",weakSelf.detailModel);
        
        //刷新表格
        [self performSelectorOnMainThread:@selector(refreshUI) withObject:nil waitUntilDone:NO];
        
    } failBlock:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

- (void)refreshUI
{
    NSArray *array = [self.detailModel.data.series_name componentsSeparatedByString:@"#"];
    if (array.count > 1) {
        [self addNavTitle:array[1]];
    }
    
    
    [self.tbView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rowNum = 0;
    if (section == 0) {
        if (self.detailModel) {
            //数据下载结束显示3行
            rowNum = 3;
        }
        
    }else{
        //评论
        if (self.commentModel) {
            //数据下载回来显示对应行数
            rowNum = self.commentModel.data.data.count;
        }
    }
    return rowNum;
}

//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat h = 0;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            //视频播放
            h = 180;
        }else if (indexPath.row == 1){
            //描述文字
            ADDetailDataCourseModel *model = self.detailModel.data.data[self.selectedIndex];
            h = [ADDetailDescCell heightWithModel:model];
        }else if (indexPath.row == 2) {
            //集数
            h = [ADDetailSerialCell heightWithNum:self.detailModel.data.data.count isExpand:self.isExpand];
        }
        
    }
    else if (indexPath.section == 1){
        //评论
        ADCommentDataDetailModel *model = self.commentModel.data.data[indexPath.row];
        h = [ADCommentCell heightWithModel:model];
        
    }
    return h;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        //评论
        if (self.commentModel) {
            return 60;
        }
        
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        //评论
        
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 60)];
        bgView.backgroundColor = [UIColor whiteColor];
        
        //评论数
        NSString *str = [NSString stringWithFormat:@"%@条评论",self.commentModel.data.total];
        UILabel *label = [KTCUtil createLabelText:str font:[UIFont systemFontOfSize:17] textColor:[UIColor grayColor] textAlignment:NSTextAlignmentLeft];
        label.frame = CGRectMake(20, 0, 200, 20);
        
        [bgView addSubview:label];
        //按钮
        
        UIButton *btn = [KTCUtil createBtnTitle:@"我要评论" imageName:@"navBtn_bag" selectImageName:nil target:self action:@selector(commentAction)];
        btn.frame = CGRectMake(20, 20, kScreenW-40, 30);
        
        btn.titleLabel.textColor = [UIColor whiteColor];
        btn.layer.cornerRadius = 6;
        btn.backgroundColor = [UIColor orangeColor];
        [bgView addSubview:btn];
        
        return bgView;
        
    }
    return nil;
}
- (void)commentAction
{}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //去掉tableView的粘滞性
    CGFloat h = 60;
    if (scrollView.contentOffset.y > 0 && scrollView.contentOffset.y <= h) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }else if (scrollView.contentOffset.y > h) {
        scrollView.contentInset = UIEdgeInsetsMake(-h, 0, 0, 0);
    }
    
    
    //如果正在下载,不去下载下一页
    if (self.isLoading) {
        return;
    }
    //如果是最后一页，也不去加载下一页
    //没有更多了
    if (self.commentModel.data.total.intValue == self.commentModel.data.data.count) {
        return;
    }
    
    //加载更多
    //滑动到表格最底部距离20的y值的地方，开始加载更多
    if (scrollView.contentOffset.y > scrollView.contentSize.height-scrollView.bounds.size.height - 20) {
        //下载下一页
        self.curPage++;
        [self downloadCommentData];
    }
    
}


//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            //视频播放的cell
            cell = [self createVideoCellForTableView:tableView atIndexPath:indexPath];
        }else if (indexPath.row == 1){
            //描述文字
            cell = [self createDescCellForTableView:tableView atIndexPath:indexPath];
        }else if (indexPath.row == 2){
            //集数
            cell = [self createSerialCellForTableView:tableView atIndexPath:indexPath];
        }
    }
    else{
        //评论
        cell = [self createCommentCellForTableView:tableView atIndexPath:indexPath];
    }
    return cell;
}

//评论的cell
- (UITableViewCell *)createCommentCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"commentCellId";
    ADCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ADCommentCell" owner:nil options:nil] lastObject];
    }
    //显示数据
    ADCommentDataDetailModel *model = self.commentModel.data.data[indexPath.row];
    [cell configModel:model];
    return cell;
}

//集数的cell
- (UITableViewCell *)createSerialCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"serialCellID";
    ADDetailSerialCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[ADDetailSerialCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    //设置刷新事件
    __weak typeof(self) weakSelf = self;
    cell.expandBlock = ^(BOOL isExpand){
        //赋值
        weakSelf.isExpand = isExpand;
        
        //刷新表格的当前行
        [weakSelf.tbView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    };
    
    //设置选中某一集的事件
    cell.serialBlock = ^(NSInteger serialIndex){
        
        //修改选中的集数
        weakSelf.selectedIndex = serialIndex;
        
        //刷新表格
        NSIndexPath *ip1 = [NSIndexPath indexPathForRow:0 inSection:0];
        NSIndexPath *ip2 = [NSIndexPath indexPathForRow:1 inSection:0];
        NSArray *array = @[ip1, ip2];
        [weakSelf.tbView reloadRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationAutomatic];
    };
    
    //设置cell的属性
    cell.selectSerialIndex = self.selectedIndex;
    
    //设置当前是展开还是收起
    cell.isExpand = self.isExpand;
    
    //显示数据
    cell.num = self.detailModel.data.data.count;
    return cell;
}

//描述文字的cell
- (UITableViewCell *)createDescCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"descCellId";
    ADDetailDescCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[ADDetailDescCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    //显示数据
    ADDetailDataCourseModel *model = self.detailModel.data.data[self.selectedIndex];
    cell.model = model;
    return cell;
}

//视频播放的cell
- (UITableViewCell *)createVideoCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"videoCellId";
    ADDetailVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ADDetailVideoCell" owner:nil options:nil] lastObject];
    }
    
    //设置点击事件
    __weak typeof(self) weakSelf = self;
    cell.videoBlock = ^(NSString *urlString){
        AVPlayerViewController *videoCtrl = [[AVPlayerViewController alloc] init];
        //设置播放网址
        AVPlayer *player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:urlString]];
        videoCtrl.player = player;
        
        //播放
        [videoCtrl.player play];
        //显示
        [weakSelf presentViewController:videoCtrl animated:YES completion:nil];
    };
    
    //显示数据
    ADDetailDataCourseModel *model = self.detailModel.data.data[self.selectedIndex];
    cell.courseModel = model;
    
    cell.playNum = self.detailModel.data.play;
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
