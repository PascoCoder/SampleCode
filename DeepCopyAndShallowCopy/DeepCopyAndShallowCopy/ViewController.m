//
//  ViewController.m
//  DeepCopyAndShallowCopy
//
//  Created by Pasco on 16/4/20.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSString *strongString;
@property (nonatomic, copy) NSString *copyedString;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableString *string = [NSMutableString stringWithFormat:@"cde"];
    //必须是self.copyedString方法，不能_copyedString
    //copy需要使用setter方法
    self.strongString = string;
    self.copyedString = string;
    NSLog(@"origin string: %p, %p", string, &string);
    NSLog(@"strong string: %p, %p", _strongString, &_strongString);
    NSLog(@"copy string: %p, %p", _copyedString, &_copyedString);
    
    NSString *foo1 = @"123";
    NSString *bar1 = [foo1 copy];
    NSMutableString *quz1 = [foo1 mutableCopy];
    NSLog(@"NSString:%p",foo1);
    NSLog(@"[NSString copy]:%p",bar1);
    NSLog(@"[NSString mutableCopy]:%p",quz1);
    
    NSMutableString *foo2 = [NSMutableString stringWithFormat:@"456"];
    NSString *bar2 = [foo2 copy];
    NSMutableString *quz2 = [foo2 mutableCopy];
    NSLog(@"NSMutableString:%p",foo2);
    NSLog(@"[NSMutableString copy]:%p",bar2);
    NSLog(@"[NSMutableString mutableCopy]:%p",quz2);
    
    NSArray *foo3 = @[@"111", @"222"];
    NSArray *bar3 = [foo3 copy];
    NSMutableArray *quz3 = [foo3 mutableCopy];
    NSLog(@"NSArray:%p",foo3);
    NSLog(@"[NSArray copy]:%p",bar3);
    NSLog(@"[NSArray mutableCopy]:%p",quz3);
    
    NSMutableArray *foo4 = [[NSMutableArray alloc] initWithArray:@[@"333", @"444"]];
    NSArray *bar4 = [foo4 copy];
    NSMutableArray *quz4 = [foo4 mutableCopy];
    NSLog(@"NSMutableArray:%p",foo4);
    NSLog(@"[NSMutableArray copy]:%p",bar4);
    NSLog(@"[NSMutableArray mutableCopy]:%p",quz4);
    /*
     * output
     *
     * NSString:0x100a65078
     * [NSString copy]:0x100a65078
     * [NSString mutableCopy]:0x7fc6eae0c1e0
     * NSMutableString:0x7fc6eadb7730
     * [NSMutableString copy]0xa000000003635343----[NSMutableString mutableCopy]0x7fc6ead125f0
     * NSArray:0x7fc6eada0120----[NSArray copy]0x7fc6eada0120----[NSArray mutableCopy]0x7fc6eada0140
     * NSMutableArray:0x7fc6eadb1290----[NSMutableArray copy]0x7fc6eadb1270----[NSMutableArray mutableCopy]0x7fc6ead12d00
     */
    /*
     * 结论
     *
     * 不可变类型的copy方法是浅拷贝
     * 不可变类型的mutableCopy是深复制
     *
     * 可变类型的copy和mutableCopy都是深复制
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
