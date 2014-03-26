//
//  LoginViewController.h
//  EveryMeal
//
//  Created by apple on 14-3-10.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
{
    IBOutlet UIImageView *_loginBackgroundImageView;//登陆界面的背景图片
    IBOutlet UIImageView * _loginHeadImageView;//登陆界面的头像
    IBOutlet UITextField *_userPassword;//密码
    IBOutlet UITextField *_userName;//账号
    IBOutlet UIButton *_forgetPassword;//忘记密码
    IBOutlet UIButton *_loginButton;//登陆按钮
    IBOutlet UIButton *_registerButton;//注册按钮
    
}
- (IBAction)loginAction:(id)sender;//登陆按钮响应
- (IBAction)registerAction:(id)sender;//注册按钮响应
- (IBAction)forgetPasswordAction:(id)sender;//忘记密码按钮响应



@end
