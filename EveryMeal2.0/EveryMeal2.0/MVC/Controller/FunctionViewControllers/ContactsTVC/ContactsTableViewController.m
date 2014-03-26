//
//  ContactsTableViewController.m
//  EveryMeal2
//
//  Created by  lanou on 14-3-12.
//  Copyright (c) 2014年 BN. All rights reserved.
//

#import "ContactsTableViewController.h"
#import "PersonalDetailInfoViewController.h"
#import "ContactTableViewCell.h"
#import "ContactUserInfo.h"

@interface ContactsTableViewController ()
@property(nonatomic,retain) NSMutableArray *contactsArray;
@property(nonatomic,retain)ServerDataBaseManager *serverDBM;
@end

@implementation ContactsTableViewController

- (NSMutableArray *)hardCode{
    [self.serverDBM queryAllContactsWithUserID:65];
    return self.contactsArray;
}

- (ServerDataBaseManager *)serverDBM{
    if (_serverDBM == nil) {
        _serverDBM = [[ServerDataBaseManager alloc]init];
        _serverDBM.delegate = self;
    }
    return _serverDBM;
}


- (NSMutableArray *)contactsArray{
    if (_contactsArray == nil) {
        _contactsArray = [[NSMutableArray array]retain];
    }
    return _contactsArray;
}

- (void)queryDataBase:(ServerDataBaseManager *)serverDataBaseManager
               Result:(BOOL)result
                Array:(NSMutableArray *)array{
    if (result) {
        for (int i = 0; i<array.count; i++) {
            UserInfo *userInfo = [array objectAtIndex:i];
            ContactUserInfo *contactUI = [[ContactUserInfo alloc]initWithUserInfo:userInfo];
            [self.contactsArray addObject:contactUI];
        }
        [self reloadData];
    }
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    PersonalDetailInfoViewController *detailViewController = [[PersonalDetailInfoViewController alloc] init];
   // detailViewController.userInfo = [[self.contactsArray objectAtIndex:indexPath.row]copy];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    detailViewController.userInfo = [self.contactsArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailViewController animated:YES];
    MyRelease(detailViewController);
}
 


@end
