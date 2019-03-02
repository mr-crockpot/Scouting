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
    // Do any additional setup after loading the view.
    [self displayQRCode];
}

-(void)displayQRCode {
    NSString *data = @"1234578910";
    _QRCodeUI = [[UIImage alloc] initWithCIImage:[QRCodeMaker createQRForString:data]];
    
    _imageViewQRCode.image = _QRCodeUI;
    
}


@end
