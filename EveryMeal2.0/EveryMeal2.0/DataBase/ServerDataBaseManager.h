//
//  ServerDataBaseManager.h
//  EveryMeal
//
//  Created by  lanou on 14-3-18.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"
#import "ContactPair.h"
#import "DateInfo.h"
#import "ServerDataBaseManagerProtocal.h"

@protocol isSuccessDownload <NSObject>

- (void)isSuccessDownload:(BOOL)really;

@end


@interface ServerDataBaseManager : NSObject<NSURLConnectionDataDelegate>

@property(nonatomic,assign) id<ServerDataBaseManagerProtocal> delegate;
@property (nonatomic, assign) id<isSuccessDownload> successDelegate;
@property(nonatomic,assign) int tag;


- (BOOL)queryUserInfoWithUserID:(NSInteger)userID;
- (BOOL)queryUserInfoWithUserAccout:(NSString *)accout;
- (BOOL)queryAllContactsWithUserID:(NSInteger )userID;
- (BOOL)queryReleaseDateInfoWithUserID:(NSInteger)userID;
- (BOOL)queryJoinDateInfoWithUserID:(NSInteger)userID;
- (BOOL)quertyContactPairIfExist:(NSInteger)firstUserID
                           SecondID:(NSInteger)secondUserID;
- (BOOL)insertOneContactPairWithContactPair:(ContactPair *)contactPair;
- (BOOL)insertOneDateWithDateInfo:(DateInfo *)dateInfo;
- (BOOL)insertOneUserWithUserInfo:(UserInfo *)userInfo;
- (BOOL)deleteOneContactPairWithContactPair:(ContactPair *)contactPair;
- (BOOL)updateOneUserPasswordWithUserInfo:(UserInfo *)userInfo;
- (BOOL)updateOneUserWithUserInfo:(UserInfo *)userInfo;

- (instancetype)initWithDelegate:(id)delegate;
- (instancetype)initWithDelegate:(id)delegate Tag:(int)tag;

@end
