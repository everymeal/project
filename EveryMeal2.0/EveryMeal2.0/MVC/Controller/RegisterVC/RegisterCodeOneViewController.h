//
//  RegisterCodeOneViewController.h
//  SoFun004
//
//  Created by 雨亭梧桐雪 on 14-3-19.
//  Copyright (c) 2014年 龙猫工作室. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfo.h"

@interface RegisterCodeOneViewController : UIViewController<UITextFieldDelegate, ServerDataBaseManagerProtocal, isSuccessDownload, UIAlertViewDelegate>

@property (nonatomic, retain) NSArray * imageNames;//存储图片名字的数组,_imageNames[1]是头像_imageNames[0]是背景
@property (nonatomic, retain) UserInfo * newUser;//注册的新用户
- (instancetype)initWithImages:(NSArray *)imageNames;//自定义初始化方法
+ (instancetype)loginWithImages:(NSArray *)imageNames;//便利构造器


@end
