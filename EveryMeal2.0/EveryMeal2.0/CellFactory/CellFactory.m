//
//  CellFactory.m
//  test12
//
//  Created by lanou on 14-1-14.
//  Copyright (c) 2014年 蓝鸥科技. All rights reserved.
//

#import "CellFactory.h"
#import "BaseCell.h"
#import "BaseModel.h"
/*-----------------------------------
 *引入用到的自定义cell子类型的头文件,以及
 *子类化的数据模型的头文件
 *----------------------------------*/
#import "UserInfo.h"
#import "ContactUserInfo.h"
#import "ContactTableViewCell.h"
#import "PersonInfoCell.h"
#import "PersonUserInfo.h"
#import "TwoSideCell.h"
#import "TwoSideModel.h"
#import "OneInfoCell.h"
#import "OneInfoModel.h"
#import "DateInfo.h"
#import "DateMealCell.h"
#import "DateMealModel.h"
#import "MessageCell.h"
#import "MessageModel.h"


@implementation CellFactory

+ (BaseCell *)cellForModel:(BaseModel *)modelForCell reuseabledIdentifier:(NSString *)cellIdentifier
{
    //获得数据模型相对应的cell子类
    Class cellClass = [self cellClassForModel:modelForCell];
    
    //用子类对象初始化父类指针
    BaseCell *cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    return [cell autorelease];
}

/*-----------------------------------------------------------------
 *类方法,通过给定一个子类化的数据模型,返回该数据模型相对应的cell子类型
 *项目中应该把需要使用到得自定义cell子类型关联到该方法中
 *------------------------------------------------------------------*/
+(Class)cellClassForModel:(BaseModel *)dataModel
{
    Class cellClass = Nil;
    
    if ([dataModel isKindOfClass:[ContactUserInfo class]])
    {
        cellClass = [ContactTableViewCell class];
    }else if ([dataModel isKindOfClass:[PersonUserInfo class]])
    {
        cellClass = [PersonInfoCell class];
    }else if ([dataModel isKindOfClass:[TwoSideModel class]])
    {
        cellClass = [TwoSideCell class];
    }else if ([dataModel isKindOfClass:[UserInfo class]])
    {
        cellClass = [UITableViewCell class];
    }else if ([dataModel isKindOfClass:[OneInfoModel class]])
    {
        cellClass = [OneInfoCell class];
    }else if ([dataModel isKindOfClass:[DateMealModel class]]){
        cellClass = [DateMealCell class];
    }else if ([dataModel isKindOfClass:[MessageModel class]]){
        cellClass = [MessageCell class];
    }

    return cellClass;
}
@end
