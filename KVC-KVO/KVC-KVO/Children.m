//
//  Children.m
//  KVC-KVO
//
//  Created by Pasco on 16/4/20.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import "Children.h"

@implementation Children

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = @"";
        self.age = 0;
    }
    return self;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    if ([key isEqualToString:@"name"]) {
        return NO;
    }else {
        return [super automaticallyNotifiesObserversForKey:key];
    }
}

-(void)setName:(NSString *)name {
    [self willChangeValueForKey:@"name"];
    _name = name;
    [self didChangeValueForKey:@"name"];
}

@end
