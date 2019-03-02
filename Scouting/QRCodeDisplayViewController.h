//
//  QRCodeDisplayViewController.h
//  Scouting
//
//  Created by Adam Schor on 2/22/19.
//  Copyright © 2019 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>
#import "QRCodeMaker.h"

NS_ASSUME_NONNULL_BEGIN

@interface QRCodeDisplayViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageViewQRCode;


@property CIImage *QRCodeCI;
@property UIImage *QRCodeUI;



@end

NS_ASSUME_NONNULL_END