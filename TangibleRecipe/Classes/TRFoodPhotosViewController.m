//
//  TRFoodPhotosViewController.m
//  TangibleRecipe
//

#import "TRFoodPhotosViewController.h"
#import "TRRecipeDictonary.h"
#import "TRFood.h"
#import "TRCustomCollectionViewCell.h"

@interface TRFoodPhotosViewController ()

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
//	[self loadImageFromUrl:[NSURL URLWithString:@"http://img.cpcdn.com/recipes/2200600/280/ee3ed9aa8d9ab49aec88248aaf20bd4e.jpg?u=5054658&p=1372906777"]];
    NSLog(@"INIT");
    [self initializeForCollectionView];
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
