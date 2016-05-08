//
//  ViewController.m
//  OperationQueue
//
//  Created by Pasco on 16/4/27.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
#pragma mark - NSOperation
    
//    //1.创建NSBlockOperation对象
//    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"%@", [NSThread currentThread]);
//    }];
//    
//    //添加多个Block
//    for (NSInteger i = 0; i < 5; i++) {
//        [operation addExecutionBlock:^{
//            NSLog(@"第%ld次：%@", i, [NSThread currentThread]);
//        }];
//    }
//    
//    //2.开始任务
//    [operation start];
    
    
# pragma mark - NSOperationQueue
    
//    //1.创建一个其他队列
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    queue.maxConcurrentOperationCount = 1;
//    
//    //2.创建NSBlockOperation对象
//    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"%@", [NSThread currentThread]);
//    }];
//    
//    //3.添加多个Block
//    for (NSInteger i = 0; i < 10; i++) {
//        [operation addExecutionBlock:^{
//            NSLog(@"第%ld次：%@", i, [NSThread currentThread]);
//        }];
//    }
//    
//    //4.队列添加任务
//    [queue addOperation:operation];
    
    unsigned int count = 0;
    Method *methods = class_copyMethodList([NSObject class], &count);
    for (NSUInteger i = 0; i < count; i++) {
        SEL methodSEL = method_getName(methods[i]);
        const char *methodName = sel_getName(methodSEL);
        NSString *name = [NSString stringWithUTF8String:methodName];
        NSLog(@"name = %@",name);
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
#pragma mark - add dependence
    
//    //1.任务一：下载图片
//    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"下载图片 - %@", [NSThread currentThread]);
//        [NSThread sleepForTimeInterval:1.0];
//    }];
//    
//    //2.任务二：打水印
//    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"打水印   - %@", [NSThread currentThread]);
//        [NSThread sleepForTimeInterval:1.0];
//    }];
//    
//    //3.任务三：上传图片
//    NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"上传图片 - %@", [NSThread currentThread]);
//        [NSThread sleepForTimeInterval:1.0];
//    }];
//    
//    //4.设置依赖
//    [operation2 addDependency:operation1];      //任务二依赖任务一
//    [operation3 addDependency:operation2];      //任务三依赖任务二
//    
//    //5.创建队列并加入任务
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [queue addOperations:@[operation3, operation2, operation1] waitUntilFinished:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
