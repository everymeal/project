//
//  LoginCodeOneViewController.m
//  SoFun004
//
//  Created by 雨亭梧桐雪 on 14-3-18.
//  Copyright (c) 2014年 龙猫工作室. All rights reserved.
//

#import "LoginCodeOneViewController.h"
#import "RegisterCodeOneViewController.h"

@interface LoginCodeOneViewController ()

@property (nonatomic, retain) NSMutableArray * idAndPassword;//账号和密码构成的数组
@property (nonatomic, retain) ServerDataBaseManager * SDBM;
@end

@implementation LoginCodeOneViewController

//设置懒加载
- (ServerDataBaseManager *)SDBM{
    if (_SDBM == nil) {
        _SDBM = [[ServerDataBaseManager alloc] init];
    }
    return _SDBM;
}

//用户信息的懒加载
- (UserInfo *)newUser{
    if (_newUser == nil) {
        _newUser = [[UserInfo alloc] init];
    }
    return _newUser;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [_newUser release];
    [_SDBM release];
    [_idAndPassword release];
    [_imageNames release];
    [super dealloc];
}
//
#pragma mark - 👼  自定义初始化方法和便利构造器𝕸𝔢𝔱𝔨𝔬𝔡 👼 -
- (instancetype)initWithImages:(NSArray *)imageNames
{
    if (self = [super init]) {
        self.imageNames = imageNames;
    }
    return self;
}
+ (instancetype)loginWithImages:(NSArray *)imageNames
{
    LoginCodeOneViewController * loginVC = [[LoginCodeOneViewController alloc] initWithImages:imageNames];
    return [loginVC autorelease];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*//        UIImage *image = [UIImage imageNamed:[_imageNames objectAtIndex:i]];  //  初始化成功后会被系统缓存 不能释放*/
    CGRect backGroundRect = self.view.bounds;//背景的frame
    UIImageView *backGroundImageView = [[[UIImageView alloc] initWithFrame:backGroundRect] autorelease];
    NSArray *backGroundImageName = [_imageNames[0] componentsSeparatedByString:@"."];
    NSString *backGroundImagePath = [[NSBundle mainBundle] pathForResource:[backGroundImageName firstObject] ofType:[backGroundImageName lastObject]];
    UIImage *backGroundImage = [UIImage imageWithContentsOfFile:backGroundImagePath];
    [backGroundImageView setImage:backGroundImage];
    
    CGRect avatarRect = CGRectMake(99, 156, 122, 118);//头像的frame
    UIImageView *avatarImageView = [[[UIImageView alloc] initWithFrame:avatarRect] autorelease];
    NSArray *avatarImageName = [_imageNames[1] componentsSeparatedByString:@"."];
    NSString *avatarImagePath = [[NSBundle mainBundle] pathForResource:[avatarImageName firstObject] ofType:[avatarImageName lastObject]];
    UIImage *avatarImage = [UIImage imageWithContentsOfFile:avatarImagePath];
    [avatarImageView setImage:avatarImage];
    
    [self.view addSubview:backGroundImageView];
    [self.view addSubview:avatarImageView];//添加头像ImageView

    CGRect forgetPsw = CGRectMake(195, 370, 55, 16);
    UIButton * forgetPassword = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgetPassword setFrame:forgetPsw];
    [forgetPassword setTitle:@"忘记密码" forState:UIControlStateNormal];
    forgetPassword.titleLabel.font = [UIFont systemFontOfSize:11];//设置字体大小
    [forgetPassword setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    //使用默认透明背景色
    [forgetPassword addTarget:self action:@selector(handleForgetPswAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPassword];
    
    CGRect registerRect = CGRectMake(81, 445, 159, 23);
    UIButton * registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [registerButton setFrame:registerRect];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerButton setBackgroundColor:[UIColor greenColor]];
    [registerButton addTarget:self action:@selector(handleRegisterAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
//    CGRect loginRect = CGRectMake(81, 476, 159, 23);
    CGRect loginRect = CGRectMake(81, 76, 159, 23);
    UIButton * loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setFrame:loginRect];
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginButton setBackgroundColor:[UIColor greenColor]];
#warning 设置标签为10以便后面识别
    [loginButton setTag:10];
    [loginButton setHidden:YES];//如果检测到没有输入密码就隐藏
    [loginButton addTarget:self action:@selector(handleLoginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    CGRect idRect = CGRectMake(70, 279, 180, 30);
    UITextField * idTextField = [[UITextField alloc] initWithFrame:idRect];
    [idTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [idTextField setPlaceholder:@"请输入账号"];
#warning 设置账号标签为100以便后面识别
    [idTextField setTag:100];
    idTextField.delegate = self;
    [self.view addSubview:idTextField];
    [idTextField release], idTextField = nil;
    
    CGRect pswRect = CGRectMake(70, 312, 180, 30);
    UITextField * passwordTextField = [[UITextField alloc] initWithFrame:pswRect];
    [passwordTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [passwordTextField setPlaceholder:@"请输入密码"];
    [passwordTextField setSecureTextEntry:YES];
#warning 设置密码标签为101以便后面识别
    [passwordTextField setTag:101];
    passwordTextField.delegate = self;//设置代理为本类
    [self.view addSubview:passwordTextField];
    [passwordTextField release], passwordTextField = nil;
    
    //添加单击手势
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture)];
    [self.view addGestureRecognizer:tapGesture];

    
	// Do any additional setup after loading the view.
}



- (void)handleTapGesture
{
    for (id object in [self.view subviews]) {
        if ([object isKindOfClass:[UITextField class]]) {
            UITextField * textField = (UITextField *)object;
            [textField resignFirstResponder];
        }
    }
}

- (void)handleForgetPswAction:(id)sender
{

}

- (void)handleRegisterAction:(id)sender
{
    /*
     SPHINXAddBookViewController * addBookVC = [[SPHINXAddBookViewController alloc] init];
     UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:addBookVC];
     [[self navigationController] presentViewController:navigationController animated:YES completion:nil];
     [addBookVC release], addBookVC = nil;
     [navigationController release], navigationController = nil;
     */
    RegisterCodeOneViewController * registerVC = [[RegisterCodeOneViewController alloc] init];
    [self presentViewController:registerVC animated:YES completion:nil];
    [registerVC release], registerVC = nil;
}

- (void)handleLoginAction:(id)sender
{
    //实际上也可以用设置textField为属性来解决
    UITextField * idTextField = (UITextField *)[[self view] viewWithTag:100];//账号框框
    UITextField * pswTextField = (UITextField *)[[self view] viewWithTag:101];//密码框
    
    self.newUser.userAccount = idTextField.text;
    self.newUser.userPassword = pswTextField.text;
    
    if (!idTextField.text.length)//如果没有输入用户名的话就报错
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"请输入账号!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        [self.SDBM queryUserInfoWithUserAccout:_newUser.userAccount];//进行搜索,看看是否存在该用户
        if (0) {
            NSLog(@"用户不存在!!");
        }
    }
    
    
#warning 添加判断密码账户对应信息的函数
    /*
     [self.SDBM insertOneUserWithUserInfo:_newUser];
     _SDBM.successDelegate = self;
     
     */
    if (1) {
        UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        [self presentViewController:[storyboard instantiateInitialViewController] animated:YES completion:nil];
    }
    
}

#pragma mark - 👿 UITextFieldDelegate 𝕯𝔢𝔩𝔢𝔤𝔞𝔱𝔢 𝕸𝔢𝔱𝔨𝔬𝔡 😈 -
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//实现功能当有密码的时候才会出现登陆框
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //只针对密码框
    if (textField.tag == 101) {
        NSLog(@"🐻%s 😈𝕰𝕹𝕯%ld", __FUNCTION__, string.length);
        UITextField * pswTexeField = (UITextField *)[[self view] viewWithTag:101];
        UIButton * loginButton = (UIButton *)[[self view] viewWithTag:10];
        //这个的意思就是在改变textField的时候框里面的字符只有1个了,并且是要删除了
        //这个时候就把登陆按钮变成隐藏状态
        if (pswTexeField.text.length == 1 && string.length == 0)
        {
            NSLog(@"∂∂∂");
            loginButton.hidden = YES;
        }else{
            loginButton.hidden = NO;
        }

    }
    
        return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
