//
//  UserInfo.h
//  EveryMeal
//
//  Created by apple on 14-3-13.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//
#import "BaseModel.h"


#import <Foundation/Foundation.h>

@interface UserInfo : BaseModel <NSCopying>
@property(nonatomic,assign)NSInteger userID;
@property(nonatomic,copy)NSString *userAccount;//账号
@property(nonatomic,copy)NSString *userPassword;
@property(nonatomic,copy)NSString *userNickName;//昵称
@property(nonatomic,copy)NSString *userOccupation;//职业
@property(nonatomic,copy)NSString *userIndividualitysignature;//个性签名
@property(nonatomic,copy)NSString *userAppearedPlace;//经常出现的地方
@property(nonatomic,retain)UIImage *userAvatar;
@property(nonatomic,assign)BOOL userGender;//性别
@property(nonatomic,assign)int userAge;//年龄
@property(nonatomic,assign)ConstellationEnum userConstellation;//星座
@property(nonatomic,assign)BOOL userIfSmoking;//是否抽烟
@property(nonatomic,assign)BOOL userIfDrinking;//是否喝酒
//@property(nonatomic,retain)NSMutableArray *contactsArray;//好友数组
//@property(nonatomic,retain)NSMutableArray *finishedDate;//参加过的约会信息数组
- (NSString *)bodyString;
- (id)initUserInfoWithuserID:(NSInteger)userID
                 userAccount:(NSString *)userAccount
                userPassword:(NSString *)userPassword
              userOccupation:(NSString *)userOccupation
  userIndividualitysignature:(NSString *)userIndividualitysignature
           userAppearedPlace:(NSString *)userAppearedPlace
                  userAvatar:(UIImage *)userAvatar
                  userGender:(int)userGender
                     userAge:(int)userAge
           userConstellation:(int)userConstellation
               userIfSmoking:(int)userIfSmoking
              userIfDrinking:(int)userIfDrinking;

- (NSString *)userIfSmokingString;
- (NSString *)userIfDrinkingString;
- (NSString *)userGenderString;
- (NSString *)userConstellationString;

@end
