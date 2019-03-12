//
//  QRCodeDisplayViewController.h
//  Scouting
//
//  Created by Adam Schor on 2/22/19.
//  Copyright © 2019 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>
#import <MessageUI/MessageUI.h>
#import "QRCodeMaker.h"
#import "DBManager.h"
#import "EmailViewController.h"


NS_ASSUME_NONNULL_BEGIN

@interface QRCodeDisplayViewController : UIViewController <MFMailComposeViewControllerDelegate>


@property (strong,nonatomic) DBManager *dbManager;
@property (strong,nonatomic) NSMutableArray *arrSubmittedData;
@property NSInteger incomingValue;
@property NSString *data;

@property (strong, nonatomic) IBOutlet UIImageView *imageViewQRCode;


- (IBAction)btnSendEmailPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnEmailUnsubmitted;
@property (strong, nonatomic) IBOutlet UIButton *btnEmailAll;


@property CIImage *QRCodeCI;
@property UIImage *QRCodeUI;

@property NSString *emailBody;

@property (strong, nonatomic) NSString *submitPart;
@property (strong,nonatomic) NSString *submitAll;

@end

NS_ASSUME_NONNULL_END
