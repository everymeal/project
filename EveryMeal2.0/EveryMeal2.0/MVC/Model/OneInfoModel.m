//
//  OneInfoModel.m
//  EveryMeal
//
//  Created by  liwenhao on 14-3-23.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import "OneInfoModel.h"

@implementation OneInfoModel

- (instancetype)initWithInfo:(NSString *)info
                      RowTag:(int)rowTag{
    if (self = [super init]) {
        self.info = info;
        self.rowTag = rowTag;
    }
    return self;
}
+ (instancetype)oneInfoModelWithInfo:(NSString *)info
                              RowTag:(int)rowTag{
    return [[OneInfoModel alloc]initWithInfo:info
                                      RowTag:rowTag];
}

- (instancetype)init{
    return [self initWithInfo:@"" RowTag:0];
}
@end
