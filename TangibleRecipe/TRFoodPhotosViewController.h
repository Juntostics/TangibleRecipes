//
//  TRFoodPhotosViewController.h
//  TangibleRecipe
//

#import <UIKit/UIKit.h>

@interface TRFoodPhotosViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *foodImageView;

- (IBAction)transitToRecipes:(id)sender;
@end
