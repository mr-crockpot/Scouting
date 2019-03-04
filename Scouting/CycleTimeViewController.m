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
    
    _dbManager = [[DBManager alloc] initWithDatabaseFilename:@"scoutingDB.db"];
    _lblTeamNumber.text= [NSString stringWithFormat:@"Team: %li",_teamNumber];
    _lblMatchNumber.text = [NSString stringWithFormat:@"Match: %li",_matchNumber];
    
   
    
}



- (IBAction)btnStartHatchPressed:(id)sender {
    
    _timerOn = !_timerOn;
    if (_timerOn) {
        _observationHatch = _observationHatch + 1;
        [self runTimer];
        [_btnStartHatch setTitle:@"Stop Hatch" forState:UIControlStateNormal];
        _btnStartCargo.alpha = 0;
    }
    else {
        [_btnStartHatch setTitle:@"Start Hatch" forState:UIControlStateNormal];
        _btnStartCargo.alpha = 1;
        _timeStamp = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
        _stringTimeStamp = [formatter stringFromDate:_timeStamp];
        
        [self stopTimer];
        [self storeHatchResults];
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
        _timeStamp = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
        _stringTimeStamp = [formatter stringFromDate:_timeStamp];
        [self storeCargoResults];
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

-(void)storeHatchResults {
    
    NSString *querySaveHatchData = [NSString stringWithFormat:@"INSERT INTO hatch VALUES (null,%li,%li,%li,%f,'%@',TRUE)",_teamNumber,_matchNumber,_observationHatch,_timeElapsed,_stringTimeStamp];
    [_dbManager executeQuery:querySaveHatchData];
    
    NSString *testSave =[NSString stringWithFormat:@"SELECT * FROM hatch"];
    
    NSMutableArray *testResult = [[NSMutableArray alloc] initWithArray:[_dbManager loadDataFromDB:testSave]];
    NSLog(@"the data is %@",testResult);
}

-(void)storeCargoResults {
    
    NSString *querySaveCargoData = [NSString stringWithFormat:@"INSERT INTO cargo VALUES (null,%li,%li,%li,%f,'%@',TRUE)",_teamNumber,_matchNumber,_observationHatch,_timeElapsed,_stringTimeStamp];
    [_dbManager executeQuery:querySaveCargoData];
    
    NSString *testSave =[NSString stringWithFormat:@"SELECT * FROM cargo"];
    
    NSMutableArray *testResult = [[NSMutableArray alloc] initWithArray:[_dbManager loadDataFromDB:testSave]];
    NSLog(@"the cargo data is %@",testResult);
}


- (IBAction)btnViewDataPressed:(id)sender {
    [self performSegueWithIdentifier:@"segueCycleTimeToTable"sender:self];
}
@end
