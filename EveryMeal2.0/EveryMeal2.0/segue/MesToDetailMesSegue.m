//
//  MesToDetailMesSegue.m
//  EveryMeal2.0
//
//  Created by  liwenhao on 14-3-25.
//  Copyright (c) 2014年 龙猫工作室. All rights reserved.
//

#import "MesToDetailMesSegue.h"
#import "MessageDetailViewController.h"
#import "MessageViewController.h"
#import "MessageModel.h"

@implementation MesToDetailMesSegue

- (id)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination{
    if (self = [super initWithIdentifier:identifier source:source destination:destination]) {
        
    }
    return self;
}

-(void) perform{
    
    
    UIViewController *src = (UIViewController *) self.sourceViewController;
    
    UIViewController *dst = (UIViewController *) self.destinationViewController;
    
    
    
    [UIView transitionFromView:src.view
                        toView:dst.view
                      duration:1
                       options:UIViewAnimationOptionTransitionFlipFromBottom
                    completion:nil];
    
    
    
    [UIView transitionFromView:src.navigationItem.titleView
                        toView:dst.navigationItem.titleView
                      duration:1
                       options:UIViewAnimationOptionTransitionFlipFromBottom
                    completion:nil];
    
    
    
    [src.navigationController pushViewController:dst animated:NO];

}

@end
