//
//  DataViewController.h
//  Scouting
//
//  Created by Adam Schor on 3/3/19.
//  Copyright © 2019 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface DataViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tblData;


- (IBAction)segmentCargoHatchSelected:(id)sender;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentCargoHatch;
@property NSInteger segmentSelected;

@property (strong, nonatomic) DBManager *dbManager;
@property (strong,nonatomic) NSMutableArray *arrHatchData;

@property (strong, nonatomic) NSString *queryData;
@property (strong, nonatomic) NSString *type;


- (IBAction)btnShowUnsubmittedPressed:(id)sender;
- (IBAction)btnShowAllPressed:(id)sender;

@end

NS_ASSUME_NONNULL_END
