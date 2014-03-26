//
//  CellFactory.h
//  test12
//
//  Created by lanou on 14-1-14.
//  Copyright (c) 2014年 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/*-----------------------------------------------------------------
 *CellFactory : NSObject(cell工厂)
 *cell工厂,在我们tableView中为不同的cell类型和数据模型提供了关联的方法,它拆分
 *了cell类型和数据模型强耦合的关系,使得我们的代码具有了更强的低耦合高内聚特性,
 *更重要的是,使得我们的代码更有通用性
 *------------------------------------------------------------------*/
@class BaseModel, BaseCell;
@interface CellFactory : NSObject

/*-----------------------------------------------------------------
 *类方法,通过给定一个子类化的数据模型和一个重用标识符,创建一个相对应的cell对象.
 *------------------------------------------------------------------*/
+ (BaseCell *)cellForModel:(BaseModel *)modelForCell reuseabledIdentifier:(NSString *)cellIdentifier;
/*-----------------------------------------------------------------
 *类方法,通过给定一个子类化的数据模型,返回该数据模型相对应的cell子类型
 *项目中应该把需要使用到得自定义cell子类型关联到该方法中
 *------------------------------------------------------------------*/
+ (Class)cellClassForModel:(BaseModel *)dataModel;

@end
