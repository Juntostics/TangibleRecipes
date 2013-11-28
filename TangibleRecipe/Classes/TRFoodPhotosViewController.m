//
//  TRFoodPhotosViewController.m
//  TangibleRecipe
//

#import "TRFoodPhotosViewController.h"
#import "TRRecipeDictonary.h"
#import "TRFood.h"
#import "TRCustomCollectionViewCell.h"

@interface TRFoodPhotosViewController ()
{
    int width;
    int height;
}

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

    [self initializeForCollectionView];
    [self setScreenSize];
    [self setBGImageToWindow];
}
- (void)setScreenSize
{
    //self.view.frameで得られる縦横が反転しているので、正しいサイズを取得
    width = [[UIScreen mainScreen]bounds].size.height;
    height = [[UIScreen mainScreen]bounds].size.width;
}

- (void)setBGImageToWindow
{
    UIImage *img_before = [UIImage imageNamed:@"foodMenuBG.png"];  // リサイズ前UIImage
    UIImage *img_after;  // リサイズ後UIImage
    
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [img_before drawInRect:CGRectMake(0, 0, width, height)];
    img_after = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:img_after];
}


- (void)loadImageFromUrl:(NSURL*)url
{
    NSData *data = [NSData dataWithContentsOfURL:url];
//    _foodImageView.image = [UIImage imageWithData:data];
}

- (void)initializeForCollectionView
{
    // STCustomCollectionView.xibを指定して（.xibは省略）、UINibオブジェクトを生成
    UINib *nib = [UINib nibWithNibName:@"TRCustomCollectionViewCell" bundle:nil];
    // UICollectionViewに項目表示に使うセルとして登録
    [_foodCollectionView registerNib:nib forCellWithReuseIdentifier:@"CellId"];
    _foodCollectionView.dataSource = self;
    _foodCollectionView.delegate = self;
    _foodCollectionView.backgroundColor = [UIColor clearColor];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TRCustomCollectionViewCell *cell = [_foodCollectionView dequeueReusableCellWithReuseIdentifier:@"CellId" forIndexPath:indexPath];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    STCollectionItem *item = [_items objectAtIndex:indexPath.row];
//    NSString *message = [NSString stringWithFormat:@"%d\n%@", item.number, item.caption];
//    
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
//                                                        message:message
//                                                       delegate:nil
//                                              cancelButtonTitle:nil
//                                              otherButtonTitles:@"OK", nil];
//    [alertView show];
}


@end
