//
//  persistanceStack.h
//  Tree
//
//  Created by 王西锋 on 15/6/18.
//  Copyright (c) 2015年 guanjia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface persistanceStack : NSObject

@property(readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property(readonly, strong, nonatomic) NSManagedObjectModel * managedObjectModel;

+ (persistanceStack *)defaultPersistanceStack;
- (void)saveContext;

@end
