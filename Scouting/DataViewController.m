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
    

    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated {
    _segmentCargoHatch.selectedSegmentIndex = 0;
    _type = @"C";
    NSString *queryData = @"select * from times where times.type = 'C' and times.entered = 1" ;
    [self loadData:queryData];
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
    cellTeam = [NSString stringWithFormat:@"Team %@/Match %@/%@",_arrHatchData[indexPath.row][1],_arrHatchData[indexPath.row][2],_arrHatchData[indexPath.row][4]];
    
    
    cellTime = [NSString stringWithFormat:@"%0.2f",[_arrHatchData[indexPath.row][5] doubleValue]];
    
    
    
    cell.textLabel.text = cellTeam;
    cell.detailTextLabel.text = cellTime;
    cell.detailTextLabel.textColor = [UIColor redColor];
    cell.detailTextLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    if ([_arrHatchData[indexPath.row][7] boolValue] == TRUE ) {
        cell.accessoryType= UITableViewCellAccessoryNone;
    }
    
    
    
    return cell;
    
}

- (IBAction)segmentCargoHatchSelected:(id)sender {
    NSString *queryData;
    switch (_segmentCargoHatch.selectedSegmentIndex) {
        case 0:
            _type = @"C";
            queryData = @"select * from times where times.type = 'C'";
            break;
        case 1:
            _type = @"H";
            queryData = @"select * from times where times.type = 'H'";
            break;
        case 2:
            _type = @"B";
            queryData = @"select * from times";
            break;
        default:
            break;
    }
    
    [self loadData:queryData];

}

-(void)submitData{
    [self performSegueWithIdentifier:@"segueDataToCodeDisplay" sender:self];
    
}
- (IBAction)btnShowUnsubmittedPressed:(id)sender {
    NSString *queryData;
    
    if ([_type  isEqualToString: @"H"] || [_type isEqualToString: @"C"]) {
        queryData = [NSString stringWithFormat: @"select * from times where times.type = '%@' AND times.entered = 1",_type];
        
    }
    else {
        queryData = @"select * from times where times.entered = 1";
    }
    
    [self loadData:queryData];
    
}

- (IBAction)btnShowAllPressed:(id)sender {
    NSString *queryData;
    
    if ([_type  isEqualToString: @"H"] || [_type isEqualToString: @"C"]) {
        queryData = [NSString stringWithFormat: @"select * from times where times.type = '%@'",_type];

    }
    else {
        queryData = @"select * from times";
    }
  
    [self loadData:queryData];
    
}



@end
