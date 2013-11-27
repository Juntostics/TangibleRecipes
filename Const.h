//
//  Const.h
//  TangibleRecipe
//
//  Created by Junto Nakaoka on 2013/11/25.
//
//

#ifndef TangibleRecipe_Header_h
#define TangibleRecipe_Header_h

// NSLog
#ifdef DEBUG
#define LOG(...) NSLog(__VA_ARGS__)
#define LOG_METHOD NSLog(@"%s", __func__)
#else
#define LOG(...)
#define LOG_METHOD
#endif

// Short Cuts
#define DATAMANAGER  [TRDataManager shareManager]




#endif