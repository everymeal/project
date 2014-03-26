//
//  ContactPair.m
//  EveryMeal
//
//  Created by apple on 14-3-13.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import "ContactPair.h"

@implementation ContactPair
- (id)initWithFirstUserID:(NSInteger)firstUserID
          andSecondUserID:(NSInteger)secondUserID{
    if (self = [super init]) {
        self.firstUserID = firstUserID;
        self.secondUserID = secondUserID;
    }
    return self;
}

- (NSString *)bodyString{
    NSMutableString *string = [NSMutableString string];
    [string appendFormat:@"%@=%ld&",@ToString(firstUserID),_firstUserID];
    [string appendFormat:@"%@=%ld",@ToString(secondUserID),_secondUserID];
    
    
    return [[string retain]autorelease];
}
@end
