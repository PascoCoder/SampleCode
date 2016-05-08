//
//  AppDelegate.m
//  Notification
//
//  Created by Pasco on 16/4/20.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@interface AppDelegate ()

//@property (nonatomic, strong) UINavigationController *navigationController;
//@property (nonatomic, strong) RootViewController *rootViewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //    [self setupTabBarController];
    RootViewController *rootViewController = [[RootViewController alloc] init];
    rootViewController.title = @"RootView";
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
//    [self customizeAppearance];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)customizeAppearance {
    
    
    //    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    //    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    //    [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
    
//    [UINavigationBar appearance].tintColor = HEXCOLOR(0x1da1f2);
    [UINavigationBar appearance].barTintColor = [UIColor whiteColor];
//    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName:HEXCOLOR(0x1da1f2)};
    
}

- (void)makeWindowsVisible:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
//    [UINavigationBar appearance].barTintColor = HEXCOLOR(0xdf3031);
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
