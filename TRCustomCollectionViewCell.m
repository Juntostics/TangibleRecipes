//
//  TRCustomCollectionViewCell.m
//  TangibleRecipe
//
//  Created by Junto Nakaoka on 2013/11/25.
//
//

#import "TRCustomCollectionViewCell.h"

@implementation TRCustomCollectionViewCell
@synthesize foodImageView = _foodImageView;
@synthesize foodNameLabel = _foodNameLabel;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

- (void)awakeFromNib
{
//    self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
//    self.selectedBackgroundView.backgroundColor = [UIColor blueColor];
    _foodNameLabel.backgroundColor = [UIColor redColor];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
