//
//  TRFoodPhotosViewController.h
//  TangibleRecipe
//

#import <UIKit/UIKit.h>

@interface TRFoodPhotosViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *foodImageView;
@property (weak, nonatomic) IBOutlet UILabel *foodName;

- (IBAction)transitToRecipes:(id)sender;
@end
