//
//  OneInfoModel.h
//  EveryMeal
//
//  Created by  liwenhao on 14-3-23.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import "BaseModel.h"

@interface OneInfoModel : BaseModel

@property(nonatomic,retain) NSString *info;
@property(nonatomic,assign) int rowTag;


- (instancetype)initWithInfo:(NSString *)info
                         RowTag:(int)rowTag;
+ (instancetype)oneInfoModelWithInfo:(NSString *)info
                              RowTag:(int)rowTag;
@end
