//
//  ContactPair.h
//  EveryMeal
//
//  Created by apple on 14-3-13.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactPair : NSObject

@property(nonatomic,assign)NSInteger firstUserID;
@property(nonatomic,assign)NSInteger secondUserID;

- (NSString *)bodyString;

- (id)initWithFirstUserID:(NSInteger)firstUserID
          andSecondUserID:(NSInteger)secondUserID;

@end
