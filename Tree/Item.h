//
//  Item.h
//  
//
//  Created by 王西锋 on 15/6/18.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Item;

@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * order;
@property (nonatomic, retain) Item *parent;
@property (nonatomic, retain) NSSet *childern;
@end

@interface Item (CoreDataGeneratedAccessors)

- (void)addChildernObject:(Item *)value;
- (void)removeChildernObject:(Item *)value;
- (void)addChildern:(NSSet *)values;
- (void)removeChildern:(NSSet *)values;

@end
