//
//  TRRecipeDictonary.h
//  TangibleRecipe


#import <Foundation/Foundation.h>

@interface TRRecipeDictonary : NSObject
/**
 * @return NSArray of TRFood, or nil if no food found for given ingredients.
 */
-(NSArray*)recipesFor:(NSString*)ingredient1 and:(NSString*)ingredient2;
@end
