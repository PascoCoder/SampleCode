//
//  WeiTuoViewController.h
//  Delegate
//
//  Created by Pasco on 16/5/10.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import <UIKit/UIKit.h>

//委托方负责制定协议
@protocol FooDelegate <NSObject>

- (void)barMethod;

@end

@interface WeiTuoViewController : UIViewController

//通过一个遵循协议的属性来弱引用代理方
@property (strong, nonatomic) id<FooDelegate> delegate;

@end
