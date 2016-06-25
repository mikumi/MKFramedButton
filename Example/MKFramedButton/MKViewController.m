//
//  MKViewController.m
//  MKFramedButton
//
//  Created by Michael Kuck on 06/25/2016.
//  Copyright (c) 2016 Michael Kuck. All rights reserved.
//

#import "MKViewController.h"
#import "MKFramedButton.h"

@interface MKViewController ()
@end

@implementation MKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    MKFramedButton *const button = [[MKFramedButton alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 200.0f, 40.0f)];
    [self.view addSubview:button];
    
    UIColor *const buttonColor = [UIColor greenColor];
    [button setTitle:@"Hello" forState:UIControlStateNormal];
    [button setTitleColor:buttonColor forState:UIControlStateNormal];
    button.layer.borderWidth = 1.0f;
    button.layer.borderColor = buttonColor.CGColor;
}

@end
