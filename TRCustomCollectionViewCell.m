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
//    _foodNameLabel.backgroundColor = [UIColor redColor];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(id)setFood:(TRFood *)food
{
    _foodNameLabel.text = food.name;
    [food registerImageView:_foodImageView];
    return self;
}

@end
