//
//  HatchDataTableViewController.m
//  Scouting
//
//  Created by Adam Schor on 3/1/19.
//  Copyright © 2019 AandA Development. All rights reserved.
//

#import "HatchDataTableViewController.h"

@interface HatchDataTableViewController ()

@end

@implementation HatchDataTableViewController

- (void)viewDidLoad {
    
    _dbManager = [[DBManager alloc] initWithDatabaseFilename:@"scoutingDB.db"];
    
    [super viewDidLoad];
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewDidAppear:(BOOL)animated{
    [self loadData];
    [self.tableView reloadData];
    
}

-(void)loadData {
    
    NSString *queryLoadHatchData = @"SELECT * FROM hatch";
    _arrHatchData = [[NSMutableArray alloc] initWithArray:[_dbManager loadDataFromDB:queryLoadHatchData]];
    NSLog(@"The array is %@",_arrHatchData);

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrHatchData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
  /*  if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
       // cell.selectionStyle = UITableViewCellSelectionStyleNone;}
    */
    
  
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



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
