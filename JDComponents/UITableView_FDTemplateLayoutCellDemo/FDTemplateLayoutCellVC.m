//
//  FDTemplateLayoutCellVC.m
//  JDComponents
//
//  Created by lcjingdi on 2017/12/26.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import "FDTemplateLayoutCellVC.h"
#import <HandyFrame/UIView+LayoutMethods.h>

@interface FDTemplateLayoutCellVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView  *tableView;
@end

@implementation FDTemplateLayoutCellVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"FDTemplateLayoutCellVC";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    self.tableView.rowHeight = 88;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView fill];
}

#pragma mark - UITableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    UISwitch *label = [[UISwitch alloc] initWithFrame:CGRectMake(20, 20, 60, 40)];
    [cell.contentView addSubview:label];
//    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([cell respondsToSelector:@selector(setLayoutManager:)]) {
        if (indexPath.row == 0) {
            [cell setLayoutMargins:UIEdgeInsetsMake(0, 60, 0, 0)];
        } else if (indexPath.row == 1){
            [cell setLayoutMargins:UIEdgeInsetsMake(0, 70, 0, 0)];
        } else if (indexPath.row == 2) {
            [cell setLayoutMargins:UIEdgeInsetsMake(0, 80, 0, 0)];
        } else if (indexPath.row == 3) {
            [cell setLayoutMargins:UIEdgeInsetsMake(0, 100, 0, 0)];
        } else {
            [cell setLayoutMargins:UIEdgeInsetsMake(0, 0, 0, 0)];
        }
    }
}
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.separatorColor = [UIColor redColor];
    }
    return _tableView;
}

@end
