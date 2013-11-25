//
//  TRFood.h
//  TangibleRecipe
//
//  Created by Kazuki Nishiura on 2013/11/25.
//
//

#import <Foundation/Foundation.h>

@interface TRFood : NSObject
@property (readonly, nonatomic) NSString *name;
@property (readonly, nonatomic) NSURL *recipeListUrl;

- (id)initWithName:(NSString*)name andId:(NSString *)categoryId;
- (void)startDataLoading;
/**
 * Register imageview to show the image of this food. Image is assigned immediately 
 * if the loading is already done, otherwise, it's done asynchronously.
 **/
- (void)registerImageView:(UIImageView *)myImageView;
@end
