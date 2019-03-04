//
//  DataViewController.m
//  Scouting
//
//  Created by Adam Schor on 3/3/19.
//  Copyright © 2019 AandA Development. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad {
    
     _dbManager = [[DBManager alloc] initWithDatabaseFilename:@"scoutingDB.db"];
   
    
    UIBarButtonItem *submit = [[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStylePlain target:self action:@selector(submitData)];
    self.navigationItem.leftItemsSupplementBackButton = YES;
    self.navigationItem.rightBarButtonItems= [NSArray arrayWithObjects:submit, nil];
    
    
    _segmentCargoHatch.selectedSegmentIndex = 0;
    NSString *queryData = @"SELECT * FROM cargo";
    [self loadData:queryData];
    
    [super viewDidLoad];
}

-(void)loadData: (NSString*)queryIncoming {

    _arrHatchData = [[NSMutableArray alloc] initWithArray:[_dbManager loadDataFromDB:queryIncoming]];
    [_tblData reloadData];
   
}

#pragma mark TABLE VIEW BELOW


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     return _arrHatchData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString *cellTeam;
    NSString *cellTime;
    cellTeam = [NSString stringWithFormat:@"Team %@ in Match %@",_arrHatchData[indexPath.row][1],_arrHatchData[indexPath.row][2] ];
    
    
    cellTime = [NSString stringWithFormat:@"%0.2f",[_arrHatchData[indexPath.row][4] doubleValue]];
    
    
    
    cell.textLabel.text = cellTeam;
    cell.detailTextLabel.text = cellTime;
    cell.detailTextLabel.textColor = [UIColor redColor];
    cell.detailTextLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    if ([_arrHatchData[indexPath.row][6] boolValue] == TRUE ) {
        cell.accessoryType= UITableViewCellAccessoryNone;
    }
    
    
    
    return cell;
    
}

- (IBAction)segmentCargoHatchSelected:(id)sender {
    NSString *queryData;
    if (_segmentCargoHatch.selectedSegmentIndex == 0) {
        queryData = @"SELECT * FROM cargo";
    }
    else {
        queryData = @"SELECT * FROM hatch";
    }
    
    [self loadData:queryData];

}

-(void)submitData{
    [self performSegueWithIdentifier:@"segueDataToCodeDisplay" sender:self];
    
}
@end
