//
//  JDNetworkingDemoViewController.m
//  JDComponents
//
//  Created by lcjingdi on 2017/12/11.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import "JDNetworkingDemoViewController.h"
#import <HandyFrame/UIView+LayoutMethods.h>

NSString * const kDataSourceItemKeyYTKNetworking = @"kDataSourceItemKeyYTKNetworking";
NSString * const kDataSourceItemKeyYTKTitle = @"kDataSourceItemKeyYTKTitle";

@interface JDNetworkingDemoViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView  *tableView;
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation JDNetworkingDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"测试网络";
    
    [self.view addSubview:self.tableView];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView fill];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.dataSource[indexPath.row][kDataSourceItemKeyYTKTitle];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *classString = self.dataSource[indexPath.row][kDataSourceItemKeyYTKNetworking];
    Class class = NSClassFromString(classString);
    UIViewController *vc = [[class alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - getters and setters
- (NSArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = @[
                        @{
                            kDataSourceItemKeyYTKNetworking:@"YTKNetworkingVC",
                            kDataSourceItemKeyYTKTitle:@"测试猿题库网络框架"
                            }
                        ];
    }
    return _dataSource;
}
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}
@end
