//
//  SeverDataBaseManagerProtocal.h
//  EveryMeal
//
//  Created by  liwenhao on 14-3-20.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ServerDataBaseManager;

@protocol ServerDataBaseManagerProtocal <NSObject>
@optional
- (void)queryDataBase:(ServerDataBaseManager *)serverDataBaseManager
               Result:(BOOL)result
                Array:(NSMutableArray *)array;
@end
