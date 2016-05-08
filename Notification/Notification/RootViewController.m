//
//  RootViewController.m
//  Notification
//
//  Created by Pasco on 16/4/20.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import "RootViewController.h"
#import "FooViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    pushButton.frame = CGRectMake(100, 300, 100, 20);
    [pushButton setTitle:@"PUSH" forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(pushButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
    
    //添加观察者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification) name:@"testNotification" object:nil];
    
}

- (void)pushButtonClicked {
    NSLog(@"push button clicked");
    FooViewController *fooViewController = [[FooViewController alloc] init];
    fooViewController.title = @"fooViewController";
    [self.navigationController pushViewController:fooViewController animated:YES];
}

- (void)notification {
    NSLog(@"rootViewController中添加的notification被触发");
}

- (void)dealloc {
    NSLog(@"root view dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"testNotification" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
