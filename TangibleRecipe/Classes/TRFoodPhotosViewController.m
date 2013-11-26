//
//  TRFoodPhotosViewController.m
//  TangibleRecipe
//

#import "TRFoodPhotosViewController.h"
#import "TRRecipeDictonary.h"
#import "TRFood.h"

@interface TRFoodPhotosViewController ()

@end

@implementation TRFoodPhotosViewController

- (IBAction)transitToRecipes:(id)sender
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"RecipesStoryboard" bundle:nil];
    window.rootViewController = [storyBoard instantiateViewControllerWithIdentifier:@"RecipesViewController"];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    TRRecipeDictonary *recipeDictionary = [[TRRecipeDictonary alloc] init];
    NSArray *foods = [recipeDictionary recipesFor:@"たまご" and:@"ご飯"];
    if (foods) {
        TRFood *food = [foods objectAtIndex:0];
        [_foodName setText:[NSString stringWithFormat:@"%@", food.name]];
        [food registerImageView:_foodImageView];
    }
}

- (void)loadImageFromUrl:(NSURL*)url
{
    NSData *data = [NSData dataWithContentsOfURL:url];
    _foodImageView.image = [UIImage imageWithData:data];
}

@end
