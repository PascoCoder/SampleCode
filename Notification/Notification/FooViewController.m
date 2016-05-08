//
//  FooViewController.m
//  Notification
//
//  Created by Pasco on 16/4/20.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import "FooViewController.h"

@interface FooViewController ()

@end

@implementation FooViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    pushButton.frame = CGRectMake(100, 300, 100, 20);
    [pushButton setTitle:@"POST NOTIFICATION" forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(postNotification) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
    
}

- (void)postNotification {
    NSLog(@"post notification");
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"testNotification" object:nil];
}

- (void)notification {
    NSLog(@"foo notification");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"dealloc");
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
