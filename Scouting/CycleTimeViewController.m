//
//  CycleTimeViewController.m
//  Scouting
//
//  Created by Adam Schor on 2/22/19.
//  Copyright © 2019 AandA Development. All rights reserved.
//

#import "CycleTimeViewController.h"

@interface CycleTimeViewController ()

@end

@implementation CycleTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (IBAction)btnStartHatchPressed:(id)sender {
  
    _timerOn = !_timerOn;
    if (_timerOn) {
        [self runTimer];
        [_btnStartHatch setTitle:@"Stop Hatch" forState:UIControlStateNormal];
        _btnStartCargo.alpha = 0;
    }
    else {
        [_btnStartHatch setTitle:@"Start Hatch" forState:UIControlStateNormal];
        _btnStartCargo.alpha = 1;
        [self stopTimer];
    }
}
- (IBAction)btnStartCargoPressed:(id)sender {
    _timerOn = !_timerOn;
    if (_timerOn) {
        [self runTimer];
        [_btnStartCargo setTitle:@"Stop Cargo" forState:UIControlStateNormal];
        _btnStartHatch.alpha = 0;
    }
    else {
        [_btnStartCargo setTitle:@"Start Cargo" forState:UIControlStateNormal];
        _btnStartHatch.alpha = 1;
        [self stopTimer];
    }
}

-(void)runTimer {
    _timeElapsed = 0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerGo) userInfo:nil repeats:YES];
}

-(void)stopTimer {
    [_timer invalidate];
}
-(void)timerGo {
    _timeElapsed = _timeElapsed + .01;
    NSString *time = [NSString stringWithFormat:@"%0.2f",_timeElapsed];
    _lblTimer.text = time;
    
    
}


@end
