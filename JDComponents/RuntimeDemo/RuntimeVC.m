//
//  RuntimeVC.m
//  JDComponents
//
//  Created by lcjingdi on 2018/3/6.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//

#import "RuntimeVC.h"
#import "RuntimePerson.h"
#import <objc/runtime.h>
#import "ObjectRunTime.h"

@interface RuntimeVC ()

@end

@implementation RuntimeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RuntimePerson *onePerson = [[RuntimePerson alloc] init];
    [onePerson setValue:@"低温景" forKey:@"name"];
    [onePerson setValue:@"88" forKey:@"age"];
    NSLog(@"%@ ",[onePerson description]);
    
    unsigned int outCount =0;
//    Ivar *ivars =class_copyIvarList([RuntimePerson class], &outCount);
    objc_property_t *property = class_copyPropertyList([RuntimePerson class], &outCount);
    for (NSInteger i =0; i < outCount; ++i) {
        // 遍历取出该类成员变量
//        Ivar ivar = *(ivars + i);
//        NSLog(@"\n name = %s \n type = %s", ivar_getName(ivar),ivar_getTypeEncoding(ivar));
    }

//    free(ivars);
    
    [onePerson sayHello];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
