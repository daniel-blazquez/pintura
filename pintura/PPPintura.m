//
//  PPPintura.m
//  PVAlpha
//
//  Created by Daniel Blazquez on 9/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PPPintura.h"

@implementation PPPintura
@synthesize filename, titles, authors, sections, centuries;

-(PPPintura*) initWithEls:(NSString*)file  :(NSArray*)tits  :(NSArray*)auths  :(NSArray*)secs  :(NSArray*)cents{
    self = [[PPPintura alloc] init];
    
    self.filename=file;
    self.titles=tits;
    self.authors=auths;
    self.sections=secs;
    self.centuries=cents;
    
    return self;
}


-(NSArray*)configForOption:(int)option{
    switch (option)  {
        case 1:
            //NSLog (@"Titulo sera el correcto");
            return [NSArray arrayWithObjects: [self.titles objectAtIndex:0], [self pickFromOptions:2],  [self pickFromOptions:3],  [self pickFromOptions:4], nil];
 
        case 2:
            //NSLog (@"Autor sera el correcto");
            return [NSArray arrayWithObjects: [self pickFromOptions:1], [self.authors objectAtIndex:0],  [self pickFromOptions:3],  [self pickFromOptions:4], nil];
        case 3:
            //NSLog (@"Seccion sera el correcto");
            return [NSArray arrayWithObjects: [self pickFromOptions:1], [self pickFromOptions:2],  [self.sections objectAtIndex:0],  [self pickFromOptions:4], nil];
        case 4:
            //NSLog (@"Siglo sera el correcto");
            return [NSArray arrayWithObjects: [self pickFromOptions:1], [self pickFromOptions:2],  [self pickFromOptions:3],  [self.centuries objectAtIndex:0], nil];

    }
    return nil;

}
-(NSString*) pickFromOptions:(int)option{
    switch (option)  {
        case 1: return [titles objectAtIndex:((arc4random() % (titles.count-2))+1)];
        case 2: return [authors objectAtIndex:((arc4random() % (authors.count-2))+1)];
        case 3: return [sections objectAtIndex:((arc4random() % (sections.count-2))+1)];
        case 4: return [centuries objectAtIndex:((arc4random() % (centuries.count-2))+1)];
    }
    return nil;
}
@end
