//
//  PreMatchViewController.h
//  Scouting
//
//  Created by Adam Schor on 2/22/19.
//  Copyright © 2019 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PreMatchViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *textFieldTeamNumber;
@property (strong, nonatomic) IBOutlet UIButton *btnStart;
- (IBAction)btnStartPressed:(id)sender;

@end

NS_ASSUME_NONNULL_END
