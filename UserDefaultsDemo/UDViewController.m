//
//  UDViewController.m
//  UserDefaultsDemo
//
//  Created by Rene Alejandro Basurto Quijada on 20/02/14.
//  Copyright (c) 2014 Rene A Basurto Q. All rights reserved.
//

#import "UDViewController.h"

@interface UDViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *labelValue;
@property (weak, nonatomic) IBOutlet UITextField *textValue;
@end

@implementation UDViewController


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)buttonSave:(id)sender
{
    NSUserDefaults *nsUD = [NSUserDefaults standardUserDefaults];
    [nsUD setValue:self.textValue.text forKey:@"myPersonalString"];
    [nsUD synchronize];
}

- (IBAction)buttonLoad:(id)sender
{
    NSUserDefaults *nsUD = [NSUserDefaults standardUserDefaults];
    
    NSString *str = [NSString stringWithFormat:@"El valor es: %@",
                     [nsUD objectForKey:@"myPersonalString"]];
    
    self.labelValue.text = str;
}

@end
