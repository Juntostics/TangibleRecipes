//
//  TRViewController.m
//  TangibleRecipe
//
//  Created by Kazuki Nishiura on 2013/11/15.
//
//

#import "TRMainViewController.h"
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setScreenSize];
    [self setBGImageToWindow];
    
    //initialize for Tangiblock
    [self getReadyForTangiblockDetection];
    [self createBlockView];
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
    debugLabel.text = ((UIButton *)sender).currentTitle;
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
