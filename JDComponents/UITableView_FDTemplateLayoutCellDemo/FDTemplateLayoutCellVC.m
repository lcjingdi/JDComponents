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
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
