//
//  PreMatchViewController.m
//  Scouting
//
//  Created by Adam Schor on 2/22/19.
//  Copyright © 2019 AandA Development. All rights reserved.
//

#import "PreMatchViewController.h"
#import "CycleTimeViewController.h"

@interface PreMatchViewController ()

@end

@implementation PreMatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _btnStart.enabled = NO;
    if ([self ReadyToGo]) {
        _btnStart.enabled = YES;
    }
    UIBarButtonItem *viewData = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(btnDonePressed)];
    self.navigationItem.leftItemsSupplementBackButton = YES;
    self.navigationItem.rightBarButtonItems= [NSArray arrayWithObjects:viewData, nil];
    
    _textFieldTeamNumber.keyboardType = UIKeyboardTypeNumberPad;
    _textFieldMatchNumber.keyboardType = UIKeyboardTypeNumberPad;
    // Do any additional setup after loading the view.
}


- (IBAction)btnStartPressed:(id)sender {
    [self performSegueWithIdentifier:@"seguePreMatchToCycleTime" sender:self];
    }

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    CycleTimeViewController *cycleTimeVC = [segue destinationViewController];
    cycleTimeVC.matchNumber = [_textFieldMatchNumber.text integerValue];
    cycleTimeVC.teamNumber = [_textFieldTeamNumber.text integerValue];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    _btnStart.enabled = NO;
    if ([self ReadyToGo]) {
        _btnStart.enabled = YES;
    }
    return YES;
}

-(void)btnDonePressed {
    [_textFieldMatchNumber resignFirstResponder];
    [_textFieldTeamNumber resignFirstResponder];
    _btnStart.enabled = NO;
    if ([self ReadyToGo]) {
        _btnStart.enabled = YES;
    }
}

-(BOOL)ReadyToGo{
    BOOL ready;
    if (_textFieldMatchNumber.text.length == 0 || _textFieldTeamNumber.text.length == 0) {
        ready = NO;
    }
    else {
        ready = YES;
    }
    
    return ready;
}

@end
