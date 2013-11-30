//
//  TRFood.m
//  TangibleRecipe
//
//  Created by Kazuki Nishiura on 2013/11/25.
//
//

#import "TRFood.h"

@interface TRFood() {
@private
    bool _isLoadingStarted;
    NSString *_categoryId;
    NSURL *_foodUrl;
    NSData *_imageData;
    UIImageView *_imageView;
}
@end

@implementation TRFood

- (id)initWithName:(NSString*)name id:(NSString *)categoryId andDescription:(NSString *)description
{
    _name = name;
    _categoryId = categoryId;
    _description = description;
    NSURL *baseCategoryURL = [NSURL URLWithString:@"http://recipe.rakuten.co.jp/category/"];
    _recipeListUrl = [NSURL URLWithString:categoryId relativeToURL:baseCategoryURL];
    return self;
}

- (void)startDataLoading
{
    if (_isLoadingStarted) {
        return;
    }
    _isLoadingStarted = TRUE;
    NSMutableDictionary *plistDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"api_config" ofType:@"plist"]];;
    NSString *appId = [plistDict objectForKey:@"app_id"];
    NSURL *recipeRankingUrlBase = [NSURL URLWithString:@"https://app.rakuten.co.jp/services/api/Recipe/CategoryRanking/20121121"];
    NSURL *recipeRankingUrl = [NSURL URLWithString:[NSString stringWithFormat:@"?format=json&applicationId=%@&categoryId=%@", appId, _categoryId]
                                     relativeToURL:recipeRankingUrlBase];
    NSLog(@"loading ranking %@", [recipeRankingUrl description]);
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:recipeRankingUrl];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                               _foodUrl = [NSURL URLWithString:[[json objectForKey:@"result"][0] objectForKey:@"foodImageUrl"]];
                               NSLog(@"start fetching image from %@ ...", [_foodUrl description]);
                               [self startFetchingFoodImage];
                           }];
}

- (void)startFetchingFoodImage
{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:_foodUrl];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               @synchronized(self) {
                                   _imageData = data;
                                   if (_imageView) {
                                       _imageView.image = [UIImage imageWithData:data];
                                   }
                               }
                           }];
}

- (void)registerImageView:(UIImageView*)imageView
{
    [self startDataLoading];
    @synchronized(self) {
        _imageView = imageView;
        if (_imageData) {
            imageView.image = [UIImage imageWithData:_imageData];
        }
    }
}
@end
