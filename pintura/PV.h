//
//  PV.h
//  ScrollViewProgram
//
//  Created by Daniel Blazquez on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PV : NSObject {
    NSString *language;
    NSMutableArray *content;

}

- (PV*) initWithLanguage:(NSString*)language;
- (NSString*) titleOfSection:(int)section;
- (NSString*) centuryOfSection:(int)section;
- (NSString*) titleOfPage:(int)page section:(int)section;
- (NSString*) contentAtPage:(int)page section:(int)section;
- (NSMutableArray*) titlesofPages:(int)section;
- (NSString*) bubbleContentForPainting:(int)painting bubble:(int)bubble;

@property (nonatomic,strong) NSString *language;
@property (nonatomic,strong) NSMutableArray *sectionTitles;
@property (nonatomic,strong) NSMutableArray *centuries;
@property (nonatomic,strong) NSMutableArray *pageTitles;
@property (nonatomic,strong) NSMutableArray *content;
@property (nonatomic,strong) NSArray *bubbles;

+ (id)sharedInstance;

@end
