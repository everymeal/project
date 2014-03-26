//
//  MessageViewController.m
//  EveryMeal2
//
//  Created by  lanou on 14-3-12.
//  Copyright (c) 2014年 BN. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageDetailViewController.h"
#import "MessageModel.h"

@interface MessageViewController ()

@property(nonatomic,retain) NSIndexPath *selectIndexPath;
@property(nonatomic,retain) NSMutableArray *array;
@end

@implementation MessageViewController
- (NSMutableArray *)hardCode{
    MessageModel *model = [[MessageModel alloc]initWithSendUser:@"小明" SendTime:[NSDate date] SendUserAvatar:nil Message:@"工a工aaaaaaa"];
    self.array = [NSMutableArray array];
    [self.array addObject:model];
    return self.array;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectIndexPath = indexPath;
    [self performSegueWithIdentifier:@"MesToDetailMesSegue" sender:self];

}

- (IBAction)back:(UIStoryboardSegue *)sender{
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString: @"MesToDetailMesSegue"]) {
        MessageDetailViewController *detailVC = (MessageDetailViewController *)segue.destinationViewController;
        MessageModel *model = [self.array objectAtIndex:self.selectIndexPath.row];
        detailVC.detailMessage.text = model.message;
        detailVC.sendTime.text = model.sendTimeString;
    }
}


@end
