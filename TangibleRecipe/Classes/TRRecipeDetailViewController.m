//
//  TRRecipeDetailViewController.m
//  TangibleRecipe
//

#import "TRRecipeDetailViewController.h"

@interface TRRecipeDetailViewController ()

@end

@implementation TRRecipeDetailViewController

- (void)setUrl:(NSURL *)newUrl
{
    if (_url != newUrl) {
        _url = newUrl;
        NSURLRequest *request = [NSURLRequest requestWithURL:_url];
        _webView.scalesPageToFit = YES;
        [_webView loadRequest:request];
    }
}

@end
