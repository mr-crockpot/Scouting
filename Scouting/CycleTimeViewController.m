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
    
    UIBarButtonItem *viewData = [[UIBarButtonItem alloc] initWithTitle:@"View Data" style:UIBarButtonItemStylePlain target:self action:@selector(btnViewDataPressed)];
    self.navigationItem.leftItemsSupplementBackButton = YES;
    self.navigationItem.rightBarButtonItems= [NSArray arrayWithObjects:viewData, nil];
    
    
    
    _lblTeamNumber.text= [NSString stringWithFormat:@"%li",_teamNumber];
    _lblMatchNumber.text = [NSString stringWithFormat:@"%li",_matchNumber];
     [_btnStartCargo setImage:[UIImage imageNamed:@"play2.png"] forState:UIControlStateNormal];
     [_btnStartHatch setImage:[UIImage imageNamed:@"play2.png"] forState:UIControlStateNormal];
    
   
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self formatLabels];
    
}

-(void)viewDidAppear:(BOOL)animated {
    
    if ([self testForNumbers]) {
        _btnStartCargo.enabled = YES;
        _btnStartHatch.enabled = YES;
    }
    else {
        _btnStartCargo.enabled = NO;
        _btnStartHatch.enabled = NO;
    }
    
}

-(void)formatLabels{
    
    for (UILabel *label in _outletCollectionLabels) {
        label.font = [UIFont fontWithName:@"Helvetica" size:16];
        label.textColor = [UIColor blueColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.layer.borderColor = [[UIColor blueColor] CGColor];
        label.layer.borderWidth = 2;
        
    }
    _lblCargo.layer.borderWidth = 0;
    _lblHatch.layer.borderWidth = 0;
    _lblTeamNumber.font = [UIFont fontWithName:@"Helvetica" size:42];
    _lblMatchNumber.font = [UIFont fontWithName:@"Helvetica" size:42];
    
    _lblTimer.font =[UIFont fontWithName:@"Helvetica" size:60];
    _lblTimer.textColor = [UIColor redColor];
    
}



- (IBAction)btnStartHatchPressed:(id)sender {
    
    _timerOn = !_timerOn;
    if (_timerOn) {
        _observationHatch = _observationHatch + 1;
        [self runTimer];
      //  [_btnStartHatch setTitle:@"Stop Hatch" forState:UIControlStateNormal];
        [_btnStartHatch setImage:[UIImage imageNamed:@"stop1.png"] forState:UIControlStateNormal];
        _btnStartCargo.alpha = 0;
    }
    else {
       // [_btnStartHatch setTitle:@"Start Hatch" forState:UIControlStateNormal];
        [_btnStartHatch setImage:[UIImage imageNamed:@"play2.png"] forState:UIControlStateNormal];
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
     //   [_btnStartCargo setTitle:@"Stop Cargo" forState:UIControlStateNormal];
         [_btnStartCargo setImage:[UIImage imageNamed:@"stop1.png"] forState:UIControlStateNormal];
        _btnStartHatch.alpha = 0;
    }
    else {
    //    [_btnStartCargo setTitle:@"Start Cargo" forState:UIControlStateNormal];
        [_btnStartCargo setImage:[UIImage imageNamed:@"play2.png"] forState:UIControlStateNormal];
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
    _type = @"H";
   NSString *querySaveHatchData = [NSString stringWithFormat:@"INSERT INTO times VALUES (null,%li,%li,%li,'%@',%0.1f,'%@',TRUE)",_teamNumber,_matchNumber,_observationHatch,_type,_timeElapsed,_stringTimeStamp];
    [_dbManager executeQuery:querySaveHatchData];
    
    NSString *testSave =[NSString stringWithFormat:@"SELECT * FROM times"];
    
    NSMutableArray *testResult = [[NSMutableArray alloc] initWithArray:[_dbManager loadDataFromDB:testSave]];
    NSLog(@"the data is %@",testResult);
}

-(void)storeCargoResults {
    _type = @"C";
    NSString *querySaveCargoData = [NSString stringWithFormat:@"INSERT INTO times VALUES (null,%li,%li,%li,'%@',%0.1f,'%@',TRUE)",_teamNumber,_matchNumber,_observationHatch,_type,_timeElapsed,_stringTimeStamp];
    [_dbManager executeQuery:querySaveCargoData];
    
    NSString *testSave =[NSString stringWithFormat:@"SELECT * FROM times"];
    
    NSMutableArray *testResult = [[NSMutableArray alloc] initWithArray:[_dbManager loadDataFromDB:testSave]];
    NSLog(@"the cargo data is %@",testResult);
}


- (void)btnViewDataPressed {
    [self performSegueWithIdentifier:@"segueCycleTimeToTable"sender:self];
}
- (IBAction)btnStopMatchPressed:(id)sender {
    [_timer invalidate];
    _lblTeamNumber.text = nil;
    _lblMatchNumber.text = nil;
    [self performSegueWithIdentifier:@"segueCycleTimeToPreMatch"sender:self];
    
}

-(BOOL)testForNumbers{
    
    BOOL numbersThere;
    
    if (_lblMatchNumber.text.length == 0 || _lblMatchNumber.text.length == 0) {
        numbersThere = NO;
    }
    else {
        numbersThere = YES;
    }
    return numbersThere;
}

@end
