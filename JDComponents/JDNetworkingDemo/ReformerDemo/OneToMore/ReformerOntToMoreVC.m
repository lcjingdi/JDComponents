//
//  ReformerOntToMoreVC.m
//  JDComponents
//
//  Created by lcjingdi on 2017/12/14.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import "ReformerOntToMoreVC.h"
#import <HandyFrame/UIView+LayoutMethods.h>

#import "V1Reformer.h"
#import "V2Reformer.h"
#import "ReformerKeysV2.h"
#import "ReformerKeysV1.h"
#import "VBusinessManager.h"

@interface ReformerOntToMoreVC ()<UITableViewDataSource>
@property (nonatomic, strong) UIImageView  *imageView;
@property (nonatomic, strong) UILabel  *titleLabel;
@property (nonatomic, strong) UITableView  *tableView;

@property (nonatomic, strong) VBusinessManager  *manager;
@property (nonatomic, strong) V1Reformer  *reformerv1;
@property (nonatomic, strong) V2Reformer  *reformerv2;

@property (nonatomic, strong) NSArray  *tbArray;
@end

@implementation ReformerOntToMoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.tableView];
    
    NSDictionary *dict1 =  [self.manager fetchBussinessDataWithReformer:self.reformerv1];
    self.titleLabel.text = [dict1 objectForKey:kReformerDataKeyV1Title];
    self.imageView.image = [UIImage imageNamed:[dict1 objectForKey:kReformerDataKeyV1Image]];
    
    self.tbArray = [[self.manager fetchBussinessDataWithReformer:self.reformerv2] objectForKey:@"key"];
    [self.tableView reloadData];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.titleLabel.ct_x = 0;
    self.titleLabel.ct_y = 20;
    [self.titleLabel fillWidth];
    self.titleLabel.ct_height = 50;
    
    self.imageView.ct_x = self.titleLabel.ct_x;
    self.imageView.ct_y = self.titleLabel.ct_bottom + 10;
    [self.imageView fillWidth];
    self.imageView.ct_height = 200;
    
    self.tableView.ct_x = self.titleLabel.ct_x;
    self.tableView.ct_y = self.imageView.ct_bottom + 10;
    [self.tableView fillWidth];
    self.tableView.ct_height = 200;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tbArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"jingdi"];
    NSDictionary *dict = self.tbArray[indexPath.row];
    cell.textLabel.text = [dict objectForKey:kReformerDataKeyV2Title];
    cell.imageView.image = [UIImage imageNamed:[dict objectForKey:kReformerDataKeyV2Image]];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.detailTextLabel.text = [dict objectForKey:kReformerDataKeyV2DetailTitle];
    return cell;
}
#pragma mark - lazy
- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor redColor];
    }
    return _imageView;
}
- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (VBusinessManager *)manager {
    if (_manager == nil) {
        _manager = [[VBusinessManager alloc] init];
    }
    return _manager;
}
- (V2Reformer *)reformerv2 {
    if (_reformerv2 == nil) {
        _reformerv2 = [[V2Reformer alloc] init];
    }
    return _reformerv2;
}
- (V1Reformer *)reformerv1 {
    if (_reformerv1 == nil) {
        _reformerv1 = [[V1Reformer alloc] init];
    }
    return _reformerv1;
}
@end
