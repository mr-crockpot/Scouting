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
    
   _arrScouts = [[NSMutableArray alloc] initWithObjects:
                 @"Aidan  Ruz",
                 @"Alex Schor",
                 @"Andrew  Pool",
                 @"Bennett Grow",
                 @"Brandon Coleman",
                 @"Cameron Todd",
                 @"Devon Rutledge",
                 @"Elaina Weakliem",
                 @"Emma Topping",
                 @"Gabby Day",
                 @"Gabe Weiner",
                 @"Gavyn Stiles",
                 @"Grady Eytcheson",
                 @"Hagan Archer",
                 @"Helen Laird",
                 @"Isaac Stilwell",
                 @"Jaymin Mazotti",
                 @"Jonah  Lorenzo",
                 @"Julia Dykstra",
                 @"Julia Schor",
                 @"Max Van Sickle",
                 @"Nicholas  Kieft",
                 @"Noah Maris",
                 @"Owen Dominguez",
                 @"Parker Secrest",
                 @"Samuel Korman",
                 @"Simon Thomas",
                 @"Thomas Krumholz",
                 @"Vanessa Kelly",
                 @"Wes Naake",
                 
                 nil];
    
    
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
-(void)viewDidAppear:(BOOL)animated {
    _textFieldTeamNumber.text = nil;
    _textFieldMatchNumber.text = nil;
    _btnStart.enabled = NO;
    
}

- (IBAction)btnStartPressed:(id)sender {
    [self performSegueWithIdentifier:@"seguePreMatchToCycleTime" sender:self];
    }

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    CycleTimeViewController *cycleTimeVC = [segue destinationViewController];
    cycleTimeVC.matchNumber = [_textFieldMatchNumber.text integerValue];
    cycleTimeVC.teamNumber = [_textFieldTeamNumber.text integerValue];
    cycleTimeVC.scoutNumber = _scoutNumber;
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

#pragma mark PICKER VIEW CODE

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return _arrScouts.count;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    NSString *name;
    name = _arrScouts[row];
    return name;
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
   
    _scoutNumber = row;
    
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
  
    
    
    UILabel *label = (UILabel*) view;
    if (label == nil)
    {
        label = [[UILabel alloc] init];
    }
    
    label.text =_arrScouts[row];
    label.textColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"Helvetica" size:24];
    
    
    return label;
}


@end
