//
//  TRFoodPhotosViewController.m
//  TangibleRecipe
//

#import "TRFoodPhotosViewController.h"
#import "TRRecipeDictonary.h"
#import "TRFood.h"
#import "TRDataManager.h"
#import "TRCustomCollectionViewCell.h"
#import "TRRakutenRecipeViewController.h"

@interface TRFoodPhotosViewController ()
{
    int width;
    int height;
}

@end

@implementation TRFoodPhotosViewController

TRFood *foodInSelection;

- (IBAction)transitToRecipes:(id)sender
{
    TRRakutenRecipeViewController *rakutenRecipeViewController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"RakutenRecipeView"];
    [rakutenRecipeViewController setURL:foodInSelection.recipeListUrl];
    [self.navigationController pushViewController:rakutenRecipeViewController animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    foodInSelection = [[TRDataManager shareManager].foodData objectAtIndex:0];
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
    return [[TRDataManager shareManager].foodData count] ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TRCustomCollectionViewCell *cell = [_foodCollectionView dequeueReusableCellWithReuseIdentifier:@"CellId" forIndexPath:indexPath];
    TRFood *foodAtIndex = (TRFood *)[[TRDataManager shareManager].foodData objectAtIndex:indexPath.row];
    [cell setFood:foodAtIndex];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    foodInSelection = [[TRDataManager shareManager].foodData objectAtIndex:indexPath.row];
    _foodDescription.text = foodInSelection.description;
}


@end
