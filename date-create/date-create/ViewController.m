//
//  ViewController.m
//  date-create
//
//  Created by Daher Alfawares on 10/19/13.
//  Copyright (c) 2013 Daher Alfawares. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
}
- (IBAction)inviteEricaAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)inviteEricaAction:(id)sender
{
    [self performSegueWithIdentifier:@"inviteToSwipeVC" sender:self];
}
@end
