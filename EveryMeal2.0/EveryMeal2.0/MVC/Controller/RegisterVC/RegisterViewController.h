//
//  RegisterViewController.h
//  EveryMeal
//
//  Created by apple on 14-3-11.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

@property(nonatomic,retain)IBOutlet UITextField *userNameField;
@property(nonatomic,retain)IBOutlet UITextField *userPassWord1;
@property(nonatomic,retain)IBOutlet UITextField *userPassWord2;

- (IBAction)finishAction:(id)sender;//完成按钮响应
- (IBAction)cancleAction:(id)sender;//取消按钮响应


@end
