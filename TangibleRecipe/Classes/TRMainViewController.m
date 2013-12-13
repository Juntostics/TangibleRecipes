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
    
    IBOutlet UIImageView *centerCookwareImage;
    IBOutlet UIImageView *rightCookwareImage;
    IBOutlet UIImageView *leftCookwareImage;
    IBOutlet UIButton *rightChangeCookwareBtn;
    IBOutlet UIButton *leftChangeCookwareBtn;
    IBOutlet UIImageView *fireAnimeView;
    
    NSArray *cookwares;
    NSArray *ingredientImages;
    int cookwareNum;
    
    NSMutableArray *rightBlockNumArray;
    NSMutableArray *leftBlockNumArray;
    
}

@property TBKDetectionView *detectionView;
@property TBKBlockView *rightBlockView;
@property TBKBlockView *leftBlockView;

@property IBOutlet UIImageView *leftTanTanImageView;
@property IBOutlet UIImageView *rightTanTanImageView;


@end

// 同時に表示するブロックの個数。
// これを超えたら古い物から TBKBlockView インスタンスを使い回す。
static const int NumberOfBlockDisplayAtATime = 7;


@implementation TRMainViewController

@synthesize debugLabel;
NSMutableArray *ingredients;
SystemSoundID fireSound, okSound, ngSound;
SystemSoundID baconSound,butaSound,carotSound,eggSound,fireSound,garlicSound,milkSound,onionSound,riceSound,tomatoSound,toriSound;


enum{
    Egg=0,
    Milk,
    Onion,
    Bacon,
    Carrot,
    Chicken,
    Pork,
    Tomato,
    Rice,
    Garlic,
};

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setScreenSize];
    [self setBGImageToWindow];
    
    //init mutablearray
    rightBlockNumArray = [[NSMutableArray alloc] init];
    leftBlockNumArray = [[NSMutableArray alloc]init];
    
    //initialize for Tangiblock
    [self getReadyForTangiblockDetection];
    [self createBlockView];
    
    ingredients = [[NSMutableArray alloc] init];
    [self initSoundResources];
    
    //for cookwareimage
    [self initCookwares];
    
    //for anime
    [self initFireAnime];
    
    //for ingredients
    [self initForIngredientImages];
    
    
    //init for tantanblockview
    CGSize blockSize = self.detectionView.recognizer.blockSize;
    self.leftTanTanImageView = [[UIImageView alloc] initWithImage:[ingredientImages objectAtIndex:0]];
    self.leftTanTanImageView.frame = CGRectMake(0, 0,blockSize.width + 200, blockSize.height + 200);
    self.leftTanTanImageView.hidden = YES;
    [self.view addSubview:self.leftTanTanImageView];
    [self.view bringSubviewToFront:self.leftTanTanImageView];

    self.rightTanTanImageView = [[UIImageView alloc] initWithImage:[ingredientImages objectAtIndex:0]];
    self.rightTanTanImageView.frame = CGRectMake(0, 0,blockSize.width + 200, blockSize.height + 200);
    self.rightTanTanImageView.hidden = YES;
    [self.view addSubview:self.rightTanTanImageView];
    [self.view bringSubviewToFront:self.rightTanTanImageView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self resetState];
}

- (void)initSoundResources
{
    NSString *fireSoundPath = [[NSBundle mainBundle] pathForResource:@"fire" ofType:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:fireSoundPath], &fireSound);
    NSString *okSoundPath = [[NSBundle mainBundle] pathForResource:@"fire" ofType:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:okSoundPath], &okSound);
    NSString *ngSoundPath = [[NSBundle mainBundle] pathForResource:@"NGVoice" ofType:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:ngSoundPath], &ngSound);
    
    NSString *baconSoundPath = [[NSBundle mainBundle] pathForResource:@"bacon" ofType:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:baconSoundPath], &baconSound);
    NSString *butaSoundPath = [[NSBundle mainBundle] pathForResource:@"buta" ofType:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:butaSoundPath], &butaSound);
    NSString *carotSoundPath = [[NSBundle mainBundle] pathForResource:@"carot" ofType:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:carotSoundPath], &carotSound);
    NSString *eggSoundPath = [[NSBundle mainBundle] pathForResource:@"egg" ofType:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:eggSoundPath], &eggSound);
    NSString *garlicSoundPath = [[NSBundle mainBundle] pathForResource:@"garlic" ofType:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:garlicSoundPath], &garlicSound);
    NSString *milkSoundPath = [[NSBundle mainBundle] pathForResource:@"milk" ofType:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:milkSoundPath], &milkSound);
    NSString *onionSoundPath = [[NSBundle mainBundle] pathForResource:@"onion" ofType:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:onionSoundPath], &onionSound);
    NSString *riceSoundPath = [[NSBundle mainBundle] pathForResource:@"rice" ofType:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:riceSoundPath], &riceSound);
    NSString *tomatoSoundPath = [[NSBundle mainBundle] pathForResource:@"tomato" ofType:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:tomatoSoundPath], &tomatoSound);
    NSString *toriSoundPath = [[NSBundle mainBundle] pathForResource:@"tori" ofType:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:toriSoundPath], &toriSound);
}

-(void)initForIngredientImages
{
        
    ingredientImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"egg.png"],[UIImage imageNamed:@"milk.png"],[UIImage imageNamed:@"onion.png"],[UIImage imageNamed:@"bacon.png"],[UIImage imageNamed:@"carrot.png"] ,[UIImage imageNamed:@"chicken.png"],[UIImage imageNamed:@"pork.png"],[UIImage imageNamed:@"tomato.png"],[UIImage imageNamed:@"rice.png"],[UIImage imageNamed:@"garlic.png"],nil];
}

-(void)initFireAnime
{
    NSArray *animationArray=[NSArray arrayWithObjects:
                             [UIImage imageNamed:@"fire_1@2x.png"],
                             [UIImage imageNamed:@"fire_2@2x.png"],
                             [UIImage imageNamed:@"fire_3@2x.png"],
                             [UIImage imageNamed:@"fire_4@2x.png"],
                             [UIImage imageNamed:@"fire_5@2x.png"],
                             [UIImage imageNamed:@"fire_6@2x.png"],
                             [UIImage imageNamed:@"fire_7@2x.png"],
                             [UIImage imageNamed:@"fire_8@2x.png"],
                             [UIImage imageNamed:@"fire_9@2x.png"],
                             nil];
 
    fireAnimeView.animationImages=animationArray;
    fireAnimeView.animationDuration=1.5;
    fireAnimeView.animationRepeatCount=0;
}
- (void)resetState
{
    [ingredients removeAllObjects];
    debugLabel.text = @"";
    if([rightBlockNumArray count]==0||[leftBlockNumArray count]==0){
        self.startCookButton.enabled = false;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initCookwares
{
    cookwares = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"transparent-cocote.png"],[UIImage imageNamed:@"transparent-pan.png"],[UIImage imageNamed:@"transparent-wok.png"],nil];
    cookwareNum = 0;
    [self showCookwareImage];
}

-(IBAction)pressRightCookwareBtn:(id)sender{
    
    cookwareNum = cookwareNum+1;
    [self showCookwareImage];
}

-(IBAction)pressLeftCookwareBtn:(id)sender{
    LOG_METHOD;
    cookwareNum =cookwareNum-1;
    if (cookwareNum<0) {
        cookwareNum = 29;//てきとう
    }
    [self showCookwareImage];
}

-(void)showCookwareImage
{
    int num = cookwareNum;
    num = num %3;
    leftCookwareImage.image = [cookwares objectAtIndex:num];
    num = (num+1)%3;
    centerCookwareImage.image = [cookwares objectAtIndex:num];
    num = (num+1)%3;
    rightCookwareImage.image = [cookwares objectAtIndex:num];
    
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
    [rightBlockNumArray addObject:((UIButton *)sender).currentTitle];
}
- (IBAction)debug2:(id)sender
{
    [leftBlockNumArray addObject:((UIButton *)sender).currentTitle];
    
    NSString *ingredient = ((UIButton *)sender).currentTitle;
    [self handleIngredient:ingredient];
}

-(void)handleFoodNumber
{
    
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
    NSArray *foodList = [recipeDictionary recipesFor:[leftBlockNumArray lastObject] and:[rightBlockNumArray lastObject]];
    NSLog(@"---------投げた食材---------%@ %@ %@", [leftBlockNumArray lastObject],[rightBlockNumArray lastObject], foodList);
    BOOL shouldGoNextView = [foodList count] != 0;
    
    if (shouldGoNextView) {
        [[TRDataManager shareManager] setFoodData:foodList];
        int prefetchLimit = 3;
        for (int i = 0; i < [foodList count] && i < prefetchLimit; i++) {
            [[foodList objectAtIndex:i] performSelector:@selector(startDataLoading) withObject:nil afterDelay:1.2f * i];
        }
    }
    if ([foodList count]>0) {
        [self performSelector:@selector(startFire) withObject:[NSNumber numberWithBool:shouldGoNextView] afterDelay:2.3f];
    };
    [self performSelector:@selector(feedbackResult:) withObject:[NSNumber numberWithBool:shouldGoNextView] afterDelay:4.5f];
}

- (void)startFire
{
    [fireAnimeView startAnimating];
}

- (void)feedbackResult:(NSNumber *)shouldTransit
{
    if([shouldTransit boolValue]) {
//        AudioServicesPlaySystemSound(okSound);
        UIViewController *foodPhotoViewController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"FoodPhotoView"];
        [self.navigationController pushViewController:foodPhotoViewController animated:YES];
        [fireAnimeView stopAnimating];
        
        //datamanagerに画像を保存
        
    } else {
        AudioServicesPlaySystemSound(ngSound);
        [self resetState];
    }
}

- (void)setBGImageToWindow
{
    UIImage *img_before = [UIImage imageNamed:@"background1_with_stove@2x.png"];  // リサイズ前UIImage
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

- (void)showBlockStamp:(TBKBlock *)block view:(TBKBlockView *)blockView right:(BOOL)right
{
    NSString *ingredientStr;
    int imageNum = block.kindCode%10;
    switch (block.kindCode%10) {
        case Egg:
            AudioServicesPlaySystemSound(eggSound);
            LOG(@"%d",Egg);
            ingredientStr = @"たまご";
            break;
        case Milk:
            AudioServicesPlaySystemSound(milkSound);
            LOG(@"%d",Milk);
            ingredientStr = @"牛乳";
            break;
        case Onion:
            AudioServicesPlaySystemSound(onionSound);
            LOG(@"%d",Onion);
            ingredientStr = @"玉ねぎ";
            break;
        case Bacon:
            AudioServicesPlaySystemSound(baconSound);
            LOG(@"%d",Bacon);
            ingredientStr = @"ベーコン";
            break;
        case Carrot:
            AudioServicesPlaySystemSound(carotSound);
            LOG(@"%d",Carrot);
            ingredientStr = @"にんじん";
            break;
        case Chicken:
            AudioServicesPlaySystemSound(toriSound);
            LOG(@"%d",Chicken);
            ingredientStr = @"とり肉";
            break;
        case Pork:
            AudioServicesPlaySystemSound(butaSound);
            LOG(@"%d",Pork);
            ingredientStr = @"ぶた肉";
            break;
        case Tomato:
            AudioServicesPlaySystemSound(tomatoSound);
            LOG(@"%d",Tomato);
            ingredientStr = @"トマト";
            break;
        case Rice:
            AudioServicesPlaySystemSound(riceSound);
            LOG(@"%d",Rice);
            ingredientStr = @"ご飯";
            break;
        case Garlic:
            AudioServicesPlaySystemSound(garlicSound);
            LOG(@"%d",Garlic);
            ingredientStr = @"にんにく";
            break;
        default:
            break;
    }
//    blockView.image = (UIImage *)[ingredientImages objectAtIndex:block.kindCode%10];
    if(right){
        self.rightTanTanImageView.hidden = NO;
        self.rightTanTanImageView.center = block.center;
        self.rightTanTanImageView.transform = CGAffineTransformMakeRotation(block.rotation);
        self.rightTanTanImageView.image = [ingredientImages objectAtIndex:block.kindCode%10];
        
        [rightBlockNumArray addObject:ingredientStr];
        DATAMANAGER.rightImage = [ingredientImages objectAtIndex:imageNum];
    }else{
        self.leftTanTanImageView.hidden = NO;
        self.leftTanTanImageView.center = block.center;
        self.leftTanTanImageView.transform = CGAffineTransformMakeRotation(block.rotation);
        self.leftTanTanImageView.image = [ingredientImages objectAtIndex:block.kindCode%10];
        
        [leftBlockNumArray addObject:ingredientStr];
        DATAMANAGER.leftImage = [ingredientImages objectAtIndex:imageNum];
    }
    
    if([leftBlockNumArray count]>0&&[rightBlockNumArray count]>0){
        if ([((NSString *)[leftBlockNumArray lastObject]) isEqualToString:((NSString * )[rightBlockNumArray lastObject])]) {
            return;
        }
        self.startCookButton.enabled = true;
    }
    
//    [blockView updateProperties:block];
//    blockView.hidden = NO;
}



#pragma mark TBKBlockRecognizerDelegate
- (void)blocksBegan:(NSSet *)blocks withEvent:(UIEvent *)event
{
    for (TBKBlock *block in blocks) {
        //画面の右と左で場合分け
        if (block.center.x<=width/2.0f) {
            [self showBlockStamp:block view:self.leftBlockView right:NO];
        }else{
            [self showBlockStamp:block view:self.rightBlockView right:YES];
        }
        NSLog(@"%d",block.kindCode);
    }
}

@end
