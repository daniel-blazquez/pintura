//
//  PPPinturas.h
//  PVAlpha
//
//  Created by Daniel Blazquez on 9/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPPintura.h"

@interface PPPinturas : NSObject
@property NSArray *level1, *level2, *level3, *level4;

-(PPPintura *) randomPinturaForLevel: (int) level; 
@end
