//
//  PVImageView.h
//  PVAlpha
//
//  Created by Daniel Blazquez on 9/26/12.
//
//

#import <UIKit/UIKit.h>

@interface PVImageView : UIImageView
@property (nonatomic, retain) UIImage* originalImage;
@property (nonatomic, retain) UIImage* thumbnail;
@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* legend;
@property (nonatomic, retain) NSString* legendEN;
@property (nonatomic, retain) NSString* wiki;
@property (nonatomic, retain) NSString* link;
@property (nonatomic, retain) NSString* linkEN;
@property double bottomPadding;
@property (nonatomic, retain) UITapGestureRecognizer* recog;
@end
