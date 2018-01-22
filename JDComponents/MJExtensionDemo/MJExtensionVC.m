//
//  MJExtensionVC.m
//  JDComponents
//
//  Created by lcjingdi on 2018/1/22.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//

#import "MJExtensionVC.h"
#import <MJExtension/MJExtension.h>
#import "PersonModel.h"

@interface MJExtensionVC ()

@end

@implementation MJExtensionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"JSON数据解析测试";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //1. Dictionary -> PersonModel
    //[self dictToModel];
    //2. Json -> PersonModel
//    [self jsonToModel];
    //3. 模型里面还有模型
//    [self dictToModel2];
    //4. 模型里面有数组模型
//    [self dictToModel3];
    //5. 字典中的key值和模型的属性不对应
//    [self dictToModel4];
    //6. 归档
//    [self archiveObj];
    //7. 处理默认值
    [self defaultValue];
}

#pragma mark - private
- (void)dictToModel {
    PersonModel *model = [PersonModel mj_objectWithKeyValues:[self getDictData1]];
    NSLog(@"%@",model);
}
- (void)jsonToModel {
    NSString *json = [self dictToJson:[self getDictData1]];
    NSLog(@"%@",json);
    PersonModel *model = [PersonModel mj_objectWithKeyValues:json];
    NSLog(@"%@",model);
}
- (void)dictToModel2 {
    PersonModel *model = [PersonModel mj_objectWithKeyValues:[self getDictData2]];
    NSLog(@"%@",model);
}
- (void)dictToModel3 {
    PersonModel *model = [PersonModel mj_objectWithKeyValues:[self getDictData3]];
    NSLog(@"%@",model);
}
- (void)dictToModel4 {
    [PersonModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 // 把需要映射的名字返回
                 @"name":@"xxxxxxxxx"
                 };
    }];
    PersonModel *model = [PersonModel mj_objectWithKeyValues:[self getDictData4]];
    NSLog(@"%@",model);
}
- (void)archiveObj {
    [PersonModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 // 把需要映射的名字返回
                 @"name":@"xxxxxxxxx"
                 };
    }];
    PersonModel *model = [PersonModel mj_objectWithKeyValues:[self getDictData4]];
    NSString *file = [NSHomeDirectory() stringByAppendingPathComponent:@"personmodel.data"];
    [NSKeyedArchiver archiveRootObject:model toFile:file];
    
    PersonModel *model2 = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
    NSLog(@"%@",model2);
}
- (void)defaultValue {
    [PersonModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 // 把需要映射的名字返回
                 @"name":@"xxxxxxxxx"
                 };
    }];
    PersonModel *model = [PersonModel mj_objectWithKeyValues:[self getDictData4]];
    NSString *file = [NSHomeDirectory() stringByAppendingPathComponent:@"personmodel.data"];
    [NSKeyedArchiver archiveRootObject:model toFile:file];
    
    PersonModel *model2 = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
    NSLog(@"%@",model2);
}
#pragma mark - 数据

- (NSDictionary *)getDictData1 {
    return @{
             @"name": @"Jack",
             @"icon": @"xxoo.png",
             @"age" : @20,
             @"height": @"1.88",
             @"money":@100000.0000,
             @"sex":@(SexFemale),
             @"gay":@"true"
             };
}
- (NSDictionary *)getDictData2 {
    return @{
             @"name": @"Jack",
             @"icon": @"xxoo.png",
             @"age" : @20,
             @"height": @"1.88",
             @"money":@100000.0000,
             @"sex":@(SexFemale),
             @"gay":@"true",
             @"stuModel": @{
                     @"name":@"ooxx",
                     @"height":@"199"
                     }
             };
}
- (NSDictionary *)getDictData3 {
    return @{
             @"name": @"Jack",
             @"icon": @"xxoo.png",
             @"age" : @20,
             @"height": @"1.88",
             @"money":@100000.0000,
             @"sex":@(SexFemale),
             @"gay":@"true",
             @"stuModel": @{
                     @"name":@"ooxx",
                     @"height":@"199"
                     },
             @"girls": @[
                        @{@"name":@"girl1",@"bust":@"A"},
                        @{@"name":@"girl2",@"bust":@"C"},
                        @{@"name":@"girl3",@"bust":@"Z"}
                 ]
             };
}
- (NSDictionary *)getDictData4 {
    return @{
             @"xxxxxxxxx": @"Jack",
             @"icon": @"xxoo.png",
             @"age" : @20,
             @"height": @"1.88",
             @"money":@100000.0000,
             @"sex":@(SexFemale),
             @"gay":@"true",
             @"stuModel": @{
                     @"name":@"ooxx",
                     @"height":@"199"
                     },
             @"girls": @[
                     @{@"name":@"girl1",@"bust":@"A"},
                     @{@"name":@"girl2",@"bust":@"C"},
                     @{@"name":@"girl3",@"bust":@"Z"}
                     ]
             };
}
- (NSString *)dictToJson:(NSDictionary *)dict {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        return @"";
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    return jsonString;
}

@end
