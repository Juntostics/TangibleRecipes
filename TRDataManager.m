//
//  TRDataManager.m
//  TangibleRecipe
//
//  Created by Junto Nakaoka on 2013/11/25.
//
//

#import "TRDataManager.h"

@implementation TRDataManager
@synthesize foodDataNum = _foodDataNum;
@synthesize rightImage = _rightImage;
@synthesize leftImage = _leftImage;

static TRDataManager *sharedInstance = nil;

+ (TRDataManager*)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TRDataManager alloc]
                           initSharedInstance];
    });
    return sharedInstance;
}

- (id)initSharedInstance {
    self = [super init];
    if (self) {
        // 初期化処理
        [self initializingForTest];
    }
    return self;
}

- (id)init {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}


- (void)initializingForTest
{
//    self.foodData = [ns]
}


- (NSArray*)getFoodData
{
    return self.foodData;
}


@end
