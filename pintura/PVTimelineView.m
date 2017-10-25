//
//  PVTimelineView.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 9/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PVTimelineView.h"
#import "PV.h"


@implementation PVTimelineView

@synthesize section = _section;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    [self setBackgroundColor:[UIColor whiteColor]];
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    UIFont *font = [UIFont fontWithName:@"OFL Sorts Mill Goudy TT" size:17];
    UIFont *font1 = [UIFont fontWithName:@"OFL Sorts Mill Goudy TT" size:10];
    UIFont *font2 = [UIFont fontWithName:@"OFL Sorts Mill Goudy TT" size:12];
    
    
    float x = 20;
    float xInit = x;
    float xAux = x;
    float offs = 70;
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGFloat red[4] = {.549, .51, .451, 1.0};

    
    for (int i = 1; i<[[[PV sharedInstance] sectionTitles] count]+1; i++) {
        
        // Siglo
        UILabel *century = [[UILabel alloc] initWithFrame:CGRectMake(offs-60, x-6, 55, 15)];
        century.text = [[PV sharedInstance] centuryOfSection:i];
        century.textColor = [UIColor blackColor];
        century.font = font1;
        century.textColor = [self colorWithHexString:@"8C8273"];
        [self addSubview:century];
        
        // Tiulo
        UILabel *title = [[UILabel alloc] init];
        title.backgroundColor = [UIColor clearColor];
        title.font = font;
        title.text = [[PV sharedInstance] titleOfSection:i];
        if (self.section == i) {
            title.frame = CGRectMake(offs+40, x-8, 120, 15);
            title.textColor = [UIColor blackColor];
        } else {
            title.frame = CGRectMake(offs+8, x-8, 120, 15);
            title.textColor = [self colorWithHexString:@"8C8273"];
        }
        [self addSubview:title];

        // Marcadores
        CGContextSetStrokeColor(c, red);
        CGContextBeginPath(c);
        CGContextMoveToPoint(c, offs, x);
        if (self.section == i) CGContextAddLineToPoint(c, offs+40, x); else CGContextAddLineToPoint(c, offs+5, x);
        CGContextStrokePath(c);
        xAux = x;
        
        // Subsecciones
        if (self.section == i){
            int bcount = [[PV sharedInstance] titlesofPages:i].count;
            for (int b=1; b<=bcount; b++){
                // Marcador
                CGContextBeginPath(c);
                CGContextMoveToPoint(c, offs+20, x+b*20);
                CGContextAddLineToPoint(c, offs+40, x+b*20);
                CGContextStrokePath(c);
                // Etiqueta
                UILabel *subsection = [[UILabel alloc] initWithFrame:CGRectMake(offs+55, x+(b*20)-6, 140, 15)];
                subsection.text = [[PV sharedInstance] titleOfPage:b section:i];
                subsection.textColor = [UIColor blackColor];
                subsection.font = font2;
                [self addSubview:subsection];
            }
            CGContextBeginPath(c);
            CGContextMoveToPoint(c, offs+20, x);
            CGContextAddLineToPoint(c, offs+20, x+bcount*20);
            CGContextStrokePath(c);
            
            x = x+(bcount+1)*20;
        } else {
            // Incrementar separador standard
            x=x+30;
        }
        // Extra padding al final
        x=x+15;
    }
    
    c = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColor(c, red);
    CGContextBeginPath(c);
    CGContextMoveToPoint(c, offs, xInit-10);
    CGContextAddLineToPoint(c, offs, xAux+10);
    CGContextStrokePath(c);

}


-(UIColor*)colorWithHexString:(NSString*)hex {  
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];  
    
    // String should be 6 or 8 characters  
    if ([cString length] < 6) return [UIColor grayColor];  
    
    // strip 0X if it appears  
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];  
    
    if ([cString length] != 6) return  [UIColor grayColor];  
    
    // Separate into r, g, b substrings  
    NSRange range;  
    range.location = 0;  
    range.length = 2;  
    NSString *rString = [cString substringWithRange:range];  
    
    range.location = 2;  
    NSString *gString = [cString substringWithRange:range];  
    
    range.location = 4;  
    NSString *bString = [cString substringWithRange:range];  
    
    // Scan values  
    unsigned int r, g, b;  
    [[NSScanner scannerWithString:rString] scanHexInt:&r];  
    [[NSScanner scannerWithString:gString] scanHexInt:&g];  
    [[NSScanner scannerWithString:bString] scanHexInt:&b];  
    
    return [UIColor colorWithRed:((float) r / 255.0f)  
                           green:((float) g / 255.0f)  
                            blue:((float) b / 255.0f)  
                           alpha:1.0f];  
}



@end
