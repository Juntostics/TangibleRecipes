//
//  TRRakutenRecipeViewController.h
//  TangibleRecipe
//
//  Created by Kazuki Nishiura on 2013/12/03.
//
//

#import <UIKit/UIKit.h>

@interface TRRakutenRecipeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;

- (void)setURL:(NSURL *)url;
@end
