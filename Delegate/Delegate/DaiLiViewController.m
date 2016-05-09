//
//  DaiLiViewController.m
//  Delegate
//
//  Created by Pasco on 16/5/10.
//  Copyright © 2016年 Pasco. All rights reserved.
//


/**
 总结：
 1. 委托方负责制定协议
 2. 代理方负责遵循协议并实现协议
 3. 代理方强引用委托方，一般是在通过属性来拥有
 4. 委托方弱引用代理方，通过设置 委托方.delegate = (代理方)self;
 
 */

#import "DaiLiViewController.h"
#import "WeiTuoViewController.h"

@interface DaiLiViewController ()<FooDelegate>

@property (strong, nonatomic) UIButton *pushButton;
@property (strong, nonatomic) WeiTuoViewController *weiTuoViewController;

@end

@implementation DaiLiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    /**
     *  push按钮
     */
    self.pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.pushButton setTitle:@"push" forState:UIControlStateNormal];
    [self.pushButton setFrame:CGRectMake(100, 100, 100, 50)];
    [self.pushButton addTarget:self action:@selector(actionButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.pushButton];
    
    /**
     *  委托方
     */
    self.weiTuoViewController = [[WeiTuoViewController alloc] init];
    self.weiTuoViewController.delegate = self;
    
}


- (void)actionButton {
    NSLog(@"zhixingle");
    [self presentViewController:self.weiTuoViewController animated:YES completion:^{
        NSLog(@"push push push");
    }];
}

/**
 *  代理方法的具体实现
 */

- (void)barMethod {
    NSLog(@"负责代理方法的具体实现");
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
