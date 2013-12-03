//
//  TRFoodPhotosViewController.h
//  TangibleRecipe
//

#import <UIKit/UIKit.h>

@interface TRFoodPhotosViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *foodImageView;
@property (weak, nonatomic) IBOutlet UILabel *foodName;
@property (weak, nonatomic) IBOutlet UILabel *foodDescription;
@property (weak, nonatomic) IBOutlet UICollectionView *foodCollectionView;

- (IBAction)transitToRecipes:(id)sender;
@end
