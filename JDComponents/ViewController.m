//
//  ViewController.m
//  JDComponents
//
//  Created by lcjingdi on 2017/12/11.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import "ViewController.h"

NSString * const kDataSourceItemKeyYTKNetworkType = @"kDataSourceItemKeyYTKNetworkType";
NSString * const kDataSourceItemKeyYTKNetworkTitle = @"kDataSourceItemKeyYTKNetworkTitle";

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
    cell.textLabel.text = self.dataSource[indexPath.row][kDataSourceItemKeyYTKNetworkTitle];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *classString = self.dataSource[indexPath.row][kDataSourceItemKeyYTKNetworkType];
    Class class = NSClassFromString(classString);
    UIViewController *vc = [[class alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (NSArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = @[
                        @{
                            kDataSourceItemKeyYTKNetworkType: @"JDNetworkingDemoViewController",
                            kDataSourceItemKeyYTKNetworkTitle:@"测试网络"
                        }
                        ];
    }
    return _dataSource;
}
@end
