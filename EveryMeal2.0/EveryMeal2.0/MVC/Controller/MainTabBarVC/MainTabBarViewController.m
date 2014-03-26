//
//  MainTabBarViewController.m
//  EveryMeal
//
//  Created by apple on 14-3-11.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "ContactsTableViewController.h"//联系人界面
#import "DateMealTableViewController.h"//约饭界面
#import "ReleaseDateViewController.h"//发布约饭消息界面
#import "MessageViewController.h"//消息界面
#import "SetUpTableViewController.h"//设置界面
#import "LoginViewController.h"//登陆界面

@interface MainTabBarViewController (){
    UIView *_barViewNotSeleted;
    UIView *_barViewSeleted;
}

@end

@implementation MainTabBarViewController

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
    self.delegate = self;
//    //约饭界面
//    DateMealTableViewController *dealMealVC = [[DateMealTableViewController alloc]init];
//    UINavigationController *dealMealNC = [[UINavigationController alloc]initWithRootViewController:dealMealVC];
//    //联系人界面
//    ContactsTableViewController *contactsVC = [[ContactsTableViewController alloc]init];
//    UINavigationController *contactsNC = [[UINavigationController alloc]initWithRootViewController:contactsVC];
//    //发布信息界面
//    ReleaseDateViewController *releaseDateVC = [[ReleaseDateViewController alloc]init];
//    UINavigationController *releaseDateNC = [[UINavigationController alloc]initWithRootViewController:releaseDateVC];
//    //消息界面
//    MessageViewController *messageVC = [[MessageViewController alloc]init];//消息界面
//    UINavigationController *messageNC = [[UINavigationController alloc]initWithRootViewController:messageVC];
//    //设置界面
//    SetUpTableViewController *setUpVC = [[SetUpTableViewController alloc]init];
//    UINavigationController *setUpNC = [[UINavigationController alloc]initWithRootViewController:setUpVC];
    
    ContactsTableViewController *contactsNC = self.viewControllers[0];
    DateMealTableViewController *dealMealNC = self.viewControllers[1];
    ReleaseDateViewController *releaseDateNC = self.viewControllers[2];
    MessageViewController *messageNC = self.viewControllers[3];
    SetUpTableViewController *setUpNC = self.viewControllers[4];
    
    
    
    self.tabBar.tintColor = [UIColor blackColor];//图标选中后的颜色
    self.tabBar.barTintColor = [UIColor whiteColor];//底板颜色

    UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:@"联系人" image:nil tag:1];
    contactsNC.tabBarItem = item;
    RELEASE_SAFELY(item);
    
    item = [[UITabBarItem alloc]initWithTitle:@"约饭" image:nil tag:1];
    dealMealNC.tabBarItem = item;
    RELEASE_SAFELY(item);
    
    item = [[UITabBarItem alloc]initWithTitle:@"发布" image:nil tag:2];
    releaseDateNC.tabBarItem = item;
    RELEASE_SAFELY(item);
    
    item = [[UITabBarItem alloc]initWithTitle:@"消息" image:nil tag:3];
    messageNC.tabBarItem = item;
    RELEASE_SAFELY(item);
    
    item = [[UITabBarItem alloc]initWithTitle:@"设置" image:nil tag:4];
    setUpNC.tabBarItem = item;
    RELEASE_SAFELY(item);
    
    int number = 5;
    float edgeX = 15;
    float edgeY2 = 15;
    float width = 320.0/number - edgeX*2;
    float edgeY1 = 49 - width - edgeY2;
    
    
    for (int i = 0; i<number; i++)
    {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d_0.png",i]];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        imageView.frame = CGRectMake(edgeX+320.0/number*i, edgeY1, width, width);
        [self.tabBar addSubview:imageView];
        imageView.tag = ContactImageUnSelectedTag+i;
        imageView.alpha = 0.5;
    }
    

    
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController NS_AVAILABLE_IOS(3_0){
//    printf("%s,%d\n",__func__,__LINE__);
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    for (int i = 0; i<5; i++) {
        if (i == self.selectedIndex) {
            [self.tabBar viewWithTag:ContactImageUnSelectedTag+i].alpha = 1.0;
        }else{
            [self.tabBar viewWithTag:ContactImageUnSelectedTag+i].alpha = 0.5;
        }
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
