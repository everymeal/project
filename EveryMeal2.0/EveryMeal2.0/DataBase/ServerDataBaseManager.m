//
//  ServerDataBaseManager.m
//  EveryMeal
//
//  Created by  lanou on 14-3-18.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import "ServerDataBaseManager.h"
#import "RequestUrl.h"
#import "DateInfo.h"
#import "UserInfo.h"

@interface ServerDataBaseManager()
@property(nonatomic,retain) RequestUrl *request;
@end




@implementation ServerDataBaseManager

- (instancetype)initWithDelegate:(id)delegate{
    return [self initWithDelegate:delegate Tag:0];
}

- (instancetype)initWithDelegate:(id)delegate Tag:(int)tag{
    if (self = [super init]) {
    self.delegate = delegate;
    self.tag = tag;
    }
    return self;
}

- (instancetype)init{
    return [self initWithDelegate:nil];
}

-(void)funToReceiveData:(NSNotification *)sender{
    NSDictionary *dic = [sender userInfo];
    NSString *notifyName = [sender name];
    if ([notifyName isEqualToString:SqueryUserInfoWithUserID] ||
             [notifyName isEqualToString:SqueryUserInfoWithUserAccout]||
        [notifyName isEqualToString:SqueryAllContactsWithUserID]) {
        if (!dic[@"state"]) {
            [self.delegate queryDataBase:self Result:false Array:nil];
            return;
        }
        NSMutableArray *userArray = dic[@"userInfo"];
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i<userArray.count; i++) {
            UserInfo *oneUser = [[UserInfo alloc]init];
            NSDictionary *userInfo = userArray[i];
            oneUser.userID = [userInfo[@"userID"] integerValue];
            oneUser.userAccount =userInfo[@"userAccount"];
            oneUser.userPassword =userInfo[@"userPassword"];
            oneUser.userNickName =userInfo[@"userNickName"];
            oneUser.userOccupation =userInfo[@"userOccupation"];
            oneUser.userNickName =userInfo[@"userNickName"];
            oneUser.userAppearedPlace =userInfo[@"userAppearedPlace"];
            oneUser.userAvatar =[UIImage imageWithData:userInfo[@"userAvatar"]];
            oneUser.userGender = [userInfo[@"userGender"] integerValue];
            oneUser.userAge = [userInfo[@"userAge"] integerValue];
            oneUser.userConstellation = [userInfo[@"userConstellation"] integerValue];
            oneUser.userIfSmoking = [userInfo[@"userIfSmoking"] integerValue];
            oneUser.userIfDrinking = [userInfo[@"userIfDrinking"] integerValue];
            [array addObject:oneUser];
            [oneUser release];
        }
        [self.delegate queryDataBase:self Result:true Array:[[array retain]autorelease]];
    }
    else if([notifyName isEqualToString:SqueryJoinDateInfoWithUserID] ||
            [notifyName isEqualToString:SqueryReleaseDateInfoWithUserID]){
        if (!dic[@"state"]) {
            [self.delegate queryDataBase:self Result:false Array:nil];
            return;
        }
        NSMutableArray *userArray = dic[@"userInfo"];
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i<userArray.count; i++) {
            DateInfo *oneUser = [[DateInfo alloc]init];
            NSDictionary *userInfo = userArray[i];
            oneUser.datePlace = userInfo[@"datePlace"];
            oneUser.dateState = [userInfo[@"dateState"] integerValue];
            oneUser.dateTarget = [userInfo[@"dateTarget"] integerValue];
            oneUser.dateTime = userInfo[@"dateTime"];
            [array addObject:oneUser];
            [oneUser release];
        }
        [self.delegate queryDataBase:self Result:true Array:[[array retain]autorelease]];
    }else if([notifyName isEqualToString:SinsertOneContactPairWithContactPair]||
             [notifyName isEqualToString:SinsertOneDateWithDateInfo]||
             [notifyName isEqualToString:SinsertOneUserWithUserInfo]||
             [notifyName isEqualToString:SupdateOneUserPasswordWithUserInfo]||
             [notifyName isEqualToString:SupdateOneUserWithUserInfo]||
             [notifyName isEqualToString:SquertyContactPairIfExist]){
        [self.delegate queryDataBase:self Result:[dic[@"state"] integerValue] Array:nil];
    }
    
    NSLog(@"%@", [dic[@"state"] integerValue] == 1 ? @"YES!!" : @"NO!!");//由于
    NSLog(@"%d", [dic[@"state"] integerValue]);
    
    if (_successDelegate && [_successDelegate respondsToSelector:@selector(isSuccessDownload:)]) {
        if ([dic[@"state"] integerValue] == 1) {//如果真的是实现功能的话
            [_successDelegate isSuccessDownload:YES];
        }else{
            [_successDelegate isSuccessDownload:NO];
        }
    }
    
//    NSLog(@"%@",dic);
//    NSLog(@"%@",dic[@"userInfo"][0][@"contactPairID"]);
    //数据传输完成
}

- (RequestUrl *)request{
    if (_request == nil) {
        _request = [[RequestUrl alloc]init];
    }
    return _request;
}

//根据用户ID便利用户信息，例如在应用中查看其他用户的信息
- (BOOL)queryUserInfoWithUserID:(NSInteger)userID
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(funToReceiveData:) name:SqueryUserInfoWithUserID object:self.request];
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", serverIP,SqueryUserInfoWithUserID, PHPEXT];
    NSString *bodyString = [NSString stringWithFormat:@"userID=%d", userID];
    //建立链接,并返回是否链接成功
    return [self.request creatURLRequestWithURLString:urlString bodyString:bodyString NotificationName:SqueryUserInfoWithUserID];
}
//利用用户账号便利用户信息，例如登陆的时候
- (BOOL)queryUserInfoWithUserAccout:(NSString *)accout
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(funToReceiveData:) name:SqueryUserInfoWithUserAccout object:self.request];
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", serverIP, SqueryUserInfoWithUserAccout,PHPEXT];
    NSString *bodyString = [NSString stringWithFormat:@"userAccount=%@", accout];
    //建立链接,并返回是否链接成功
    return [self.request creatURLRequestWithURLString:urlString bodyString:bodyString NotificationName:SqueryUserInfoWithUserAccout];
}
//便利用户的所有好友
- (BOOL)queryAllContactsWithUserID:(NSInteger )userID
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(funToReceiveData:) name:SqueryAllContactsWithUserID object:self.request];
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", serverIP, SqueryAllContactsWithUserID,PHPEXT];
    NSString *bodyString = [NSString stringWithFormat:@"userID=%d", userID];
//    NSURL *url = [NSURL URLWithString:urlString];
    return [self.request creatURLRequestWithURLString:urlString bodyString:bodyString NotificationName:SqueryAllContactsWithUserID];
}
//便利一个用户发布并约会成功的约会信息
- (BOOL)queryReleaseDateInfoWithUserID:(NSInteger)userID
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(funToReceiveData:) name:SqueryReleaseDateInfoWithUserID object:self.request];
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", serverIP, SqueryReleaseDateInfoWithUserID,PHPEXT];
    NSString *bodyString = [NSString stringWithFormat:@"releaseDateUserID=%d", userID];
    return [self.request creatURLRequestWithURLString:urlString bodyString:bodyString NotificationName:SqueryReleaseDateInfoWithUserID];
}
//便利一个用户参加过哪些约会
- (BOOL)queryJoinDateInfoWithUserID:(NSInteger)userID
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(funToReceiveData:) name:SqueryJoinDateInfoWithUserID object:self.request];
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", serverIP, SqueryJoinDateInfoWithUserID,PHPEXT];
    NSString *bodyString = [NSString stringWithFormat:@"joinUserID=%d", userID];
    return [self.request creatURLRequestWithURLString:urlString bodyString:bodyString NotificationName:SqueryJoinDateInfoWithUserID];
}

//在单向添加好友时，将用户ID和被加好友ID传入，检测是否已经是好友
- (BOOL)quertyContactPairIfExist:(NSInteger)firstUserID
                           SecondID:(NSInteger)secondUserID
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(funToReceiveData:) name:SquertyContactPairIfExist object:self.request];
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", serverIP, SquertyContactPairIfExist,PHPEXT];
    NSString *bodyString = [NSString stringWithFormat:@"firstUserID=%ld&secondUserID=%ld", firstUserID,secondUserID];
    return [self.request creatURLRequestWithURLString:urlString bodyString:bodyString NotificationName:SquertyContactPairIfExist];
}
//单向添加好友，用户为firstID,被添加的对象为secondID
- (BOOL)insertOneContactPairWithContactPair:(ContactPair *)contactPair
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(funToReceiveData:) name:SinsertOneContactPairWithContactPair object:self.request];
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", serverIP, SinsertOneContactPairWithContactPair,PHPEXT];
    NSString *bodyString = [NSString stringWithFormat:@"firstUserID=%ld&secondUserID=%ld", contactPair.firstUserID,contactPair.secondUserID];
    return [self.request creatURLRequestWithURLString:urlString bodyString:bodyString NotificationName:SinsertOneContactPairWithContactPair];
}

//插入一个约会信息，发布约会信息用
- (BOOL)insertOneDateWithDateInfo:(DateInfo *)dateInfo
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(funToReceiveData:) name:SinsertOneDateWithDateInfo object:nil];
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", serverIP, SinsertOneDateWithDateInfo,PHPEXT];
    NSString *bodyString = dateInfo.bodyString;
    return [self.request creatURLRequestWithURLString:urlString bodyString:bodyString NotificationName:SinsertOneDateWithDateInfo];
}

/*
 
 //插入一个约会信息，发布约会信息用
 - (BOOL)insertOneDateWithDateInfo:(DateInfo *)dateInfo
 {
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(funToReceiveData:) name:SinsertOneDateWithDateInfo object:self.request];
 NSString *urlString = [NSString stringWithFormat:@"%@%@%@", serverIP, SinsertOneDateWithDateInfo,PHPEXT];
 NSString *bodyString = [NSString stringWithFormat:@"releaseDateUserID=%ld&joinUserID=%ld&dateTime=%@&datePlace=%@&costMethod=%ld&dateTarget=%ld&signUpNumbers=%d&dateState=%ld", dateInfo.releaseUser.userID, dateInfo.joinUser.userID, dateInfo.dateTime, dateInfo.datePlace, dateInfo.costMethod, dateInfo.dateTarget, dateInfo.signUpNumbers, dateInfo.dateState];
 return [self.request creatURLRequestWithURLString:urlString bodyString:bodyString NotificationName:SinsertOneDateWithDateInfo];
 }
 
 */

//插入一个用户信息，注册界面用
- (BOOL)insertOneUserWithUserInfo:(UserInfo *)userInfo
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(funToReceiveData:) name:SinsertOneUserWithUserInfo object:nil];
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", serverIP, SinsertOneUserWithUserInfo,PHPEXT];
    NSString *bodyString = userInfo.bodyString;
    return [self.request creatURLRequestWithURLString:urlString bodyString:bodyString NotificationName:SinsertOneUserWithUserInfo];
}
//单向删除好友，用户为firstID,被删好友为secondID
- (BOOL)deleteOneContactPairWithContactPair:(ContactPair *)contactPair
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(funToReceiveData:) name:SdeleteOneContactPairWithContactPair object:nil];
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@",
                           serverIP,SdeleteOneContactPairWithContactPair,PHPEXT];
    NSString *bodyString = contactPair.bodyString;
    return [self.request creatURLRequestWithURLString:urlString bodyString:bodyString NotificationName:SdeleteOneContactPairWithContactPair];
}
//更新用户密码,返回的是是否链接成功
- (BOOL)updateOneUserPasswordWithUserInfo:(UserInfo *)userInfo;
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(funToReceiveData:) name:SupdateOneUserPasswordWithUserInfo object:nil];
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@",
                           serverIP,SupdateOneUserPasswordWithUserInfo,PHPEXT];
    NSString *bodyString = userInfo.bodyString;
    return [self.request creatURLRequestWithURLString:urlString bodyString:bodyString NotificationName:SupdateOneUserPasswordWithUserInfo];
}
//更新用户信息的方法
- (BOOL)updateOneUserWithUserInfo:(UserInfo *)userInfo
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(funToReceiveData:) name:SupdateOneUserWithUserInfo object:nil];
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@",
                           serverIP,SupdateOneUserWithUserInfo,PHPEXT];
    NSString *bodyString = userInfo.bodyString;
    return [self.request creatURLRequestWithURLString:urlString bodyString:bodyString NotificationName:SupdateOneUserWithUserInfo];
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_request release];
    [super dealloc];
}


@end
