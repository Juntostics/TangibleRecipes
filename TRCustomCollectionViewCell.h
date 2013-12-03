//
//  TRCustomCollectionViewCell.h
//  TangibleRecipe
//
//  Created by Junto Nakaoka on 2013/11/25.
//
//

#import <UIKit/UIKit.h>
#import "TRFood.h"

@interface TRCustomCollectionViewCell : UICollectionViewCell

@property IBOutlet UIImageView *foodImageView;
@property IBOutlet UILabel *foodNameLabel;

-(id)setFood:(TRFood *)food;
@end
