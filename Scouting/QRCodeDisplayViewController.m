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
   
    [self displayQRCode];
}

-(void)displayQRCode {
    
    NSString *queryDataToSubmit = @"SELECT times.team, times.game,times.time, times.type,times.scout FROM times WHERE times.entered = TRUE";
    _arrSubmittedData = [[NSMutableArray alloc] initWithArray:[_dbManager loadDataFromDB:queryDataToSubmit]];
    
    
    NSString *submitPart;
    NSString *submitAll;
    for (int x=0; x<_arrSubmittedData.count;x++) {
        submitPart = [NSString stringWithFormat:@"%@/%@/%@/%@,%@",_arrSubmittedData[x][0],_arrSubmittedData[x][1],_arrSubmittedData[x][2],_arrSubmittedData[x][3],_arrSubmittedData[x][4]];
       
       if (submitAll.length == 0) {
           
            submitAll = [NSString stringWithFormat:@"*%@",submitPart];
        }
       else {
           submitAll = [NSString stringWithFormat:@"%@*%@",submitAll,submitPart];
       }
    }
    
    _QRCodeUI = [[UIImage alloc] initWithCIImage:[QRCodeMaker createQRForString:[NSString stringWithFormat:@"%@",submitAll]]];
    
   // NSLog(@"The submitted data is %@",submitAll);
    _imageViewQRCode.image = _QRCodeUI;
    
    NSString *queryAcceptData =@ "update times set entered = 0";
    [_dbManager executeQuery:queryAcceptData];
    
}


@end
