//
//  HatchDataTableViewController.h
//  Scouting
//
//  Created by Adam Schor on 3/1/19.
//  Copyright © 2019 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface HatchDataTableViewController : UITableViewController

@property (strong, nonatomic) DBManager *dbManager;




@property (strong,nonatomic) NSMutableArray *arrHatchData;


@end

NS_ASSUME_NONNULL_END
