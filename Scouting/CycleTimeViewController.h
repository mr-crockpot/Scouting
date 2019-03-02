//
//  CycleTimeViewController.h
//  Scouting
//
//  Created by Adam Schor on 2/22/19.
//  Copyright © 2019 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface CycleTimeViewController : UIViewController


@property (strong,nonatomic) DBManager *dbManager;


@property NSTimer *timer;
@property float timeElapsed;
@property NSInteger teamNumber;
@property NSInteger matchNumber;
@property NSInteger observationNumber;



@property BOOL timerOn;





@property (strong, nonatomic) IBOutlet UIButton *btnStartHatch;
- (IBAction)btnStartHatchPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnStartCargo;
- (IBAction)btnStartCargoPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lblTimer;
@property (strong, nonatomic) IBOutlet UILabel *lblTeamNumber;
@property (strong, nonatomic) IBOutlet UILabel *lblMatchNumber;
@property NSInteger observationHatch;

@property NSDate *timeStamp;
@property NSString *stringTimeStamp;
@property (strong, nonatomic) IBOutlet UIButton *btnViewData;
- (IBAction)btnViewDataPressed:(id)sender;



@end

NS_ASSUME_NONNULL_END
