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
    
    NSString *queryDataToSubmit = @"SELECT * FROM times WHERE times.entered = TRUE";
    _arrSubmittedData = [[NSMutableArray alloc] initWithArray:[_dbManager loadDataFromDB:queryDataToSubmit]];
    _QRCodeUI = [[UIImage alloc] initWithCIImage:[QRCodeMaker createQRForString:[NSString stringWithFormat:@"%@",_arrSubmittedData]]];
    
    _imageViewQRCode.image = _QRCodeUI;
   
    NSString *queryAcceptData =@ "update times set entered = 0";
    [_dbManager executeQuery:queryAcceptData];
    
}


@end
