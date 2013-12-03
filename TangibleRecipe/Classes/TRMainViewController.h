//
//  TRViewController.h
//  TangibleRecipe
//
//  Created by Kazuki Nishiura on 2013/11/15.
//
//

#import <UIKit/UIKit.h>
#import <TangiblockKit/TangiblockKit.h>

@interface TRMainViewController : UIViewController<TBKBlockRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *debugLabel;
@property (weak, nonatomic) IBOutlet UIButton *startCookButton;

- (IBAction)debugFoodButtonPressed:(id)sender;
- (IBAction)onCookButtonPressed:(id)sender;
@end
