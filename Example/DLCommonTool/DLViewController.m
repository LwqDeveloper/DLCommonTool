//
//  CPDViewController.m
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

#import "DLViewController.h"
#import <DLCommonTool/DLCustomAlert.h>
#import <DLCommonTool/DLCustomSheet.h>

@interface DLViewController ()

@end

@implementation DLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [DLCustomSheet showSheetTitles:@[@"111", @"222"] configModel:nil completion:^(NSInteger index) {
        
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
