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

- (IBAction)debugFoodButtonPressed:(id)sender;

@end
