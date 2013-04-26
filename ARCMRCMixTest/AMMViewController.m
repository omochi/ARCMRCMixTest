//
//  AMMViewController.m
//  ARCMRCMixTest
//
//  Created by おもちメタル on 13/04/27.
//  Copyright (c) 2013年 com.omochimetaru. All rights reserved.
//

#import "AMMViewController.h"

#import "AMMARCClass.h"
#import "AMMMRCClass.h"

@interface AMMViewController ()

@end

@implementation AMMViewController

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

-(IBAction)testButtonOnClick:(id)sender{
	AMMARCTest();
	AMMMRCTest();
	AMMARCTest2();
}


@end
