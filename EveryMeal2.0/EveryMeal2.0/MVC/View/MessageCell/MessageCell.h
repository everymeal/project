//
//  MessageCell.h
//  EveryMeal2
//
//  Created by  lanou on 14-3-12.
//  Copyright (c) 2014年 BN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageCell : BaseCell
@property (retain, nonatomic) IBOutlet UILabel *SendTimeLabel;

@property (retain, nonatomic) IBOutlet UIImageView *SendUserAvatarView;

@property (retain, nonatomic) IBOutlet UILabel *SendUserLabel;
@property (retain, nonatomic) IBOutlet UILabel *messageLabel;
@end
