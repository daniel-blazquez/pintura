//
//  PVLayoutServer.h
//  PVAlpha
//
//  Created by Daniel Blazquez on 9/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PVLayoutServer : NSObject

-(CGRect) introductionLayout;
-(double) lengthOfRectWithText:(NSString*) text withWidth:(double)width;
-(double) leftPaddingForWidth:(double)width;
-(CGRect) regularBlock:(double)length vOffset:(double) vOffset;
-(CGRect) rightBlock:(double)lenght offset:(double) vOffset leftOffset:(double) leftOffset;

@end
