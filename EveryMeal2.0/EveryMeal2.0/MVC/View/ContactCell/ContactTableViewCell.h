//
//  ContactTableViewCell.h
//  EveryMeal
//
//  Created by  lanou on 14-3-11.
//  Copyright (c) 2014年 BN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactTableViewCell : BaseCell

@property (retain, nonatomic) IBOutlet UILabel *userIndividualitysignatureLabel;
@property (retain, nonatomic) IBOutlet UILabel *userNickNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *userIDLabel;
@property (retain, nonatomic) IBOutlet UILabel *userGenderLabel;
@property (retain, nonatomic) IBOutlet UIImageView *userAvaterView;
@end
