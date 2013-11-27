//
//  TBKBlockRecognizer.h
//
//  Copyright (c) 2013 KOTO Co., Ltd. All rights reserved.
//

#import <TangiblockKit/TBKBlock.h>


//////////////////////////////////////////////////////////////////////
/**
 * TBKBlockRecognizer からブロックの動きの通知を受けるデリゲート。
 *
 * 全てのメソッドは @@optional である。
 *
 * iOS では、マルチタッチの状態遷移と遷移イベントを伝えるメソッド郡が UIResponder で
 *
 * * touchesBegan:withEvent:
 * * touchesMoved:withEvent:
 * * touchesEnded:withEvent:
 * * touchesCancelled:withEvent:
 * 
 * と定義されているが、これと同様な形式で TBKBlockRecognizer ではブロックの認識の状態遷移を
 * 
 * * #blocksBegan:withEvent:
 * * #blocksMoved:withEvent:
 * * #blocksEnded:withEvent:
 *
 * のメソッドで伝える。
 * （cancel は ended に含まれる。）
 *
 * 加えて TBKBlockRecognizer が受け取ったイベントのうちブロックの一部であると
 * 認識されていないタッチについて、UIResponder のメソッドに似せた以下のメソッドで通知する。
 *
 * * #nonBlockTouchesBegan:withEvent:
 * * #nonBlockTouchesMoved:withEvent:
 * * #nonBlockTouchesEnded:withEvent:
 *
 * （ここでも cancel は ended に含まれる。区別が必要であれば引き渡された UITouch に問い合わせる。）
 */
@protocol TBKBlockRecognizerDelegate <NSObject>

@optional

////////////////////
// for Block

/**
 * ブロックの認識開始時に呼ばれる
 * @param blocks	ブロックの集合。要素の型は TBKBlock 。
 * @param event		処理したイベント
 */
- (void)blocksBegan:(NSSet *)blocks withEvent:(UIEvent *)event;

/**
 * 認識済みのブロックが移動した時に呼ばれる
 * @param blocks	ブロックの集合。要素の型は TBKBlock 。
 * @param event		処理したイベント
 */
- (void)blocksMoved:(NSSet *)blocks withEvent:(UIEvent *)event;

/**
 * 認識済みのブロックが認識できなくなった時に呼ばれる。
 * （UITouchPhaseCancelled の UITouch を受けた場合、すなわちメモリ不足警告等のシステムによる割り込みで追跡出来なくなった場合を含む。）
 * @param blocks	ブロックの集合。要素の型は TBKBlock 。
 * @param event		処理したイベント
 */
- (void)blocksEnded:(NSSet *)blocks withEvent:(UIEvent *)event;


////////////////////
// for non-block touches

/**
 * ブロックとして認識されていないタッチの開始を通知する。
 * 新たなタッチの開始（UITouchPhaseBegan）の時だけでなく、
 * ブロックの一部として認識されていた UITouch がブロックとして解釈不可能になった場合を含む。
 * （後者の場合は UITouch の phase は UITouchPhaseMoved ないしは UITouchPhaseStationary になっている。）
 */
- (void)nonBlockTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

/**
 * ブロックとして認識されていないタッチの移動を通知する。
 */
- (void)nonBlockTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
/**
 * ブロックとして認識されていないタッチの終了を通知する。
 * UITouch のとしての終了（UITouch の phase が UITouchPhaseEnded）だけでなく、
 * ブロックとして認識されるようになった場合（phase は UITouchPhaseMoved）、
 * およびキャンセル（phase は UITouchPhaseCancelled）の場合を含む。
 */
- (void)nonBlockTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

@end


//////////////////////////////////////////////////////////////////////
/**
 * 与えられたイベントの中からブロックの動きを識別（検出）する。
 *
 * 検出した内容をデリゲート（ TBKBlockRecognizerDelegate ）に通知する。
 */
@interface TBKBlockRecognizer : NSObject

/**
 * ブロックを認識する対象ビュー。
 *
 * 検出したブロックの座標値はこのビューの座標系での値になる。
 */
@property (weak, nonatomic) UIView *view;

/**
 * 検出結果の報告先であるデリゲート。
 */
@property (weak, nonatomic) id<TBKBlockRecognizerDelegate> delegate;

/**
 * 現在認識しているブロック。
 * 要素の型は TBKBlock 。
 */
@property (nonatomic, readonly) NSSet *blocks;


////////////////////
// 初期化

/**
 * view と delegate を指定して初期化する。
 * @param view		ブロックを認識するビュー
 * @param delegate	デリゲート
 */
- (id)initWithView:(UIView *)view delegate:(id<TBKBlockRecognizerDelegate>)delegate;


/**
 * ブロックの物理的な大きさに相当する iOS の描画空間での大きさを取得する。
 * 
 * iOS では実行環境によって物理的な長さに対する、描画空間（ビュー座標系）での長さは異なる。
 * このメソッドを使うと、ブロックの印影画像などを実際のブロックの大きさにぴったり合わせる事が出来る。
 * 
 * 認識したブロックのサイズではないので、認識前に使用出来る。
 * 
 * @return ブロックの大きさ。単位はポイント。
 */
@property (nonatomic, readonly) CGSize blockSize;


////////////////////
// recognizer へのイベント供給。

/**
 * マルチタッチイベントを受け取る。
 * 
 * TBKBlockRecognizer はここで提供されるイベントを元にブロックを認識する。
 * メソッドの引数の意味は UIResponder で定義されている同名のメソッドと同じである。
 * 
 * 通常 TBKBlockRecognizer の利用者は、
 * イベントを取得するために UIView ないしは UIViewController（もしくはそれらのサブクラス）を使用する。
 * これらにも同名のメソッドが定義されているので、それらをオーバーライドして
 * そこで得たイベント（ touches と event ）をこのメソッドを使い TBKBlockRecognizer へ供給する。
 * （すなわち、ソフトウェアパターンで言うところの delegation pattern パターンにする。）
 *
 * ４つのメソッド
 *
 * * touchesBegan:withEvent:
 * * touchesMoved:withEvent:
 * * touchesEnded:withEvent:
 * * touchesCancelled:withEvent:
 * 
 * はセットで意味をなすものなので、これら全てについて同様の扱いをすること。
 * 
 * 参考：
 * TBKDetectionView は、この定型的な実装を提供する。
 * 特に事情がない場合には TBKBlockRecognizer を直接使うのではなく、
 * TBKDetectionView を使用すると良い。
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

/**
 * マルチタッチイベントを受け取る。
 * #touchesBegan:withEvent: を参照。
 */

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

/**
 * マルチタッチイベントを受け取る。
 * #touchesBegan:withEvent: を参照。
 */
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

/**
 * マルチタッチイベントを受け取る。
 * #touchesBegan:withEvent: を参照。
 */
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;

@end
