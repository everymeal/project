////
////  DataBaseManager.m
////  UI12BookShelf
////
////  Created by  lanou on 14-2-26.
////  Copyright (c) 2014年 Lanou. All rights reserved.
////
//
//#import "DataBaseManager.h"
//
//
//
//@implementation DataBaseManager
//
//static FMDatabase *dataBase = nil;
//+ (FMDatabase *)openDataBase
//{
//    if (dataBase) {
//        return dataBase;
//    }
//    //沙盒路径
//    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSLog(@"%@",documentPath);
//    
//    NSString *dataBasePath = [documentPath stringByAppendingPathComponent:@"UserInfo.sqlite"];
//    dataBase = [FMDatabase databaseWithPath:dataBasePath];
//    NSLog(@"%@",dataBasePath);
//    if ([dataBase open]) {
//        //打开成功
//        [dataBase executeUpdate:@"create table if not exists UserInfo(userID integer primary key autoincrement, userAccount text,userPassword text,userNickName text, userGender BOOL, userAge Integer, userConstellation Integer, userIndividualitysignature text, userAppearedPlace text, userIfSmoking BOOL, userIfDrinking BOOL, userOccupation text,userAvatar BLOB)"];
//        [dataBase executeUpdate:@"create table if not exists DateInfo(dateID integer primary key autoincrement, releaseDateUserID Integer, joinUserID Integer, dateTime Datetime, datePlace text, costMethod Integer, dateTarget Integer, signUpNumbers Integer, dateState Integer)"];
//        [dataBase executeUpdate:@"create table if not exists ContactPair(contactPairID integer primary key autoincrement, firstUserID Integer, secondUserID Integer)"];
//        return dataBase;
//        
//    }else{
//        return nil;
//    }
//}
//
//
//+ (void)closeDataBase;{
//    [dataBase close];
//    dataBase = nil;
//}
//
//#pragma mark 查询
//
//+ (UserInfo*)queryContactWithId:(NSInteger)id{
//    FMDatabase *oneDatabase = [DataBaseManager openDataBase];
//    FMResultSet *resultSet = [oneDatabase executeQueryWithFormat:@"select * from UserInfo where userID = %d",id];
//    UserInfo *user = nil;
//    if([resultSet next]){
//        user = [[UserInfo alloc]init];
//        user.userID = id;
//        user.userAccount = [resultSet stringForColumn:@"userAccount"];
//        user.userNickName = [resultSet stringForColumn:@"userNickName"];
//        user.userGender = [resultSet boolForColumn:@"userGender"];
//        user.userAge = [resultSet intForColumn:@"userAge"];
//        user.userConstellation = [resultSet intForColumn:@"userConstellation"];
//        user.userIndividualitysignature = [resultSet stringForColumn:@"userIndividualitysignature"];
//        user.userAppearedPlace = [resultSet stringForColumn:@"userAppearedPlace"];
//        user.userIfSmoking = [resultSet boolForColumn:@"userIfSmoking"];
//        user.userIfDrinking = [resultSet boolForColumn:@"userIfDrinking"];
//        user.userOccupation = [resultSet stringForColumn:@"userOccupation"];
//        user.userAvatar = [UIImage imageWithData:[resultSet dataForColumn:@"userAvatar"]];
//        user.userPassword = [resultSet stringForColumn:@"userPassword"];
//    }
//    [DataBaseManager closeDataBase];
//    return user;
//}
//
//+ (UserInfo *)queryContactWithAccout:(NSString *)accout{
//    FMDatabase *oneDatabase = [DataBaseManager openDataBase];
//    FMResultSet *resultSet = [oneDatabase executeQueryWithFormat:@"select * from UserInfo where userAccount = %@",accout];
//    UserInfo *user = nil;
//    if([resultSet next]){
//        user = [[UserInfo alloc]init];
//        user.userID = [resultSet intForColumn:@"userID"];
//        user.userAccount = [resultSet stringForColumn:@"userAccount"];
//        user.userNickName = [resultSet stringForColumn:@"userNickName"];
//        user.userGender = [resultSet boolForColumn:@"userGender"];
//        user.userAge = [resultSet intForColumn:@"userAge"];
//        user.userConstellation = [resultSet intForColumn:@"userConstellation"];
//        user.userIndividualitysignature = [resultSet stringForColumn:@"userIndividualitysignature"];
//        user.userAppearedPlace = [resultSet stringForColumn:@"userAppearedPlace"];
//        user.userIfSmoking = [resultSet boolForColumn:@"userIfSmoking"];
//        user.userIfDrinking = [resultSet boolForColumn:@"userIfDrinking"];
//        user.userOccupation = [resultSet stringForColumn:@"userOccupation"];
//        user.userPassword = [resultSet stringForColumn:@"userPassword"];
//    }
//    [DataBaseManager closeDataBase];
//    return user;
//}
//
//+ (NSMutableArray *)queryReleaseDateInfoWithID:(NSInteger)userID{
//    FMDatabase *oneDatabase = [DataBaseManager openDataBase];
//    FMResultSet *resultSet = [oneDatabase executeQueryWithFormat:@"select * from DateInfo where releaseDateUserID = %d",userID];
//    NSMutableArray *array = [NSMutableArray array];
//    DateInfo *date = nil;
//    if([resultSet next]){
//        date = [[DateInfo alloc]init];
//        date.releaseUser.userID = [resultSet intForColumn:@"releaseDateUserID"];
//        date.joinUser.userID = [resultSet intForColumn:@"userID"];
//        date.dateTime = [resultSet dateForColumn:@"dateTime"];
//        date.datePlace = [resultSet stringForColumn:@"datePlace"];
//        date.costMethod = [resultSet intForColumn:@"costMethod"];
//        date.dateTarget = [resultSet intForColumn:@"dateTarget"];
//        date.signUpNumbers = [resultSet intForColumn:@"signUpNumbers"];
//        date.dateState = [resultSet intForColumn:@"dateState"];
//        [array addObject:date];
//        MyRelease(date);
//    }
//    [DataBaseManager closeDataBase];
//    return array;
//}
//
//+ (NSMutableArray *)queryJoinDateInfoWithID:(NSInteger)userID{
//    FMDatabase *oneDatabase = [DataBaseManager openDataBase];
//    FMResultSet *resultSet = [oneDatabase executeQueryWithFormat:@"select * from DateInfo where joinUserID = %d",userID];
//    NSMutableArray *array = [NSMutableArray array];
//    DateInfo *date = nil;
//    if([resultSet next]){
//        date = [[DateInfo alloc]init];
//        date.releaseUser.userID = [resultSet intForColumn:@"releaseDateUserID"];
//        date.joinUser.userID = [resultSet intForColumn:@"userID"];
//        date.dateTime = [resultSet dateForColumn:@"dateTime"];
//        date.datePlace = [resultSet stringForColumn:@"datePlace"];
//        date.costMethod = [resultSet intForColumn:@"costMethod"];
//        date.dateTarget = [resultSet intForColumn:@"dateTarget"];
//        date.signUpNumbers = [resultSet intForColumn:@"signUpNumbers"];
//        date.dateState = [resultSet intForColumn:@"dateState"];
//        [array addObject:date];
//        MyRelease(date);
//    }
//    [DataBaseManager closeDataBase];
//    return array;
//}
//
//
//+ (NSMutableArray *)queryAllContactsWithID:(NSInteger )userID{
//    NSMutableArray *array = [NSMutableArray array];
//    FMDatabase *oneDatabase = [DataBaseManager openDataBase];
//    FMResultSet *resultSet = [oneDatabase executeQueryWithFormat:@"select * from ContactPair where firstUserID = %d",userID];
//    UserInfo *user = nil;
//    while([resultSet next]){
//        int friendId = [resultSet intForColumn:@"secondUserID"];
//        user = [DataBaseManager queryContactWithId:friendId];
//        [array addObject:user];
//        MyRelease(user);
//    }
//    
//    oneDatabase = [DataBaseManager openDataBase];
//    resultSet = [oneDatabase executeQueryWithFormat:@"select * from ContactPair where secondUserID = %d",userID];
//    while([resultSet next]){
//        int friendId = [resultSet intForColumn:@"secondUserID"];
//        user = [DataBaseManager queryContactWithId:friendId];
//        [array addObject:user];
//        MyRelease(user);
//    }
//    [DataBaseManager closeDataBase];
//    return array;
//}
//
//+ (BOOL)queryContactPairWithFirstID:(NSInteger)firstUsrID
//                           SecondID:(NSInteger)secondUserID{
//    FMDatabase *oneDatabase = [DataBaseManager openDataBase];
//    FMResultSet *resultSet = [oneDatabase executeQueryWithFormat:@"select * from ContactPair where firstUserID = %d and secondUserID = %d",firstUsrID,secondUserID];
//    if ([resultSet next]) {
//        return true;
//    }
//    oneDatabase = [DataBaseManager openDataBase];
//    resultSet = [oneDatabase executeQueryWithFormat:@"select * from ContactPair where firstUserID = %d and secondUserID = %d",secondUserID,firstUsrID];
//    if ([resultSet next]) {
//        return true;
//    }
//    return false;
//}
//
//
//
//#pragma mark 插入
////插入用户信息的方法
//+ (BOOL)insertOneUserWithUserInfo:(UserInfo *)userInfo
//{
//    FMDatabase *oneDataBase = [DataBaseManager openDataBase];
//    BOOL result = false;
//    if (userInfo.userAvatar != nil) {
//         result = [oneDataBase executeUpdateWithFormat:@"insert into UserInfo (userAccount,userNickName,userGender,userAge,userConstellation, userIndividualitysignature, userAppearedPlace, userIfSmoking, userIfDrinking, userOccupation,userAvatar,userPassword) values (%@,%@,%d,%d,%d,%@,%@,%d,%d,%@,%@,%@)",userInfo.userAccount, userInfo.userNickName, userInfo.userGender, userInfo.userAge, userInfo.userConstellation, userInfo.userIndividualitysignature, userInfo.userAppearedPlace, userInfo.userIfSmoking, userInfo.userIfDrinking, userInfo.userOccupation,UIImageJPEGRepresentation(userInfo.userAvatar, 1.0),userInfo.userPassword];
//    }else{
//        result = [oneDataBase executeUpdateWithFormat:@"insert into UserInfo (userAccount,userNickName,userGender,userAge,userConstellation, userIndividualitysignature, userAppearedPlace, userIfSmoking, userIfDrinking, userOccupation,userPassword) values (%@,%@,%d,%d,%d,%@,%@,%d,%d,%@,%@)",userInfo.userAccount, userInfo.userNickName, userInfo.userGender, userInfo.userAge, userInfo.userConstellation, userInfo.userIndividualitysignature, userInfo.userAppearedPlace, userInfo.userIfSmoking, userInfo.userIfDrinking, userInfo.userOccupation,userInfo.userPassword];
//    }
//    [DataBaseManager closeDataBase];
//    if (result) {
//        UserInfo *userquery = [DataBaseManager queryContactWithAccout:userInfo.userAccount];
//        userInfo.userID = userquery.userID;
//    }
//    return result;
//}
////插入约饭信息的方法
//+ (BOOL)insertOneDateWithDateInfo:(DateInfo *)dateInfo
//{
//    FMDatabase *oneDataBase = [DataBaseManager openDataBase];
//    BOOL result = [oneDataBase executeUpdateWithFormat:@"insert into DateInfo (releaseDateUserID,joinUserID,dateTime,datePlace,costMethod, dateTarget, signUpNumbers, dateState) values (%d,%d,%@,%@,%d,%d,%d,%d)", dateInfo.releaseDateUserID, dateInfo.joinUserID, dateInfo.dateTime, dateInfo.datePlace, dateInfo.costMethod, dateInfo.dateTarget, dateInfo.signUpNumbers, dateInfo.dateState];
//    [DataBaseManager closeDataBase];
//    return result;
//}
////插入好友对儿的方法
//+ (BOOL)insertOneContactPairWithContactPair:(ContactPair *)contactPair
//{
//    if (contactPair.firstUserID == contactPair.secondUserID) {
//        return false;
//    }
//    if([DataBaseManager queryContactPairWithFirstID:contactPair.firstUserID SecondID:contactPair.secondUserID]){
//        NSLog(@"用户配对已存在");
//        return false;
//    }
//    
//
//    FMDatabase *oneDataBase = [DataBaseManager openDataBase];
//    BOOL result = [oneDataBase executeUpdateWithFormat:@"insert into ContactPair (firstUserID, secondUserID) values (%d,%d)", contactPair.firstUserID, contactPair.secondUserID];
//    [DataBaseManager closeDataBase];
//    return result;
//}
//
//#pragma mark 删除
//+ (BOOL)deleteOneContactPairWithContactPair:(ContactPair *)contactPair
//{
//    FMDatabase *oneDateBase = [DataBaseManager openDataBase];
//    BOOL result = [oneDateBase executeUpdateWithFormat:@"delete from ContactPair where firstUserID = %d and secondUserID = %d" , contactPair.firstUserID, contactPair.secondUserID];
//    if (result) {
//        [DataBaseManager closeDataBase];
//        return true;
//    }
//    result = [oneDateBase executeUpdateWithFormat:@"delete from ContactPair where firstUserID = %d and secondUserID = %d",contactPair.secondUserID, contactPair.firstUserID];
//    [DataBaseManager closeDataBase];
//    return result;
//}
//
//#pragma mark 修改
////更新用户信息功能
//+ (BOOL)updateOneUserWithUserInfo:(UserInfo *)userInfo
//{
//    FMDatabase *oneDateBase = [DataBaseManager openDataBase];
//    BOOL result = [oneDateBase executeUpdateWithFormat:@"update UserInfo set userNickName = %@, userGender = %d, userAge = %d, userConstellation = %d, userIndividualitysignature = %@, userAppearedPlace = %@, userIfSmoking = %d, userIfDrinking = %d, userOccupation = %@ where userID = %d", userInfo.userNickName, userInfo.userGender, userInfo.userAge, userInfo.userConstellation, userInfo.userIndividualitysignature, userInfo.userAppearedPlace, userInfo.userIfSmoking, userInfo.userIfDrinking, userInfo.userOccupation, userInfo.userID];
//    [DataBaseManager closeDataBase];
//    NSLog(@"%d",result);
//    return result;
//}
//+ (BOOL)updateOneUserPasswordWithUserInfo:(UserInfo *)userInfo
//{
//    FMDatabase *oneDateBase = [DataBaseManager openDataBase];
//    BOOL result = [oneDateBase executeUpdateWithFormat:@"update UserInfo set userPassword = %@ where userID = %d", userInfo.userPassword,userInfo.userID];
//    [DataBaseManager closeDataBase];
//    NSLog(@"%d",result);
//    return result;
//}
//
//
//
////+ (NSMutableArray *)queryAllContactsWithId:(NSInteger)id{
////    NSMutableArray *contactArray = [NSMutableArray array];
////    FMDatabase *oneDatabase = [DataBaseManager openDataBase];
////    FMResultSet *resultSet = [oneDatabase executeQueryWithFormat:@"select * from UserInfo where bookIsOnShelf = %d",isOnBookShelf];
////    //while循环获取集合中的
////    while ([resultSet next]) {
////        NSString *name = [resultSet stringForColumn:@"bookName"];
////        NSString *price = [resultSet stringForColumn:@"bookPrice"];
////        NSString *category = [resultSet stringForColumn:@"bookCategory"];
////        NSData *imageData = [resultSet dataForColumn:@"bookAvatar"];
////        NSInteger bookId = [resultSet intForColumn:@"bookID"];
////        BookItemInfo *item = [[BookItemInfo alloc]initWithBookID:[NSString stringWithFormat:@"%d",bookId] name:name price:price category:category avaterImage:[UIImage imageWithData:imageData]];
////        [bookArray addObject:item];
////        [item release] ;item = nil;
////    }
////    [DataBaseManager closeDataBase];
////    return bookArray;
////}
//
////+ (NSMutableArray *)queryAllBookItemInfoWithCategory:(NSString *)category{
////    NSMutableArray *bookArray = [NSMutableArray array];
////    FMDatabase *oneDatabase = [DataBaseManager openDataBase];
////    FMResultSet *resultSet = [oneDatabase executeQueryWithFormat:@"select * from BookInfo where bookIsOnShelf = %d and bookCategory = %@",YES,category];
////    //while循环获取集合中的
////    while ([resultSet next]) {
////        NSString *name = [resultSet stringForColumn:@"bookName"];
////        NSString *price = [resultSet stringForColumn:@"bookPrice"];
////        NSString *category = [resultSet stringForColumn:@"bookCategory"];
////        NSData *imageData = [resultSet dataForColumn:@"bookAvatar"];
////        NSInteger bookId = [resultSet intForColumn:@"bookID"];
////        BookItemInfo *item = [[BookItemInfo alloc]initWithBookID:[NSString stringWithFormat:@"%d",bookId] name:name price:price category:category avaterImage:[UIImage imageWithData:imageData]];
////        [bookArray addObject:item];
////        [item release] ;item = nil;
////    }
////    [DataBaseManager closeDataBase];
////    return bookArray;
////}
////
////
////+ (BOOL)insertOneBookItemWithBookImfo:(BookItemInfo *)item;{
////    FMDatabase *oneDataBase = [DataBaseManager openDataBase];
////    NSData *imageData = UIImagePNGRepresentation(item.bookAvatar);
////    BOOL result;
////    if (item.bookAvatar) {
////        result = [oneDataBase executeUpdateWithFormat:@"insert into BookInfo (bookName,bookPrice,bookCategory,bookAvatar,bookIsOnShelf) values(%@,%@,%@,%@,%d)",item.bookName,item.bookPrice,item.bookCategory,UIImagePNGRepresentation(item.bookAvatar),item.bookIsOnShelf];
////    }else{
////        result = [oneDataBase executeUpdateWithFormat:@"insert into BookInfo (bookName,bookPrice,bookCategory,bookIsOnShelf) values(%@,%@,%@,%d)",item.bookName,item.bookPrice,item.bookCategory,item.bookIsOnShelf];
////    }
////    [DataBaseManager closeDataBase];
////    return result;
////}
////
////+ (BOOL)deleteOneBookItemWithBookInfo:(BookItemInfo *)item;{
////    FMDatabase *oneDatabase  = [DataBaseManager openDataBase];
////    BOOL result = [oneDatabase executeUpdateWithFormat:@"delete from BookInfo where bookID = %@",item.bookID];
////    [DataBaseManager closeDataBase];
////    return result;
////}
////+ (BOOL)updateOneBookItemWithBookInfo:(BookItemInfo *)item;{
////    FMDatabase *oneDataBase = [DataBaseManager openDataBase];
////    int bookid = [item.bookID integerValue];
////    NSData *imageData = UIImagePNGRepresentation(item.bookAvatar);
////    BOOL result;
////    if (item.bookAvatar) {
////         result = [oneDataBase executeUpdateWithFormat:@"update BookInfo set bookName = %@,bookPrice = %@,bookCategory = %@,bookAvatar = %@,bookIsOnShelf = %d where bookID = %d",item.bookName,item.bookPrice,item.bookCategory,imageData,item.bookIsOnShelf,bookid];
////    }else{
////         result = [oneDataBase executeUpdateWithFormat:@"update BookInfo set bookName = %@,bookPrice = %@,bookCategory = %@,bookAvatar = 0,bookIsOnShelf = %d where bookID = %d",item.bookName,item.bookPrice,item.bookCategory,item.bookIsOnShelf,bookid];
////    }
////    [DataBaseManager closeDataBase];
////    return result;
////}
//@end
