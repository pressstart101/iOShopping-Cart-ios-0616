//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Flatiron School on 6/9/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

//@interface FISShoppingCart ()
//@property (strong, readwrite, nonatomic) NSMutableArray *items;

//@end

@implementation FISShoppingCart

-(NSUInteger)calculateTotalPriceInCents{

    NSUInteger price = 0;
    for(FISItem *item in self.items){
        price = price + item.priceInCents;
        }
            return price;
}
-(void)addItem:(FISItem *)item {
    [self.items addObject:item];
    
}

-(void)removeItem:(FISItem *)item {
    [self.items removeObjectAtIndex:[self.items indexOfObject:item]];
}
-(void)removeAllItemsLikeItem:(FISItem *)item{
    [self.items removeObject:item];
        NSLog(@"\n\n\n\n\n\n\n\n\n\n%@\n\n\n\n\n\n\n\n\n\n", self.items);

}
-(void)sortItemsByNameAsc{
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    self.items = [[self.items sortedArrayUsingDescriptors:@[sort]]mutableCopy];
}

-(void)sortItemsByNameDesc{
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    self.items = [[self.items sortedArrayUsingDescriptors:@[sort]]mutableCopy];
}
-(void)sortItemsByPriceInCentsAsc{
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:YES];
    self.items = [[self.items sortedArrayUsingDescriptors:@[sort]]mutableCopy];

}
-(void)sortItemsByPriceInCentsDesc{
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:NO];
    self.items = [[self.items sortedArrayUsingDescriptors:@[sort]]mutableCopy];
}
-(NSArray *)allItemsWithName:(NSString *)name{
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"name == %@",name];
    NSArray *result = [self.items filteredArrayUsingPredicate:pred];


    return result;
}
-(NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)minimumPrice{
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"priceInCents >= %lu", minimumPrice];
    NSArray *result = [self.items filteredArrayUsingPredicate:pred];
    
    
    return result;
}
-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)maximumPrice{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"priceInCents <= %lu", maximumPrice];
    NSArray *result = [self.items filteredArrayUsingPredicate:pred];
    
    
    return result;
}



@end
