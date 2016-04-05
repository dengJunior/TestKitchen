//
//  MaterialView.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MaterialView.h"
#import "MaterialModel.h"
#import "MaterialCell.h"

@interface MaterialView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tbView;

@end

@implementation MaterialView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //表格
        self.tbView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tbView.delegate = self;
        self.tbView.dataSource = self;
        [self addSubview:self.tbView];
        
        //约束
        WS(ws)
        [self.tbView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(ws);
        }];
    }
    return self;
}

-(void)setModel:(MaterialModel *)model
{
    _model = model;
    
    [self.tbView reloadData];
}

#pragma mark - UITableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.model.data.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MaterialTypeModel *typeModel = self.model.data.data[indexPath.row];
    return [MaterialCell heightWithTypeModel:typeModel];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";

    MaterialCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[MaterialCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    //点击事件
    cell.clickBlock = self.clickBlock;
    
    //显示数据
    MaterialTypeModel *typeModel = self.model.data.data[indexPath.row];
    cell.typeModel = typeModel;
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
