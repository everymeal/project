////
////  DataBaseManager.h
////  UI12BookShelf
////
////  Created by  lanou on 14-2-26.
////  Copyright (c) 2014年 Lanou. All rights reserved.
////
//
//#import <Foundation/Foundation.h>
//#import "FMDatabase.h"
//#import "DateInfo.h"
//#import "UserInfo.h"
//#import "ContactPair.h"
//
//@interface DataBaseManager : NSObject
//
//+ (FMDatabase *)openDataBase;
//+ (void)closeDataBase;
//+ (UserInfo*)queryContactWithId:(NSInteger)id;
//+ (UserInfo *)queryContactWithAccout:(NSString *)accout;
//+ (NSMutableArray *)queryAllContactsWithID:(NSInteger )userId;
//+ (NSMutableArray *)queryReleaseDateInfoWithID:(NSInteger)userID;
//+ (NSMutableArray *)queryJoinDateInfoWithID:(NSInteger)userID;
//+ (BOOL)queryContactPairWithFirstID:(NSInteger)firstUsrID
//                           SecondID:(NSInteger)secondUserID;
//+ (BOOL)insertOneContactPairWithContactPair:(ContactPair *)contactPair;
//+ (BOOL)insertOneDateWithDateInfo:(DateInfo *)dateInfo;
//+ (BOOL)insertOneUserWithUserInfo:(UserInfo *)userInfo;
//+ (BOOL)deleteOneContactPairWithContactPair:(ContactPair *)contactPair;
//+ (BOOL)updateOneUserPasswordWithUserInfo:(UserInfo *)userInfo;
//+ (BOOL)updateOneUserWithUserInfo:(UserInfo *)userInfo;
//@end
