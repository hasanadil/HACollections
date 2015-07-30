//
//  Quicksort.m
//  Collections
//
//  Created by Hasan Adil on 7/30/15.
//  Copyright (c) 2015 Hasan Adil. All rights reserved.
//

#import "HAQuicksort.h"
#import "HASortable.h"

@implementation HAQuicksort

-(NSArray*) sortedArrayFromArray:(NSArray*)unsortedArray {
    if (!unsortedArray) {
        return nil;
    }
    
    NSMutableArray* temp = [NSMutableArray arrayWithArray:unsortedArray];
    NSMutableArray* sorted = [self sortedArrayFromArray:temp
                         fromLowIndex:0
                          toHighIndex:unsortedArray.count];
    return [NSArray arrayWithArray:sorted];
}

-(NSMutableArray*) sortedArrayFromArray:(NSMutableArray*)array fromLowIndex:(NSInteger)lowIndex toHighIndex:(NSInteger)highIndex {

    NSInteger partitionedIndex = [self partitionArray:array fromLowIndex:lowIndex toHighIndex:highIndex];
    
    if (lowIndex < partitionedIndex) {
        [self sortedArrayFromArray:array fromLowIndex:lowIndex toHighIndex:partitionedIndex];
    }
    if (partitionedIndex < highIndex) {
        [self sortedArrayFromArray:array fromLowIndex:partitionedIndex toHighIndex:highIndex];
    }
    
    return array;
}

-(NSInteger) partitionArray:(NSMutableArray*)array fromLowIndex:(NSInteger)leftIndex toHighIndex:(NSInteger)rightIndex {
    
    NSInteger pivotIndex = floor((leftIndex + rightIndex)/2);
    id<HASortable> pivotValue = array[pivotIndex];
    
    while (leftIndex < rightIndex) {
        
        //find the first one on the left needs to be on the right side of the pivot
        while (true) {
            id<HASortable> leftValue = array[leftIndex];
            if ([leftValue compare:pivotValue] != NSOrderedAscending) {
                break;
            }
            leftIndex++;
            
            if (leftIndex >= pivotIndex) {
                break;
            }
        }
        
        while (true) {
            id<HASortable> rightValue = array[rightIndex];
            if ([rightValue compare:pivotValue] != NSOrderedDescending) {
                break;
            }
            rightIndex--;
            
            if (rightIndex <= pivotIndex) {
                break;
            }
        }
        
        //swap
        if (leftIndex < rightIndex) {
            id<HASortable> temp = array[leftIndex];
            [array replaceObjectAtIndex:leftIndex withObject:array[rightIndex]];
            [array replaceObjectAtIndex:rightIndex withObject:temp];
        }
    }
    
    return pivotIndex;
}

@end


































