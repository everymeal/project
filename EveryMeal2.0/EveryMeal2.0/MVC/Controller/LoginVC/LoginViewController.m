//
//  LoginViewController.m
//  EveryMeal
//
//  Created by apple on 14-3-10.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"//引入注册界面
#import "MainTabBarViewController.h"//引入主tabBar界面


@interface LoginViewController ()

@end

@implementation LoginViewController

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
    // Do any additional setup after loading the view from its nib.
    //给displayImageView添加手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleGestureAction:)];
    tapGesture.numberOfTapsRequired = 1;//设置点击次数的属性
    tapGesture.numberOfTouchesRequired = 1;//设置几点操作
    _loginBackgroundImageView.userInteractionEnabled = YES;//打开背景图片的交互
    [_loginBackgroundImageView addGestureRecognizer:tapGesture];//添加单击响应
    RELEASE_SAFELY(tapGesture);
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;//隐藏导航Bar
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -- 点击背景，取消textField的第一响应者
- (void)handleGestureAction:(id)sender
{
    NSLog(@"点击了登陆，%s", __FUNCTION__);
    //随便点击后关闭Textfield的键盘
    [_userName resignFirstResponder];
    [_userPassword resignFirstResponder];
}
#pragma mark -- Button Actions
//登陆
- (IBAction)loginAction:(id)sender
{
    NSLog(@"点击了登陆，%s", __FUNCTION__);
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)registerAction:(id)sender
{
    NSLog(@"点击了注册，%s", __FUNCTION__);
    //实例化并推出注册界面
    RegisterViewController *registerVC = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:registerVC animated:YES];
    RELEASE_SAFELY(registerVC);
    
    
}
- (IBAction)forgetPasswordAction:(id)sender
{
    NSLog(@"点击了忘记密码，%s", __FUNCTION__);
}

@end
