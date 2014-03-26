//
//  BaseCell.h
//  test12
//
//  Created by lanou on 14-1-14.
//  Copyright (c) 2014年 蓝鸥科技. All rights reserved.
//

#import <UIKit/UIKit.h>

/*---------------------------------------------------------------
 *BaseCell : UITableViewCell
 *自定义cell的基类,我们一般不实例化该类型,而是需要自定义cell时,继承于该类型
 *
 *----------------------------------------------------------------*/

@class BaseModel;
@interface BaseCell : UITableViewCell

/*-------------------------------------------------------------
 *cell对应的数据模型,子类需要重写该属性的setter方法,实现子类的差异化
 *-----------------------------------------------------------*/
@property (nonatomic, retain) BaseModel *dataForCell;

/*------------------------------------------------------------
 *类方法,子类应该重写该方法,用以返回cell单元对应于数据模型的单元高度
 *------------------------------------------------------------*/
+(CGFloat)cellHeightForModel:(BaseModel *)dataForCell;

@end
