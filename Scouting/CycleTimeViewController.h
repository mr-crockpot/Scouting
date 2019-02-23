//
//  CycleTimeViewController.h
//  Scouting
//
//  Created by Adam Schor on 2/22/19.
//  Copyright © 2019 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QRCodeMaker.h"

NS_ASSUME_NONNULL_BEGIN

@interface CycleTimeViewController : UIViewController

@property NSTimer *timer;
@property float timeElapsed;
@property BOOL timerOn;


@property (strong, nonatomic) IBOutlet UIButton *btnStartHatch;
- (IBAction)btnStartHatchPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnStartCargo;
- (IBAction)btnStartCargoPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lblTimer;
@property (strong, nonatomic) IBOutlet UILabel *lblTeamNumber;
@property (strong, nonatomic) IBOutlet UILabel *lblMatchNumber;

@end

NS_ASSUME_NONNULL_END
