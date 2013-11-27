//
//  TBKBlockSoundPlayer.h
//
//  Copyright (c) 2013 KOTO Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <TangiblockKit/TBKBlock.h>

#import <AVFoundation/AVFoundation.h>

/**
 * ブロックの文字を発声する。
 *
 * 使用には AVFoundation.framework が必要である。
 * Xcode のプロジェクトの設定で Linked Frameworks and Libraries で指定すること。
 *
 * alloc の後 initWithKindCode: で文字を設定し play メソッドを呼ぶと
 * 対応した音声が再生される。
 *
 * 
 * ユーザー入力に対する反応速度を特に気にするアプリケーションを作成する場合の注意：
 *
 * 再生の準備には若干の処理時間がかかるため、
 * ブロックの入力があってから TBKBlockSoundPlayer を生成するのではなく、
 * あらかじめ必要なものを生成しておくと良い。
 *
 * play メソッドは多重再生をサポートするが、この時にも準備のための処理時間が必要になる。
 * 多重の再生を滑らかに行いたい場合には、
 * 再生を TBKBlockSoundPlayer に任せるのではなく、
 * アプリケーションであらかじめ AVAudioPlayer を複数用意するなどの方法をとる。
 * （underlyingPlayer から AVAudioPlayer の data プロパティによって
 * 波形データを取り出し、別の AVAudioPlayer を生成する事が出来る。）
 * 
 * 多重再生が不要な場合には
 * TBKBlockSoundPlayer の play メソッドではなく、
 * underlyingPlayer の play メソッドを使用すると延滞を抑えることができる。
 * なおunderlyingPlayer は kindCode を設定すると波形データをあてがわれて生成されるが、
 * prepareToPlay メソッドは呼ばれていない。
 * play を呼ぶ前には prepareToPlay を呼ぶ必要が有る。
 */
@interface TBKBlockSoundPlayer : NSObject

/**
 * 初期化。
 * 
 * 文字とは結びつけられていない状態になる。
 */
- (id)init;

/**
 * 文字を指定して初期化する。
 * 
 * （init して kindCode を設定するのと同等。）
 */
- (id)initWithKindCode:(TBKBlockKindCode)kindCode;


/**
 * 発声の対象文字。
 * 
 * セットすると以前の underlyingPlayer は破棄され、別のインスタンスに入れ替わる。
 */
@property(nonatomic) TBKBlockKindCode kindCode;


/**
 * 発声（サウンド再生）する。
 * 
 * 多重再生をサポートする。
 * すなわち再生中に呼んだ場合にも以前の再生は途切れずに最後まで再生される。
 * 
 * 多重再生をサポートするために、
 * 再生には underlyingPlayer とは別の AVAudioPlayer インスタンスが内部的に使用される。
 * このインスタンスには underlyingPlayer に設定してあるプロパティが反映される。
 * 反映されるプロパティは
 * 
 * + enableRate
 * + rate
 * + pan
 * + volume
 * + numberOfLoops
 *
 * である。
 */
- (void)play;


/**
 * 再生可能状態になった AVAudioPlayer。
 * 
 * 細かい制御したい場合には、このオブジェクトを使用する。
 * init 直後は nil。
 */
@property(nonatomic) AVAudioPlayer * underlyingPlayer;


@end
