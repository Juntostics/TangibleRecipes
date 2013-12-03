//
//  TRViewController.m
//  TangibleRecipe
//
//  Created by Kazuki Nishiura on 2013/11/15.
//
//

#import <AudioToolbox/AudioServices.h>
#import "TRMainViewController.h"
#import "TRFoodPhotosViewController.h"
#import "TRFood.h"
#import "TRRecipeDictonary.h"
#import "TRDataManager.h"


@interface TRMainViewController ()
{
    int width;
    int height;
}

@property TBKDetectionView *detectionView;
@property TBKBlockView *rightBlockView;
@property TBKBlockView *leftBlockView;


@end

// 同時に表示するブロックの個数。
// これを超えたら古い物から TBKBlockView インスタンスを使い回す。
static const int NumberOfBlockDisplayAtATime = 7;


@implementation TRMainViewController

@synthesize debugLabel;
NSMutableArray *ingredients;
SystemSoundID fireSound, okSound, ngSound;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setScreenSize];
    [self setBGImageToWindow];
    
    //initialize for Tangiblock
    [self getReadyForTangiblockDetection];
    [self createBlockView];
    
    ingredients = [[NSMutableArray alloc] init];
    [self initSoundResources];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self resetState];
}

- (void)initSoundResources
{
    NSString *fireSoundPath = [[NSBundle mainBundle] pathForResource:@"fire_tmp" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:fireSoundPath], &fireSound);
    NSString *okSoundPath = [[NSBundle mainBundle] pathForResource:@"positive_feedback_tmp" ofType:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:okSoundPath], &okSound);
    NSString *ngSoundPath = [[NSBundle mainBundle] pathForResource:@"beep_tmp" ofType:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:ngSoundPath], &ngSound);
}

- (void)resetState
{
    [ingredients removeAllObjects];
    debugLabel.text = @"";
    self.startCookButton.enabled = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setScreenSize
{
    //self.view.frameで得られる縦横が反転しているので、正しいサイズを取得
    width = [[UIScreen mainScreen]bounds].size.height;
    height = [[UIScreen mainScreen]bounds].size.width;
}

- (IBAction)debugFoodButtonPressed:(id)sender
{
    NSString *ingredient = ((UIButton *)sender).currentTitle;
    [self handleIngredient:ingredient];
}

// @return ingredientがaddされたかどうか
- (BOOL)handleIngredient:(NSString *)ingredient
{
    if ([ingredients containsObject:ingredient] || [ingredients count] == 2) {
        return false;
    }
    
    [ingredients addObject:ingredient];
    // TODO: play sound
    
    // TODO: remove below debugging-related sentences
    debugLabel.text = [NSString stringWithFormat:@"選択されている食材: %@ ",[ingredients objectAtIndex:0]];
    
    if ([ingredients count] == 2) {
        debugLabel.text = [debugLabel.text stringByAppendingString:ingredient];
        self.startCookButton.enabled = true;
    }
    return true;
}

- (IBAction)onCookButtonPressed:(id)sender
{
    self.startCookButton.enabled = false;
    
    AudioServicesPlaySystemSound(fireSound);
    TRRecipeDictonary *recipeDictionary = [[TRRecipeDictonary alloc] init];
    NSArray *foodList = [recipeDictionary recipesFor:[ingredients objectAtIndex:0] and:[ingredients objectAtIndex:1]];
    NSLog(@"%@ %@ %@", [ingredients objectAtIndex:0], [ingredients objectAtIndex:1], foodList);
    BOOL shouldGoNextView = [foodList count] != 0;
    
    if (shouldGoNextView) {
        [[TRDataManager shareManager] setFoodData:foodList];
        int prefetchLimit = 3;
        for (int i = 0; i < [foodList count] && i < prefetchLimit; i++) {
            [(TRFood *)[foodList objectAtIndex:i] startDataLoading];
        }
    }
    [self performSelector:@selector(feedbackResult:) withObject:[NSNumber numberWithBool:shouldGoNextView] afterDelay:2.0f];

}

- (void)feedbackResult:(NSNumber *)shouldTransit
{
    if([shouldTransit boolValue]) {
        AudioServicesPlaySystemSound(okSound);
        UIViewController *foodPhotoViewController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"FoodPhotoView"];
        [self.navigationController pushViewController:foodPhotoViewController animated:YES];
    } else {
        AudioServicesPlaySystemSound(ngSound);
        [self resetState];
    }
}

- (void)setBGImageToWindow
{
    UIImage *img_before = [UIImage imageNamed:@"MainViewBG.png"];  // リサイズ前UIImage
    UIImage *img_after;  // リサイズ後UIImage

    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [img_before drawInRect:CGRectMake(0, 0, width, height)];
    img_after = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:img_after];
}

#pragma mark Tangiblock
- (void)getReadyForTangiblockDetection
{
    //initialize for Tangiblock
    CGRect screenSize = CGRectMake(0, 0, width,height-150.0f);
    self.detectionView = [[TBKDetectionView alloc] initWithFrame:screenSize delegate:self];
    [self.view addSubview:self.detectionView];

    [self becomeFirstResponder];

}

- (void)createBlockView
{
    CGSize blockSize = self.detectionView.recognizer.blockSize;
    self.rightBlockView = [[TBKBlockView alloc] initWithFrame:CGRectMake(0, 0, blockSize.width, blockSize.height)];
    self.rightBlockView.faceColor = [UIColor brownColor];
    self.rightBlockView.hidden = YES;
    [self.view insertSubview:self.rightBlockView belowSubview:self.detectionView];
    
    self.leftBlockView = [[TBKBlockView alloc] initWithFrame:CGRectMake(0, 0, blockSize.width, blockSize.height)];
    self.leftBlockView.faceColor = [UIColor brownColor];
    self.leftBlockView.hidden = YES;
    [self.view insertSubview:self.leftBlockView belowSubview:self.detectionView];
}

- (void)showBlockStamp:(TBKBlock *)block view:(TBKBlockView *)blockView
{
    [blockView updateProperties:block];
    blockView.hidden = NO;
}



#pragma mark TBKBlockRecognizerDelegate
- (void)blocksBegan:(NSSet *)blocks withEvent:(UIEvent *)event
{
    for (TBKBlock *block in blocks) {
        //画面の右と左で場合分け
        if (block.center.x<=width/2.0f) {
            [self showBlockStamp:block view:self.leftBlockView];
        }else{
            [self showBlockStamp:block view:self.rightBlockView];
        }
        NSLog(@"%d",block.kindCode);
    }
}

@end
