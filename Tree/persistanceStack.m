//
//  persistanceStack.m
//  Tree
//
//  Created by 王西锋 on 15/6/18.
//  Copyright (c) 2015年 guanjia. All rights reserved.
//

#import "persistanceStack.h"

@interface persistanceStack ()

@property(readwrite, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property(readwrite, strong, nonatomic) NSManagedObjectModel * managedObjectModel;

@end

@implementation persistanceStack

+ (persistanceStack *)defaultPersistanceStack {

    static persistanceStack *stack = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        stack = [[persistanceStack alloc] init];
    });
    
    return stack;
}

#pragma mark public methodes
- (void)saveContext {

    NSError *error = nil;
    NSManagedObjectContext *context = self.managedObjectContext;
    
    if ([context hasChanges] && ![context save:&error]) {
        abort();
    }

}
//#pragma mark - event response

#pragma mark - private methods
- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


#pragma mark - property methods
- (NSManagedObjectContext *)managedObjectContext {

    if (self.managedObjectContext == nil) {
        self.managedObjectContext = [[NSManagedObjectContext alloc] init];
        NSError *error = nil;
        NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                 configuration:@"data.sqite"
                                                           URL:[self applicationDocumentsDirectory]
                                                       options:nil
                                                         error:&error];
        if (error) {
            NSLog(@"error: %@", error);
        }
        self.managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator;
    }
    return self.managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel {
    
    if (self.managedObjectModel == nil) {
        self.managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"Main" withExtension:@"momd"]];
        
    }
    return self.managedObjectModel;
}


@end
