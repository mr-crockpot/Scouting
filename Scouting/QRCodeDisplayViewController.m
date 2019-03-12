//
//  QRCodeDisplayViewController.m
//  Scouting
//
//  Created by Adam Schor on 2/22/19.
//  Copyright © 2019 AandA Development. All rights reserved.
//

#import "QRCodeDisplayViewController.h"

@interface QRCodeDisplayViewController ()

@end

@implementation QRCodeDisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dbManager = [[DBManager alloc] initWithDatabaseFilename:@"scoutingDB.db"];
    // Do any additional setup after loading the view.
    [self createDataString:0];
    [self displayQRCode];
}

-(void)createDataString: (NSInteger)dataType {
    NSString *queryDataToSubmit;
    if (dataType == 0) {
         queryDataToSubmit = @"SELECT times.team, times.game,times.time, times.type,times.scout FROM times WHERE times.entered = TRUE";
    }
    if (dataType == 1) {
         queryDataToSubmit = @"SELECT times.team, times.game,times.time, times.type,times.scout FROM times";
    }
    _arrSubmittedData = [[NSMutableArray alloc] initWithArray:[_dbManager loadDataFromDB:queryDataToSubmit]];
    
    
    for (int x=0; x<_arrSubmittedData.count;x++) {
        _submitPart = [NSString stringWithFormat:@"%@/%@/%@/%@/%@",_arrSubmittedData[x][0],_arrSubmittedData[x][1],_arrSubmittedData[x][2],_arrSubmittedData[x][3],_arrSubmittedData[x][4]];
        
        if (_submitAll.length == 0) {
            
            _submitAll = [NSString stringWithFormat:@"*%@",_submitPart];
        }
        else {
            _submitAll = [NSString stringWithFormat:@"%@*%@",_submitAll,_submitPart];
        }
    }
}

-(void)displayQRCode {
    
  
 
    
    _QRCodeUI = [[UIImage alloc] initWithCIImage:[QRCodeMaker createQRForString:[NSString stringWithFormat:@"%@",_submitAll]]];
    
 
    
    _imageViewQRCode.image = _QRCodeUI;
    
    NSString *queryAcceptData =@ "update times set entered = 0";
    [_dbManager executeQuery:queryAcceptData];
    
}



- (IBAction)btnSendEmailPressed:(UIButton*)sender {
    if (sender ==_btnEmailAll) {
        [self createDataString:1];
    }
    if (sender == _btnEmailUnsubmitted) {
        [self createDataString:0];
        
    }
   [self performSegueWithIdentifier:@"segueQRCodeDisplayToEmail" sender:self];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    EmailViewController *emailVC = [segue destinationViewController];
    emailVC.emailBody = _submitAll;
    
    
}
@end
