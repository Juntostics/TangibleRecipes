//
//  TBKDetectionView.h
//
//  Copyright (c) 2013 KOTO Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <TangiblockKit/TBKBlockRecognizer.h>

/**
 * ブロックを検出する View。
 * 
 * TBKBlockRecognizer へのイベント供給を実装する。
 * 通常は透明な View である。
 * 簡易に TBKBlockRecognizer を使えるように定型的な実装を提供するものである。
 * アプリケーションは、
 * このクラスを使わずに直接 TBKBlockRecognizer をコントロールするようにしても構わない。
 */
@interface TBKDetectionView : UIView

/**
 * 初期化。
 *
 * 補足：
 * multipleTouchEnabled は YES になる。
 */
- (id)initWithFrame:(CGRect)aRect delegate:(id<TBKBlockRecognizerDelegate>)delegate;

/**
 * 検出に使用する TBKBlockRecognizer。
 */
@property (nonatomic, readonly) TBKBlockRecognizer* recognizer;


/**
 * デバッグ目的の格子線表示の表示間隔。
 * 0 にすると格子は表示されない。
 * 初期値は 0。
 *
 * 透明な部品なのでデバッグの際に存在を見て判断出来るようにする補助機能。
 */
@property (nonatomic) CGFloat debugGridSize;

@end
