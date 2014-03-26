//
//  UserInfo.m
//  EveryMeal
//
//  Created by apple on 14-3-13.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo
- (id)init{

    return [self initUserInfoWithuserID:0 userAccount:@"" userPassword:@"" userOccupation:@"" userIndividualitysignature:@"" userAppearedPlace:@"" userAvatar:nil userGender:0 userAge:0 userConstellation:0 userIfSmoking:0 userIfDrinking:0];
}

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
              userIfDrinking:(int)userIfDrinking{
    if(self = [super init]){
    _userID = userID;
        if (userAccount) {
            _userAccount = [[NSString stringWithString:userAccount]retain];
        }else{
            _userAccount = @"";
        }
        if (userPassword) {
            _userPassword = [[NSString stringWithString:userPassword]retain];
        }else{
            _userPassword = @"";
        }
        if (userOccupation) {
            _userOccupation = [[NSString stringWithString:userOccupation]retain];        }
        else{
            _userOccupation = @"";
        }
        if (userIndividualitysignature) {
            _userIndividualitysignature = [[NSString stringWithString:userIndividualitysignature]retain];
        }else{
            _userIndividualitysignature = @"";
        }
        if (userAppearedPlace) {
            _userAppearedPlace = [[NSString stringWithString:userAppearedPlace]retain];
        }else{
            _userAppearedPlace = @"";
        }
    _userAvatar = [userAvatar retain];
    _userAge = userAge;
    _userConstellation = userConstellation;
    _userIfSmoking = userIfSmoking;
    _userIfDrinking = userIfDrinking;
    }
    return self;
}

- (NSString *)userIfSmokingString{
    return self.userIfSmoking?@"是":@"否";
}

- (NSString *)userIfDrinkingString{
    return self.userIfDrinking?@"是":@"否";
}
- (NSString *)userGenderString{
    return self.userGender?@"男":@"女";
}
- (NSString *)userConstellationString{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"project" ofType:@"plist"];
    NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:path];
    return [[[[dic objectForKey:constellations] objectAtIndex:self.userConstellation-Capricorn]retain]autorelease];
}

- (void)dealloc{
    RELEASE_SAFELY(_userAccount);
    RELEASE_SAFELY(_userNickName);
    RELEASE_SAFELY(_userIndividualitysignature);
    RELEASE_SAFELY(_userAppearedPlace);
    RELEASE_SAFELY(_userOccupation);
    MyRelease(_userPassword);
//    RELEASE_SAFELY(_contactsArray);
//    RELEASE_SAFELY(_finishedDate);
    [super dealloc];
}
- (NSString *)bodyString{
    NSMutableString *string = [NSMutableString string];
    [string appendFormat:@"%@='%@'&",@ToString(userAccount),_userAccount];
    [string appendFormat:@"%@='%@'&",@ToString(userNickName),_userNickName];
    [string appendFormat:@"%@=%d&",@ToString(userGender),_userGender];
    [string appendFormat:@"%@=%d&",@ToString(userAge),_userAge];
    [string appendFormat:@"%@=%d&",@ToString(userConstellation),_userConstellation];
    [string appendFormat:@"%@='%@'&",@ToString(userIndividualitysignature),_userIndividualitysignature];
    [string appendFormat:@"%@='%@'&",@ToString(userAppearedPlace),_userAppearedPlace];
    [string appendFormat:@"%@=%d&",@ToString(userIfSmoking),_userIfSmoking];
    [string appendFormat:@"%@=%d&",@ToString(userIfDrinking),_userIfDrinking];
    [string appendFormat:@"%@='%@'&",@ToString(userOccupation),_userOccupation];
    [string appendFormat:@"%@=%d&",@ToString(userIfDrinking),_userIfDrinking];
    //    [string appendFormat:@"%@=%@&",@ToString(userAvatar),UIImageJPEGRepresentation(_userAvatar, 1.0)];
    [string appendFormat:@"%@='%@'",@ToString(userPassword),_userPassword];
    
    return [[string retain]autorelease];
}

- (id)copyWithZone:(NSZone *)zone{
    UserInfo *other = [[[self class]allocWithZone:zone]initUserInfoWithuserID:_userID userAccount:_userAccount userPassword:_userPassword userOccupation:_userOccupation userIndividualitysignature:_userIndividualitysignature userAppearedPlace:_userAppearedPlace userAvatar:_userAvatar userGender:_userGender userAge:_userAge userConstellation:_userConstellation userIfSmoking:_userIfSmoking userIfDrinking:_userIfDrinking];
    return other;
}
@end
