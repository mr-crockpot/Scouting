//
//  PreMatchViewController.h
//  Scouting
//
//  Created by Adam Schor on 2/22/19.
//  Copyright © 2019 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PreMatchViewController : UIViewController <UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UITextField *textFieldTeamNumber;
@property (strong, nonatomic) IBOutlet UIButton *btnStart;
- (IBAction)btnStartPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *textFieldMatchNumber;

@property (strong, nonatomic) NSMutableArray *arrScouts;
@property NSInteger scoutNumber;

@property NSMutableArray *arrLabels;
@end

NS_ASSUME_NONNULL_END
