//
//  TRDataManager.h
//  TangibleRecipe
//
//  Created by Junto Nakaoka on 2013/11/25.
//
//

#import <Foundation/Foundation.h>

@interface TRDataManager : NSObject

@property NSArray *foodData;

+ (TRDataManager*)shareManager;

@end
