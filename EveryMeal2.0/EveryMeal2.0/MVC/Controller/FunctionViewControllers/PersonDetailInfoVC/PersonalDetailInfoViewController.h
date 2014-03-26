//
//  PersonalDetailInfoViewController.h
//  EveryMeal
//
//  Created by apple on 14-3-12.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PersonalDetailInfoViewController : BaseTableViewController<ServerDataBaseManagerProtocal>

@property(nonatomic,copy)UserInfo *userInfo;

@end
