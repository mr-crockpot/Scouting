//
//  EmailViewController.h
//  Scouting
//
//  Created by Adam Schor on 3/11/19.
//  Copyright © 2019 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


NS_ASSUME_NONNULL_BEGIN

@interface EmailViewController : UIViewController <MFMailComposeViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *lblMailSent;

@property NSString *emailBody;

@end

NS_ASSUME_NONNULL_END
