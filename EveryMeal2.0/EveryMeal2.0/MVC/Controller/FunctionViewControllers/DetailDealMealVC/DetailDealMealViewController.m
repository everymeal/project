//
//  DetailDealMealViewController.m
//  EveryMeal
//
//  Created by apple on 14-3-11.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import "DetailDealMealViewController.h"
#import "PersonInfoCell.h"
#import "PersonalDetailInfoViewController.h"//个人信息详情界面
#import "ReviewCell.h"

@interface DetailDealMealViewController ()

@end

@implementation DetailDealMealViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"约饭详情";
//实例化一个工具条
//    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height - 44, 320, 44)];
//    toolBar.barTintColor = [UIColor redColor];
//    //报名按键
//    UIBarButtonItem *signUpItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(signUpAction:)];
//    //评论按键
//    UIBarButtonItem *reviewItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(reviewAction:)];
//    toolBar.items = @[signUpItem, reviewItem];
//    [self.view addSubview:toolBar];
//    RELEASE_SAFELY(toolBar);
//    RELEASE_SAFELY(signUpItem);
//    RELEASE_SAFELY(reviewItem);
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.toolbarHidden = NO;
    self.navigationController.toolbar.barTintColor = [UIColor colorWithRed:0.2 green:0.9 blue:.2 alpha:.8];
    self.navigationController.toolbar.frame = CGRectMake(0, self.navigationController.view.frame.size.height-44, 320, 44);
    self.tabBarController.tabBar.hidden = YES;
    UIBarButtonItem *signUpItem = [[UIBarButtonItem alloc]initWithTitle:@"报名" style:UIBarButtonItemStyleBordered target:self action:@selector(signUpAction:)];
    signUpItem.tintColor = [UIColor redColor];
    UIBarButtonItem *blankItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:
                                  UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *reviewItem = [[UIBarButtonItem alloc]initWithTitle:@"评论" style:UIBarButtonItemStyleBordered target:self action:@selector(reviewAction:)];
    [self setToolbarItems:@[signUpItem,blankItem,reviewItem]];
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.toolbarHidden = YES;
}
- (void)signUpAction:(id)sender
{
    NSLog(@"点击了+，%s", __FUNCTION__);
    UIAlertView *signUpAlert = [[UIAlertView alloc]initWithTitle:@"报名" message:@"如果被选为约会对象，你的手机号码将显示给对方，同时你也会获知对方的手机号码" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定报名", nil];
    [signUpAlert show];
}


#pragma mark - signUpAlert delegate Action -
// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        printf("%s,%d\n您已确定报名",__func__,__LINE__);
    }
}

// Called when we cancel a view (eg. the user clicks the Home button). This is not called when the user clicks the cancel button.
// If not defined in the delegate, we simulate a click in the cancel button
//- (void)alertViewCancel:(UIAlertView *)alertView;

//- (void)willPresentAlertView:(UIAlertView *)alertView;  // before animation and showing view
//- (void)didPresentAlertView:(UIAlertView *)alertView;  // after animation

//- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex; // before animation and hiding view
//- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;  // after animation

// Called after edits in any of the default fields added by the style
//- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView;

- (void)reviewAction:(id)sender
{
    NSLog(@"点击了评论，%s", __FUNCTION__);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        static NSString *CellIdentifier = @"DealMealCell";
        PersonInfoCell *cell = (PersonInfoCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"DealMealCell" owner:nil options:nil];
            cell = [nibArray objectAtIndex:0];
        }
        cell.userAvatarView.userInteractionEnabled = YES;//打开头像的交互
        //给头像部分添加一个点击响应，弹出发部分信息的界面
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleGestureAction:)];
        [cell.userAvatarView addGestureRecognizer:tapGesture];
        RELEASE_SAFELY(tapGesture);
        
        return cell;
    }
    if (indexPath.section == 1) {
        static NSString *reviewCellIdentifier = @"reviewCell";
        ReviewCell *cell = (ReviewCell *)[tableView dequeueReusableCellWithIdentifier:reviewCellIdentifier];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"ReviewCell" owner:nil options:nil]lastObject];
        }
        return cell;
    }
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 266;
    }
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 30;
}
#pragma mark 头像点击响应事件
- (void)handleGestureAction:(id)sender
{
    NSLog(@"点击了登陆，%s", __FUNCTION__);
    //实例化个人详情界面
    PersonalDetailInfoViewController *personalDetailInfoVC = [[PersonalDetailInfoViewController alloc]init];
    [self.navigationController pushViewController:personalDetailInfoVC animated:YES];
    RELEASE_SAFELY(personalDetailInfoVC);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */

- (IBAction)back1:(UIStoryboardSegue *)sender{
    
}

@end
