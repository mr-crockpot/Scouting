//
//  PreMatchViewController.m
//  Scouting
//
//  Created by Adam Schor on 2/22/19.
//  Copyright © 2019 AandA Development. All rights reserved.
//

#import "PreMatchViewController.h"

@interface PreMatchViewController ()

@end

@implementation PreMatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)btnStartPressed:(id)sender {
    [self performSegueWithIdentifier:@"seguePreMatchToCycleTime" sender:self];
    }
@end
