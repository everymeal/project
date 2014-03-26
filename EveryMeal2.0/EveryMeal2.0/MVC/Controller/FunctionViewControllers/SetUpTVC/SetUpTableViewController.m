//
//  SetUpViewController.m
//  EveryMeal
//
//  Created by apple on 14-3-11.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import "SetUpTableViewController.h"
#import "PersonInfoCell.h"
#import "UserDetailInfoViewController.h"

@interface SetUpTableViewController ()

@end

@implementation SetUpTableViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 2;
        case 2:
            return 3;
            
        default:
            break;
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return @"个人设置";
            break;
        case 1:
            return @"系统设置";
        case 2:
            return @"约会设置";
            
        default:
            break;
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            switch (indexPath.row) {
                case 0:{
                    cell.textLabel.text = @"个人资料";
                    break;
                }
                case 1:{
                    cell.textLabel.text = @"我的";
                    
                }
                default:
                    break;
            }
            return cell;

        }
        case 1:{
            UITableViewCell *cell = [[UITableViewCell alloc] init];
            switch (indexPath.row) {
                case 0:{
                    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                    [button setTitle:@"退出登录" forState:UIControlStateNormal];
                    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    button.frame = cell.bounds;
                    [button addTarget:self action:@selector(logOutAction:) forControlEvents:UIControlEventTouchUpInside];
                    [cell addSubview:button];
                    break;
                }
                case 1:{
                    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                    [button setTitle:@"声音" forState:UIControlStateNormal];
                    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    button.frame = cell.bounds;
                    [button addTarget:self action:@selector(logOutAction:) forControlEvents:UIControlEventTouchUpInside];
                    [cell addSubview:button];
                    break;
                }
                default:
                    break;
            }
            return cell;
        }
        case 2:{
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            switch (indexPath.row) {
                case 0:{
                    cell.textLabel.text = @"个人资料";
                    break;
                }
                case 1:{
                    cell.textLabel.text = @"我的";
                    
                }
                default:
                    break;
            }
            cell.textLabel.text = @"我的";
            return cell;
        }
        default:
            break;
    }
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    return cell;
}
//section 头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        //实例化个人信息详情页面
        self.tabBarController.tabBar.hidden = YES;
        UserDetailInfoViewController *userDetailVC = [[UserDetailInfoViewController alloc]init];
        [self.navigationController pushViewController:userDetailVC animated:YES];
        RELEASE_SAFELY(userDetailVC);
    }
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

#pragma mark - control Events -
- (void)logOutAction:(id)sender{
    
}

@end
