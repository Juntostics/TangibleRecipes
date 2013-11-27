//
//  TBKBlock.h
//
//  Copyright (c) 2013 KOTO Co., Ltd. All rights reserved.
//

/**
 * @file
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 * ブロック認識における状態遷移の状態をあらわす。
 *
 * iOS の UITouchPhase と同形になっている。
 */
typedef enum TBKBlockPhase : NSUInteger {
    TBKBlockPhaseBegan,			/**< 認識開始 */
    TBKBlockPhaseMoved,			/**< 移動 */
    TBKBlockPhaseEnded,			/**< 認識終了 */
    TBKBlockPhaseStationary,		/**< 静止 */
} TBKBlockPhase;


 /**
 * ブロックの種類をあらわす。
 * 
 * すなわち「あ」,「い」,...　といった文字種。
 * 命名は Unicode のものをベースにしている。
 */
typedef enum TBKBlockKindCode : NSUInteger {
    TBKCodeRegionBegin = 0x01010000, ///< Tangiblock SDK 用の領域開始
    TBKNullCode = TBKCodeRegionBegin, ///< ヌル文字
    TBKHiraganaLetterACode, ///< あ
    TBKHiraganaLetterICode, ///< い
    TBKHiraganaLetterUCode, ///< う
    TBKHiraganaLetterECode, ///< え
    TBKHiraganaLetterOCode, ///< お
    TBKHiraganaLetterKaCode, ///< か
    TBKHiraganaLetterKiCode, ///< き
    TBKHiraganaLetterKuCode, ///< く
    TBKHiraganaLetterkeCode, ///< け
    TBKHiraganaLetterKoCode, ///< こ
    TBKKatakanaHiraganaVoicedSoundMarkCode, ///< ”（濁点）
    TBKHiraganaLetterSaCode, ///< さ
    TBKHiraganaLetterSiCode, ///< し
    TBKHiraganaLetterSuCode, ///< す
    TBKHiraganaLetterSeCode, ///< せ
    TBKHiraganaLetterSoCode, ///< そ
    TBKHiraganaLetterTaCode, ///< た
    TBKHiraganaLetterTiCode, ///< ち
    TBKHiraganaLetterTuCode, ///< つ
    TBKHiraganaLetterTeCode, ///< て
    TBKHiraganaLetterToCode, ///< と
    TBKHiraganaLetterNaCode, ///< な
    TBKHiraganaLetterNiCode, ///< に
    TBKHiraganaLetterNuCode, ///< ぬ
    TBKHiraganaLetterNeCode, ///< ね
    TBKHiraganaLetterNoCode, ///< の
    TBKHiraganaLetterHaCode, ///< は
    TBKHiraganaLetterHiCode, ///< ひ
    TBKHiraganaLetterHuCode, ///< ふ
    TBKHiraganaLetterHeCode, ///< へ
    TBKHiraganaLetterHoCode, ///< ほ
    TBKHiraganaLetterMaCode, ///< ま
    TBKHiraganaLetterMiCode, ///< み
    TBKHiraganaLetterMuCode, ///< む
    TBKHiraganaLetterMeCode, ///< め
    TBKHiraganaLetterMoCode, ///< も
    TBKHiraganaLetterYaCode, ///< や
    TBKHiraganaLetterYuCode, ///< ゆ
    TBKKatakanaHiraganaSemiVoicedSoundMarkCode, ///< °（半濁点）
    TBKHiraganaLetterYoCode, ///< よ
    TBKHiraganaLetterRaCode, ///< ら
    TBKHiraganaLetterRiCode, ///< り
    TBKHiraganaLetterRuCode, ///< る
    TBKHiraganaLetterReCode, ///< れ
    TBKHiraganaLetterRoCode, ///< ろ
    TBKHiraganaLetterWaCode, ///< わ
    TBKHiraganaLetterWoCode, ///< を
    TBKHiraganaLetterNCode, ///< ん
    TBKFullwidthQuestionMarkCode, ///< ？（疑問符）
    TBKKatakanaHiraganaProlongedSoundMarkCode, ///< ー（音引き）
    TBKCodeRegionEnd = TBKKatakanaHiraganaProlongedSoundMarkCode, ///< Tangiblock SDK 用の領域終了
} TBKBlockKindCode;


/**
 * 認識している（検出している）１つの Tangiblock のブロックを表す。
 */
@interface TBKBlock : NSObject

/**
 * ブロックの状態。
 */
@property (nonatomic, readonly) TBKBlockPhase phase;

/**
 * ブロックの中心座標。
 * view に対する相対。
 */
@property (nonatomic, readonly) CGPoint center;

/**
 * ブロックの回転角度。
 * 単位はラジアン。左回りが正。右回りが負。
 */
@property (nonatomic, readonly) CGFloat rotation;

/**
 * ブロックの種類。
 * 
 * すなわち「あ」,「い」,...　といった文字種。
 * 値はキャラクタではなく独自のコード体系になっている。
 * TBKBlockKindCode の定義を参照。
 */
@property (nonatomic, readonly) TBKBlockKindCode kindCode;

/**
 * 天面の文字。
 */
@property (nonatomic, readonly) NSString *labelString;

/**
 * ブロックの状態更新時刻(秒)
 */
@property (nonatomic, readonly) NSTimeInterval timestamp;

/**
 * ブロックによるものだと認識された UITouch。
 */
@property (nonatomic, readonly) NSSet *touches;

@end

