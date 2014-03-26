 //
//  RegisterCodeOneViewController.m
//  SoFun004
//
//  Created by 雨亭梧桐雪 on 14-3-19.
//  Copyright (c) 2014年 龙猫工作室. All rights reserved.
//

#import "RegisterCodeOneViewController.h"

@interface RegisterCodeOneViewController ()
{

}
@property (nonatomic, retain) ServerDataBaseManager * SDBM;
@property (nonatomic, retain) NSMutableArray * idAndPassword;//账号和密码构成的数组
@property (nonatomic, copy) NSString * phoneNum;
@property (nonatomic, copy) NSString * passWord;
@property (nonatomic, copy) NSString * confirmPassword;
@end

@implementation RegisterCodeOneViewController

//设置懒加载
- (ServerDataBaseManager *)SDBM{
    if (_SDBM == nil) {
        _SDBM = [[ServerDataBaseManager alloc] init];
    }
    return _SDBM;
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
    [_SDBM release];
    [_passWord release];
    [_confirmPassword release];
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
    RegisterCodeOneViewController * loginVC = [[RegisterCodeOneViewController alloc] initWithImages:imageNames];
    return [loginVC autorelease];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    //要实现的有三个textFiled, 两个button
    //这个是设置背景, 也就是说,数组里面就一张图片而已
    CGRect backGroundRect = self.view.bounds;//背景的frame
    UIImageView *backGroundImageView = [[[UIImageView alloc] initWithFrame:backGroundRect] autorelease];
    NSArray *backGroundImageName = [_imageNames[0] componentsSeparatedByString:@"."];
    NSString *backGroundImagePath = [[NSBundle mainBundle] pathForResource:[backGroundImageName firstObject] ofType:[backGroundImageName lastObject]];
    UIImage *backGroundImage = [UIImage imageWithContentsOfFile:backGroundImagePath];
    [backGroundImageView setImage:backGroundImage];
    
    //手机号
    CGRect cellPhoneRect = CGRectMake(40, 87, 238, 30);
    UITextField * cellPhoneTextField = [[UITextField alloc] initWithFrame:cellPhoneRect];
    [cellPhoneTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [cellPhoneTextField setPlaceholder:@"请输入手机号"];
#warning 设置手机号标签为101以便后面识别
    [cellPhoneTextField setTag:101];
    cellPhoneTextField.delegate = self;//设置代理为本类
    [self.view addSubview:cellPhoneTextField];
    [cellPhoneTextField release], cellPhoneTextField = nil;
    //密码
    CGRect passwordRect = CGRectMake(40, 125, 238, 30);
    UITextField * passwordTextField = [[UITextField alloc] initWithFrame:passwordRect];
    [passwordTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [passwordTextField setPlaceholder:@"请输入密码"];
    [passwordTextField setSecureTextEntry:YES];
#warning 设置密码标签为102以便后面识别
    [passwordTextField setTag:102];
    self.passWord = passwordTextField.text;//把输入的内容设置为本类的实例变量
    passwordTextField.delegate = self;//设置代理为本类
    [self.view addSubview:passwordTextField];
    [passwordTextField release], passwordTextField = nil;
    //重复密码
    CGRect confirmPasswordRect = CGRectMake(40, 163, 238, 30);
    UITextField * confirmPasswordTextField = [[UITextField alloc] initWithFrame:confirmPasswordRect];
    [confirmPasswordTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [confirmPasswordTextField setPlaceholder:@"请再次输入"];
    [confirmPasswordTextField setSecureTextEntry:YES];
#warning 设置重复密码标签为100以便后面识别
    [confirmPasswordTextField setTag:100];
    self.confirmPassword = confirmPasswordTextField.text;
    confirmPasswordTextField.delegate = self;
    [self.view addSubview:confirmPasswordTextField];
    [confirmPasswordTextField release], confirmPasswordTextField = nil;
    
    //确认按钮
    CGRect confirmRect = CGRectMake(70, 443, 178, 25);
    UIButton * confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [confirmButton setFrame:confirmRect];
    [confirmButton setTitle:@"确认" forState:UIControlStateNormal];
    [confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [confirmButton setBackgroundColor:[UIColor greenColor]];
#warning 设置标签为10以便后面识别
    [confirmButton setTag:10];
    [confirmButton addTarget:self action:@selector(handleConfirmAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmButton];
    
    //取消按钮
    CGRect cancleRect = CGRectMake(70, 410, 178, 25);
    UIButton * cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancleButton setFrame: cancleRect];
    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancleButton setBackgroundColor:[UIColor greenColor]];
#warning 设置标签为20以便后面识别
    [cancleButton setTag:20];
    [cancleButton addTarget:self action:@selector(handleCancleAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancleButton];
    
    //添加单击手势
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture)];
    [self.view addGestureRecognizer:tapGesture];
    
    UIColor * meColor_1 = [UIColor colorWithRed:0.8535 green:0.673 blue:0.8212 alpha:1];
    [[self view] setBackgroundColor:meColor_1];
	// Do any additional setup after loading the view.
}

- (void)handleCancleAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)handleConfirmAction:(id)sender
{
    UITextField * tempTextField = (UITextField *)[[self view] viewWithTag:102];
    self.passWord = tempTextField.text;
    UITextField * tempConfirmTextField = (UITextField *)[[self view] viewWithTag:100];
    self.confirmPassword = tempConfirmTextField.text;
    UITextField * tempPhoneTextField = (UITextField *)[[self view] viewWithTag:101];
    self.phoneNum = tempPhoneTextField.text;
    
#warning 调用插入一条数据的方法, 还有各种
    NSLog(@"手机号码%@, 密码%@ 重复的密码%@", _phoneNum, _passWord, _confirmPassword);
    
//    ServerDataBaseManager * sdbm_1 = [[ServerDataBaseManager alloc] init];
//    sdbm_1
    
#if 10
    if ([_phoneNum length] == 11 && [_passWord isEqualToString:_confirmPassword]) {
        self.newUser = [[[UserInfo alloc] init] autorelease];
        _newUser.userAccount = _phoneNum;
        _newUser.userPassword = _passWord;
        //1.注意了,只能在使用的时候实例化数据管理器, 是不可以写成属性的
        //这个是由于ServerDataBaseManager的实例对象在实现方法的时候,会有一个属性叫_request,它又有一个属性叫做_receiveData
        //我们可以得到数据主要是用_receiveData的,在我们第一次使用的时候自然会得到数据,要是下一次还有使用
        //由于是同一个对象,那么对应的对象就是地址不变,那个_receiveData也是同一个_receiveData,而之后的过程中会在_receiveData
        //后面添加一个请求得到的数据, 后面的才是我们需要的,可是和旧的都拼接在一块,那么就悲剧了
        //我们将得不到应有的数据, 也即是数据混乱了.
        //2.并且绝对不要在后面写autorelease,因为在请求网络连接之后会返回一个结果,这样子就结束了方法
        //如此以来就直接释放, 这样子就接收不到消息了
        //至于网络请求是另外又开辟的一个线程,它会在请求成功的时候给那个类发送消息, 可是这个类已经不存在了
        //也就没有消息接受了, 所以我们就没办法得到它收到消息的时候运行的方法也就没法,显现出处理成功的AlertView了
//        ServerDataBaseManager *sdbm = [[[ServerDataBaseManager alloc]init] autorelease];
//        sdbm.successDelegate = self;
//        [sdbm insertOneUserWithUserInfo:_newUser];//开始插入
        
        [self.SDBM insertOneUserWithUserInfo:_newUser];
        _SDBM.successDelegate = self;
        
        
    }else{
        UIAlertView * aleartV = [[[UIAlertView alloc] initWithTitle:@"😈输入错误!" message:@"请重新输入!!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] autorelease];
        [aleartV show];
    }
#else
    self.newUser = [[[UserInfo alloc] init] autorelease];
    _newUser.userAccount = _phoneNum;
    _newUser.userPassword = _passWord;
//    ServerDataBaseManager *sdbm = [[ServerDataBaseManager alloc]init];
//    sdbm.successDelegate = self;
//    [sdbm insertOneUserWithUserInfo:_newUser];//开始插入
    [self.SDBM insertOneUserWithUserInfo:_newUser];
    _SDBM.successDelegate = self;
//    self.SDBM = nil;
#endif
//    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)isSuccessDownload:(BOOL)really
{
    if (really) {
        UIAlertView * showSuccess = [[[UIAlertView alloc] initWithTitle:@"😝注册成功!!" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] autorelease];
        showSuccess.delegate = self;
        [showSuccess show];
        self.SDBM = nil;//响应了这个方法,说明下载数据成功!!之后跳转到登陆页面
//        [self dismissViewControllerAnimated:YES completion:nil];//跳转到登陆页面
//        UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        [self presentViewController:[storyboard instantiateInitialViewController] animated:YES completion:nil];
#warning
        
    }else{
        UIAlertView * showSuccess = [[[UIAlertView alloc] initWithTitle:@"😱注册失败!!" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] autorelease];
        [showSuccess show];
        self.SDBM = nil;
    }
    
}

#pragma mark - 👿UIAlertViewDelegate 𝕯𝔢𝔩𝔢𝔤𝔞𝔱𝔢 𝕸𝔢𝔱𝔨𝔬𝔡 😈 -
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"-----------------------------");
    if ([alertView.title isEqualToString:@"😝注册成功!!"]) {
        [self dismissViewControllerAnimated:YES completion:nil];//跳转到登陆页面
    }
}

//撤销键盘
- (void)handleTapGesture
{
    for (id object in [self.view subviews]) {
        if ([object isKindOfClass:[UITextField class]]) {
            UITextField * textField = (UITextField *)object;
            [textField resignFirstResponder];
        }
    }
}

#pragma mark - 👿 UITextFieldDelegate 𝕯𝔢𝔩𝔢𝔤𝔞𝔱𝔢 𝕸𝔢𝔱𝔨𝔬𝔡 😈 -
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{

    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return YES;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
