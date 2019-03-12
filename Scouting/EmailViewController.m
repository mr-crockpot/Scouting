//
//  EmailViewController.m
//  Scouting
//
//  Created by Adam Schor on 3/11/19.
//  Copyright © 2019 AandA Development. All rights reserved.
//

#import "EmailViewController.h"

@interface EmailViewController ()

@end

@implementation EmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   _lblMailSent.text = @"EMAIL";
    [self sendEmail];
}


-(void) sendEmail {
    MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc] init];
    mailVC.mailComposeDelegate = self;
    [mailVC setSubject:@"Data"];
    [mailVC setMessageBody:_emailBody isHTML:NO];
    [mailVC setToRecipients:@[@"1339Data@gmail.com"]];
    //password is Angel1339
    
    [self presentViewController:mailVC animated:YES completion:nil];
    
}
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultSent:
            _lblMailSent.text = @"EMAIL SENT";
            break;
        case MFMailComposeResultSaved:
            _lblMailSent.text = @"EMAIL SAVED";
            //Email saved
            break;
        case MFMailComposeResultCancelled:
            _lblMailSent.text = @"EMAIL CANCELLED";
            //Handle cancelling of the email
            break;
        case MFMailComposeResultFailed:
            //Handle failure to send.
            break;
        default:
            //A failure occurred while completing the email
            break;
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
