//
//  PPPintura.h
//  PVAlpha
//
//  Created by Daniel Blazquez on 9/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPPintura : NSObject
@property NSString *filename;
@property NSArray *titles, *authors, *sections, *centuries;

-(NSArray*)configForOption:(int)option;
-(NSString*) pickFromOptions:(int)option;
-(PPPintura*) initWithEls:(NSString*)file :(NSArray*)tits :(NSArray*)auths :(NSArray*)secs :(NSArray*)cents;

@end
