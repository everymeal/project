//
//  DealMealCell.h
//  EveryMeal
//
//  Created by apple on 14-3-11.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateMealCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *userAvaterView;//头像
@property (retain, nonatomic) IBOutlet UILabel *userNickNameLabel;//用户昵称
@property (retain, nonatomic) IBOutlet UILabel *dateCostMethodLabel;//消费方式
@property (retain, nonatomic) IBOutlet UILabel *datePlaceLabel;//约会地点
@property (retain, nonatomic) IBOutlet UILabel *dateTimeLabel;//约会时间
@property (retain, nonatomic) IBOutlet UILabel *dateTargetLable;//邀请什么样的人
@property (retain, nonatomic) IBOutlet UILabel *signUpNumberLabel;//报名人数
@property (retain, nonatomic) IBOutlet UILabel *userGenderLabel;
@property (retain, nonatomic) IBOutlet UILabel *userAgeLabel;
@property (retain, nonatomic) IBOutlet UILabel *userConstellationLabel;


@end
