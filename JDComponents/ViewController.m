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
    // Do any additional setup after loading the view, typically from a nib.
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
                            }
                        ];
    }
    return _dataSource;
}
@end
