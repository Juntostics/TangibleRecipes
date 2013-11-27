//
//  TBKBlockView.h
//
//  Copyright (c) 2013 KOTO Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <TangiblockKit/TBKBlock.h>


/**
 * ブロックの天面文字を表示する。
 *
 * 背景は backgroundColor で塗る。
 * （[UIColor clearColor] を適用すれば透明になる。）
 * 
 * userInteractionEnabled プロパティの初期値は、
 * UIView 定義での YES から NO に変更している。
 */
@interface TBKBlockView : UIView


/**
 * 初期化。
 * 
 * aRect の size に TBKBlockRecognizer.blockSize の値を使用すれば、
 * 動作環境の画面解像度の違いが吸収され、
 * ブロックの物理サイズとスクリーンに表示されるサイズがちょうど同じになる。
 */
- (id)initWithFrame:(CGRect)aRect;


/**
 * 表示文字色。
 * 初期値は [UIColor blackColor]
 */
@property(nonatomic) UIColor *faceColor;


/**
 * 文字のイメージ。
 *
 * kindCode をセットすると切り替わる。
 * 白地に黒文字のグレースケール。
 */
@property(nonatomic, readonly) UIImage *image;


/**
 * 文字種。
 */
@property(nonatomic) TBKBlockKindCode kindCode;


/**
 * 表示の傾きを設定する。
 *
 * UIView transform に反映される。
 * 
 * @see CGAffineTransformMakeRotation
 */
- (void) setRotation:(CGFloat)rotation;

/**
 * TBKBlock を表現するのに必要なプロパティを取り込む。
 * 
 * kindCode, rotation, center が変化する。
 */
- (void) updateProperties:(TBKBlock *)block;


@end
