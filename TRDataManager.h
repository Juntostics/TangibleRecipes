//
//  TRDataManager.h
//  TangibleRecipe
//
//  Created by Junto Nakaoka on 2013/11/25.
//
//

#import <Foundation/Foundation.h>

@interface TRDataManager : NSObject

@property NSDictionary *foodData;


+ (TRDataManager*)shareManager;

@end
