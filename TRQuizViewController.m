//
//  TRQuizViewController.m
//  TangibleRecipe
//
//  Created by Junto Nakaoka on 2013/12/05.
//
//

#import "TRQuizViewController.h"
#import "TRFood.h"
#import "TRRakutenRecipeViewController.h"
#import "TRDataManager.h"


@interface TRQuizViewController ()
{
    int width;
    int height;
    IBOutlet UIImageView *leftImageView;
    IBOutlet UIImageView *rightImageView;
}

@end

@implementation TRQuizViewController

TRFood *foodInSelection;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    foodInSelection = [[TRDataManager shareManager].foodData objectAtIndex:DATAMANAGER.foodDataNum];
    [self setScreenSize];
    [self setBGImageToWindow];
    
    rightImageView.image =DATAMANAGER.rightImage;
    leftImageView.image =DATAMANAGER.leftImage;
    
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:@"ちゃれんじ！" message:@"おかあさんにクイズをだそう！"
                              delegate:nil cancelButtonTitle:@"はい！" otherButtonTitles:nil];
    [alert show];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark initialize
- (void)setScreenSize
{
    //self.view.frameで得られる縦横が反転しているので、正しいサイズを取得
    width = [[UIScreen mainScreen]bounds].size.height;
    height = [[UIScreen mainScreen]bounds].size.width;
}

- (void)setBGImageToWindow
{
    UIImage *img_before = [UIImage imageNamed:@"background3@2x.png"];  // リサイズ前UIImage
    UIImage *img_after;  // リサイズ後UIImage
    
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [img_before drawInRect:CGRectMake(0, 0, width, height)];
    img_after = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:img_after];
}

- (IBAction)transitToRecipes:(id)sender
{
    TRRakutenRecipeViewController *rakutenRecipeViewController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"RakutenRecipeView"];
    [rakutenRecipeViewController setURL:foodInSelection.recipeListUrl];
    [self.navigationController pushViewController:rakutenRecipeViewController animated:YES];
}



@end
