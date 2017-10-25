//
//  PVLayoutServer.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 9/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PVLayoutServer.h"

@implementation PVLayoutServer

// /85    /78  /84  /68


double windowWidth = 1024;

double charWidth = 8.3;
double lineHeight = 35;

double topMargin = 60;
double leftMargin = 60;
double rightMargin = 120;
double internalMargin = 30;

-(CGRect) introductionLayout{
    return CGRectMake(300, 60, 650, 655-60);
}

-(double) lengthOfRectWithText:(NSString*) text withWidth:(double)width {
    return lineHeight*text.length/(width/charWidth);
}

-(CGRect) regularBlock:(double)length vOffset:(double) vOffset {
    double lineWidth = windowWidth-leftMargin-rightMargin + internalMargin;
    return CGRectMake(leftMargin, vOffset, lineWidth, length);
}

-(CGRect) rightBlock:(double)lenght offset:(double) vOffset leftOffset:(double) leftOffset {
    double lineWidth = windowWidth-leftMargin-rightMargin-leftOffset;
    return CGRectMake(leftMargin+leftOffset+internalMargin, vOffset, lineWidth, lenght);
}

-(double) leftPaddingForWidth:(double)width {
    return (windowWidth-leftMargin-width)/2;
}


@end
