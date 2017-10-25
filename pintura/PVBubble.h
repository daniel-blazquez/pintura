//
//  PVBubble.h
//  PVAlpha
//
//  Created by Daniel Blazquez on 9/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PVBubble : UIImageView
@property  double x, y;
@property (nonatomic,strong) NSString *text;
@property (nonatomic,strong) UILabel *label;
@end
