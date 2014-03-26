//
//  RegisterViewController.m
//  EveryMeal
//
//  Created by apple on 14-3-11.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark -- 按钮响应
- (IBAction)finishAction:(id)sender//完成按钮响应
{
    //完成按钮
    //1.判断两次密码是否一样
    //2.判断手机号是否已经注册过
    //如果1.2都OK的话注册完成，将手机号以及密码上传到服务器
    NSLog(@"点击了登陆，%s", __FUNCTION__);
}
- (IBAction)cancleAction:(id)sender//取消按钮响应
{
    //推出
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"点击了登陆，%s", __FUNCTION__);
}

@end
