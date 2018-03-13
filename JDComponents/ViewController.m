//
//  ViewController.m
//  JDComponents
//
//  Created by lcjingdi on 2017/12/11.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import "ViewController.h"

NSString * const kDataSourceItemKeyType = @"kDataSourceItemKeyType";
NSString * const kDataSourceItemKeyTitle = @"kDataSourceItemKeyTitle";

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray  *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"第三方框架测试";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.dataSource[indexPath.row][kDataSourceItemKeyTitle];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *classString = self.dataSource[indexPath.row][kDataSourceItemKeyType];
    Class class = NSClassFromString(classString);
    UIViewController *vc = [[class alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = self.dataSource[indexPath.row][kDataSourceItemKeyTitle];
    [self.navigationController pushViewController:vc animated:YES];
}
- (NSArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = @[
                        @{
                            kDataSourceItemKeyType: @"JDNetworkingDemoViewController",
                            kDataSourceItemKeyTitle:@"测试网络"
                        },
                        @{
                            kDataSourceItemKeyType: @"CLLoggerVC",
                            kDataSourceItemKeyTitle:@"测试日志系统"
                            },
                        @{
                            kDataSourceItemKeyType: @"FDTemplateLayoutCellVC",
                            kDataSourceItemKeyTitle:@"测试FDTemplateLayoutCell"
                            },
                        @{
                            kDataSourceItemKeyType: @"MJExtensionVC",
                            kDataSourceItemKeyTitle:@"测试json数据的解析"
                            },
                        @{
                            kDataSourceItemKeyType:@"WebViewVC",
                            kDataSourceItemKeyTitle:@"webview测试"
                            },
                        @{
                            kDataSourceItemKeyType:@"RuntimeVC",
                            kDataSourceItemKeyTitle:@"runtime测试"
                            },
                        @{
                            kDataSourceItemKeyType: @"HotFixVC",
                            kDataSourceItemKeyTitle: @"HotFix测试"
                            },
                        @{
                            kDataSourceItemKeyType:@"StatisticsVC",
                            kDataSourceItemKeyTitle:@"统计打点测试"
                            }
                        ];
    }
    return _dataSource;
}
@end
