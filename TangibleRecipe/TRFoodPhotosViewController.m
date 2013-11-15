//
//  TRFoodPhotosViewController.m
//  TangibleRecipe
//

#import "TRFoodPhotosViewController.h"

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
	[self loadImageFromUrl:[NSURL URLWithString:@"http://img.cpcdn.com/recipes/2200600/280/ee3ed9aa8d9ab49aec88248aaf20bd4e.jpg?u=5054658&p=1372906777"]];
}

- (void)loadImageFromUrl:(NSURL*)url
{
    NSData *data = [NSData dataWithContentsOfURL:url];
    _foodImageView.image = [UIImage imageWithData:data];
}

@end
