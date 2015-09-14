//
//  AppDelegate.m
//  Tree
//
//  Created by 王西锋 on 15/6/18.
//  Copyright (c) 2015年 guanjia. All rights reserved.
//

#import "AppDelegate.h"
#import "persistanceStack.h"


@interface AppDelegate ()
@property (strong,nonatomic)NSString *str;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    [[persistanceStack defaultPersistanceStack] saveContext];
}

@end
