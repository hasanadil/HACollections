//
//  BubbleSort.m
//  HACollections
//
//  Created by Hasan Adil on 7/30/15.
//  Copyright (c) 2015 Hasan Adil. All rights reserved.
//

#import "BubbleSort.h"

@implementation BubbleSort

-(NSArray*) sortedArrayFromArray:(NSArray *)unsortedArray {
    if (!unsortedArray) {
        return nil;
    }
    
    return [NSArray arrayWithArray:[self sortedArrayFromArray1:[NSMutableArray arrayWithArray:unsortedArray]]];
}

-(NSMutableArray*) sortedArrayFromArray1:(NSMutableArray*)array {
    
    BOOL swapped = true;
    while (swapped) {
        swapped = false;
        for (NSInteger i=0; i < array.count; i++) {
            NSInteger leftIndex = i;
            NSInteger rightIndex = i + 1;
            if (rightIndex >= array.count) {
                break;
            }
            
            id<HASortable> leftValue = array[leftIndex];
            id<HASortable> rightValue = array[rightIndex];
            
            if ([leftValue compare:rightValue] == NSOrderedDescending) {
                id<HASortable> temp = array[leftIndex];
                [array replaceObjectAtIndex:leftIndex withObject:array[rightIndex]];
                [array replaceObjectAtIndex:rightIndex withObject:temp];
                
                swapped = true;
            }
        }
    }
    
    return array;
}

@end
