//
//  CommonDefine.h
//  EveryMeal
//
//  Created by  liwenhao on 14-3-21.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

//<<------------------------宏--------定--------义------------------>>//
//自定义安全释放NSObject指针对象
#define RELEASE_SAFELY(_Pointer) do{[_Pointer release],_Pointer = nil;}while(0)
#define MyRelease(var) {[var release];var=nil;}

#define serverIP  @"http://10.0.2.171/em/"

#define SqueryUserInfoWithUserID @"queryUserInfoWithUserID"
#define SqueryUserInfoWithUserAccout @"queryUserInfoWithUserAccount"
#define SqueryAllContactsWithUserID @"queryAllContactsWithUserID"
#define SqueryReleaseDateInfoWithUserID @"queryReleaseDateInfoWithUserID"
#define SqueryJoinDateInfoWithUserID @"queryJoinDateInfoWithUserID"
#define SquertyContactPairIfExist @"quertyContactPairIfExist"
#define SinsertOneContactPairWithContactPair @"insertOneContactPairWithContactPair"
#define SinsertOneDateWithDateInfo @"insertOneDateWithDateInfo"
#define SinsertOneUserWithUserInfo @"insertOneUserWithUserInfo"
#define SdeleteOneContactPairWithContactPair @"deleteOneContactPairWithContactPair"
#define SupdateOneUserPasswordWithUserInfo @"updateOneUserPasswordWithUserInfo"
#define SupdateOneUserWithUserInfo @"updateOneUserWithUserInfo"
#define DateBaseManagerNotice @"hello"

#define constellations @"constellations"

#define PHPEXT @".php"
#define ToString(x) #x

#define Gender(x) x?@"男":@"女"
//>>------------------------宏--------定--------义------------------<<//