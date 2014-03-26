//
//  BaseTableViewController.h
//  test12
//
//  Created by lanou on 14-1-14.
//  Copyright (c) 2014年 蓝鸥科技. All rights reserved.
//

#import <UIKit/UIKit.h>
/*-------------------------------------------------------------------------------
 *表视图控制器基类:这是一个表视图控制器的基类!!!当需要多个表视图控制器的时候,可以继承该基类,
 *子类只需重写- (NSMutableArray *)hardCode 方法以实现给其tableView封装数据源,
 *无需再写其他相关联的支持方法,提供了代码的极高的通用性
 *--------------------------------------------------------------------------------*/
@interface BaseTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

{
    //表示图数据源
    NSMutableArray *_dataSource;
    //表视图
    UITableView    *_tableView;
}
/*-----------------------------------------------------------
 *实现封装数据源需要的数据对象,当服务器还无法提供数据服务时,调用此
 此方法实现临时测试,子类需要重写此方法,来为不同的表视图提供相应的数据源
 *-----------------------------------------------------------*/
- (NSMutableArray *)hardCode;
- (UITableView *)tableView;
- (void)reloadData;

@end
