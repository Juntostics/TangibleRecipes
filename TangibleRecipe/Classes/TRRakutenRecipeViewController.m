//
//  TRRakutenRecipeViewController.m
//  TangibleRecipe
//
//  Created by Kazuki Nishiura on 2013/12/03.
//
//

#import "TRRakutenRecipeViewController.h"

@interface TRRakutenRecipeViewController ()

@end

@implementation TRRakutenRecipeViewController

NSURL *url;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setURL:(NSURL *)url_
{
    url = url_;
}


@end
