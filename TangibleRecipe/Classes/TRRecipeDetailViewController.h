//
//  TRRecipeDetailViewController.h
//  TangibleRecipe
//

#import <UIKit/UIKit.h>

@interface TRRecipeDetailViewController : UIViewController

@property (strong, nonatomic) NSURL *url;

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end
