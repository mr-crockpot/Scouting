//
//  QRCodeMaker.h
//  Scouting
//
//  Created by Adam Schor on 2/22/19.
//  Copyright © 2019 AandA Development. All rights reserved.
//

#import <CoreImage/CoreImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface QRCodeMaker : CIImage

- (CIImage *)createQRForString:(NSString *)qrString;

@end

NS_ASSUME_NONNULL_END
