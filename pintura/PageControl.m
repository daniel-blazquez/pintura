#import "PageControl.h"


// Tweak these or make them dynamic.
#define kDotDiameter 7.0
#define kDotSpacer 7.0

@implementation PageControl

@synthesize dotColorCurrentPage;
@synthesize dotColorOtherPage;
@synthesize currentPage;
@synthesize numberOfPages;
@synthesize delegate;

- (void)setCurrentPage:(NSInteger)page
{
    currentPage = MIN(MAX(0, page), self.numberOfPages-1);
    [self setNeedsDisplay];
}

- (void)setNumberOfPages:(NSInteger)pages
{
    numberOfPages = MAX(0, pages);
    currentPage = MIN(MAX(0, self.currentPage), numberOfPages-1);
    [self setNeedsDisplay];
}

- (id)initWithFrame:(CGRect)frame 
{
    if (self = [super initWithFrame:frame]) 
    {
        // Default colors.
        self.backgroundColor = [UIColor clearColor];
        self.dotColorCurrentPage = [UIColor blackColor];
        self.dotColorOtherPage = [UIColor lightGrayColor];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        self.dotColorCurrentPage = [UIColor blackColor];
        self.dotColorOtherPage = [UIColor lightGrayColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect 
{
    CGContextRef context = UIGraphicsGetCurrentContext();   
    CGContextSetAllowsAntialiasing(context, true);
    
    CGRect currentBounds = self.bounds;
    CGFloat dotsWidth = self.numberOfPages*kDotDiameter + MAX(0, self.numberOfPages-1)*kDotSpacer;
    CGFloat x = CGRectGetMidX(currentBounds)-dotsWidth/2;
    CGFloat y = CGRectGetMidY(currentBounds)-kDotDiameter/2;
    for (int i=0; i<self.numberOfPages; i++)
    {
        CGRect circleRect = CGRectMake(x, y, kDotDiameter, kDotDiameter);
        if (i == self.currentPage)
        {
            CGContextSetFillColorWithColor(context, self.dotColorCurrentPage.CGColor);
        }
        else
        {
            CGContextSetFillColorWithColor(context, self.dotColorOtherPage.CGColor);
        }
        CGContextFillEllipseInRect(context, circleRect);
        x += kDotDiameter + kDotSpacer;
    }
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.delegate) return;
    
    CGPoint touchPoint = [[[event touchesForView:self] anyObject] locationInView:self];
    
    CGFloat dotSpanX = self.numberOfPages*(kDotDiameter + kDotSpacer);
    CGFloat dotSpanY = kDotDiameter + kDotSpacer;
    
    CGRect currentBounds = self.bounds;
    CGFloat x = touchPoint.x + dotSpanX/2 - CGRectGetMidX(currentBounds);
    CGFloat y = touchPoint.y + dotSpanY/2 - CGRectGetMidY(currentBounds);
    
    if ((x<0) || (x>dotSpanX) || (y<0) || (y>dotSpanY)) return;
    
    self.currentPage = floor(x/(kDotDiameter+kDotSpacer));
    if ([self.delegate respondsToSelector:@selector(pageControlPageDidChange:)])
    {
        [self.delegate pageControlPageDidChange:self];
    }
}

@end