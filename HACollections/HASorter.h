//
//  HASorter.h
//  Collections
//
//  Created by Hasan Adil on 7/30/15.
//  Copyright (c) 2015 Hasan Adil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HASortable.h"

@protocol HASorter <NSObject>

-(NSArray*) sortedArrayFromArray:(NSArray*)unsortedArray;

@end
