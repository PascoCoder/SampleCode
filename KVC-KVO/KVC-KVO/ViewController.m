//
//  ViewController.m
//  KVC-KVO
//
//  Created by Pasco on 16/4/20.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import "ViewController.h"
#import "Children.h"

/*
 * KVO使用
 * 1、初始化对象
 * 2、为对象某个键添加键值观察
 *    @code
            [self.child1 addObserver:self
                          forKeyPath:@"name"
                             options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                             context:child1Context];
      @endcode
 * 3、实现观察者触发后的observeValueForKeyPath方法
 * 4、改变属性的值，自动触发KVO
 * 5、也可以在原来的类中实现automaticallyNotifiesObserversForKey:Key，并返回 针对某个Key返回NO，即可采取以下方式手动触发KVO
        @code
            [self.child1 willChangeValueForKey:@"name"];
            self.child1.name = @"Michael";
            [self.child1 didChangeValueForKey:@"name"];//执行到这句触发KVO，这句话放在需要触发的地方
        @endcode
 * 6、也可以吧willChangeValueForKey和didChangeValueForKey放到属性的setter方法中去
 */


//用来区分具体是一个类的KVO
static void *child1Context = &child1Context;
static void *child2Context = &child2Context;

@interface ViewController ()

@property (nonatomic, strong) Children *child1;
@property (nonatomic, strong) Children *child2;
@property (nonatomic, strong) Children *child3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 使用setter方法更改属性的值
//    self.child1 = [[Children alloc] init];
//    self.child1.name = @"George";
//    self.child1.age = 15;;
//    NSLog(@"%@, %ld", self.child1.name, (long)self.child1.age);
    
    //使用KVC更改属性的值
//    self.child1 = [[Children alloc] init];
//    [self.child1 setValue:@"George" forKey:@"name"];
//    [self.child1 setValue:[NSNumber numberWithUnsignedInteger:15] forKey:@"age"];
//    NSString *child1Name = [self.child1 valueForKey:@"name"];
//    NSUInteger child1Age = [[self.child1 valueForKey:@"age"] integerValue];
//    NSLog(@"%@, %lu", child1Name, (unsigned long)child1Age);
    
    self.child1 = [[Children alloc] init];
    self.child2 = [[Children alloc] init];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //self.child1添加KVO
    [self.child1 addObserver:self
                  forKeyPath:@"name"
                     options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                     context:child1Context];
    [self.child1 addObserver:self
                  forKeyPath:@"age"
                     options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                     context:child1Context];
    
    // self.child2添加KVO
    [self.child2 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child2Context];
    [self.child2 addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child2Context];
    
    
    // 改变属性值，触发KVO
    [self.child1 setValue:@"Michael" forKey:@"name"];
    self.child1.name = @"Michael";
    [self.child1 setValue:[NSNumber numberWithInteger:20] forKey:@"age"];
    [self.child2 setValue:@"Ben" forKey:@"name"];
    [self.child2 setValue:[NSNumber numberWithInteger:45] forKey:@"age"];
    
    //手动触发KVO
    /*
     * 原来的类中实现automaticallyNotifiesObserversForKey:Key
     * 并返回 针对某个Key返回NO，即可采取以下方式手动触发KVO
     */
//    [self.child1 willChangeValueForKey:@"name"];
//    self.child1.name = @"Michael";
//    [self.child1 didChangeValueForKey:@"name"];//执行到这句触发KVO，这句话放在需要触发的地方
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.child1 removeObserver:self forKeyPath:@"name"];
    [self.child1 removeObserver:self forKeyPath:@"age"];
    [self.child2 removeObserver:self forKeyPath:@"age"];
    [self.child2 removeObserver:self forKeyPath:@"name"];
}


#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (context == child1Context) {
        if ([keyPath isEqualToString:@"name"]) {
            NSLog(@"the name of child1 was changed");
            NSLog(@"%@",change);
        }
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"The age of the child1 was changed.");
            NSLog(@"%@", change);
        }
    }else if (context == child2Context) {
        if ([keyPath isEqualToString:@"name"]) {
            NSLog(@"the name of child2 was changed");
            NSLog(@"%@",change);
        }
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"The age of the child2 was changed.");
            NSLog(@"%@", change);
        }
    }

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
