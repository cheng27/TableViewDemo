//
//  ViewController.m
//  01-TabieViewDemo
//
//  Created by qingyun on 15/12/2.
//  Copyright (c) 2015年 阿六. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *datas;

@end

@implementation ViewController

- (NSArray *)datas
{
    if (_datas == nil) {
        _datas = @[@"花花",@"橙橙",@"香香",@"佑佑"];
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建UITableView
    UITableView *TableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:TableView];
    
    //设置数据源
    TableView.dataSource = self;
    //设置代理
    TableView.delegate = self;
    
    //设置tableView的背景视图
    UIImageView *baImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    baImg.image = [UIImage imageNamed:@"5.jpg"];
    TableView.backgroundView = baImg;
    
    //设置tableView的头视图
    UILabel *headerView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    headerView.backgroundColor = [UIColor colorWithRed:178/255.0 green:92/255.0 blue:88/255.0 alpha:1];
    headerView.text = @"TableViewHeaderView";
    headerView.textAlignment = NSTextAlignmentCenter;
    headerView.font = [UIFont boldSystemFontOfSize:25];
    TableView.tableHeaderView = headerView;
    //设置tableView的尾视图
    UILabel *footerView = [[UILabel alloc] initWithFrame:CGRectMake(0, 567, self.view.frame.size.width, 100)];
    footerView.backgroundColor = [UIColor colorWithRed:87/255.0 green:51/255.0 blue:172/255.0 alpha:1];
    footerView.text = @"TableViewFooterView";
    footerView.textAlignment = NSTextAlignmentCenter;
    footerView.font = [UIFont boldSystemFontOfSize:25];
    TableView.tableFooterView = footerView;
    
    //设置section的头尾视图的宽高
    /*
     注意:设置头尾视图的时候，如果当前tableView的样式是UITableViewStyleGrouped，那么必须使用代理方法设置高度，如果是UITableViewStylePlain，可以使用属性和代理两种方式设置高度。
     */
    TableView.sectionHeaderHeight = 80;
    TableView.sectionFooterHeight = 80;
    
    //分割线
    TableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    //分割线颜色
    TableView.separatorColor = [UIColor colorWithRed:17/255.0 green:38/255.0 blue:155/255.0 alpha:1];
    //分割线缩进
    TableView.separatorInset = UIEdgeInsetsMake(0, 30, 0, 30);
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UITableViewDataSource
//设置组数,默认是1,所以不需要强制实现
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
//必须实现的两个方法
//设置每组中的行数
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
//设置行内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"aaa"];
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}
//设置section的头标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"SectionHeaderView:%ld",section];
}
//设置尾标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"SectionFooterView:%ld",section];
}
#pragma mark - UITableViewDelegate
//自定义section的头尾视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *sectionHeaderView = [[UILabel alloc] init];
    sectionHeaderView.text = [NSString stringWithFormat:@"SectionHeaderView:%ld",section];
    sectionHeaderView.textColor = [UIColor colorWithRed:136/255.0 green:255/255.0 blue:104/255.0 alpha:1];
    sectionHeaderView.textAlignment = NSTextAlignmentCenter;
    return sectionHeaderView;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UILabel *sectionFooterView = [[UILabel alloc] init];
    sectionFooterView.text = [NSString stringWithFormat:@"SectionFooterView:%ld",section];
    sectionFooterView.textAlignment = NSTextAlignmentCenter;
    sectionFooterView.textColor = [UIColor colorWithRed:240/255.0 green:203/255.0 blue:103/255.0 alpha:1];
    return sectionFooterView;
}
//设置section的头尾的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50;
}
//设置section里边的行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2 == 0) {
        return 70;
    }
    return 50;
}
//设置辅助按钮的样式
- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellAccessoryDetailButton;
}


@end
