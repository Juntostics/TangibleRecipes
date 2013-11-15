//
//  TRRecipeListViewController.h
//  TangibleRecipe
//

#import <UIKit/UIKit.h>
#import "TRRecipeDetailViewController.h"

@interface TRRecipeListViewController : UITableViewController
@property (nonatomic, retain) NSArray *recipes;
@property (nonatomic, retain) NSArray *recipeUrls;

@property (strong, nonatomic) TRRecipeDetailViewController *detailViewController;

- (IBAction)backToMainView:(id)sender;
@end
