//
//  WeiTuoViewController.m
//  Delegate
//
//  Created by Pasco on 16/5/10.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import "WeiTuoViewController.h"

@interface WeiTuoViewController ()

@end

@implementation WeiTuoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    /**
     *  弱引用的代理方执行代理方法
     */
    [self.delegate barMethod];
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
