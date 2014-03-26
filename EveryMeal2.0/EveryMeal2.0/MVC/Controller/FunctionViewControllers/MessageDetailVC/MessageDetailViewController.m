//
//  MessageDetailViewController.m
//  EveryMeal2
//
//  Created by  lanou on 14-3-12.
//  Copyright (c) 2014年 BN. All rights reserved.
//

#import "MessageDetailViewController.h"

@interface MessageDetailViewController ()

@end

@implementation MessageDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)dealloc {
    [_detailMessage release];
    [_sendTime release];
    [super dealloc];
}

@end
