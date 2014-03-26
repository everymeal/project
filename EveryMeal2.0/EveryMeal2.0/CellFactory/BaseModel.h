//
//  BaseModel.h
//  test12
//
//  Created by lanou on 14-1-14.
//  Copyright (c) 2014年 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/*---------------------------------------------------------------
 *BaseModel : NSObject
 *自定义数据模型的基类,我们一般不会实例化该类型,而是需要自定义数据模型时,
 *继承于该类型,该类虽然没有添加任何属性和方法,但为面向对象编程机制提供了很多方便
 *比如:用基类的指针指向父类的对象,为我们实现不同数据模型对应于不同的cell类型提供
 *了很大的帮助
 *----------------------------------------------------------------*/
@interface BaseModel : NSObject

@end
