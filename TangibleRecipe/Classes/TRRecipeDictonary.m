//
//  TRRecipeDictonary.m
//  TangibleRecipe
//


#import "TRRecipeDictonary.h"
#import "TRFood.h"

@implementation TRRecipeDictonary
NSDictionary *recipesDictonary;

-(void)initDictonary{
    recipesDictonary = @{
    // TODO: replace this with actual list
    @"ご飯+卵" : @[[[TRFood alloc] initWithName:@"天津飯" andId:@"13-119-882"]]
    };
}

-(NSArray *)recipesFor:(NSString*)ingredient1 and:(NSString*)ingredient2
{
    if (!recipesDictonary) {
        [self initDictonary];
    }
    
    if ([ingredient1 compare:ingredient2] == NSOrderedDescending) {
        // swap
        NSString *tmp = ingredient1;
        ingredient1 = ingredient2;
        ingredient2 = tmp;
    }
    NSString *key = [ingredient1 stringByAppendingString:[@"+" stringByAppendingString:ingredient2]];
    
    return [recipesDictonary objectForKey:key];
}
@end
