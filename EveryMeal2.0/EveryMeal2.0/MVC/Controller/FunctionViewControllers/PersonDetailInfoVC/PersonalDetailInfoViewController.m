//
//  PersonalDetailInfoViewController.m
//  EveryMeal
//
//  Created by apple on 14-3-12.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import "PersonalDetailInfoViewController.h"
#import "PersonUserInfo.h"
#import "TwoSideModel.h"
#import "OneInfoModel.h"
#import "OneInfoCell.h"
#import "DatePlaceViewController.h"
#import "DetailDealMealViewController.h"
#import "DateMealTableViewController.h"


@interface PersonalDetailInfoViewController ()
@property(nonatomic,retain) DateMealTableViewController *detailVC;
@end

@implementation PersonalDetailInfoViewController
- (NSMutableArray *)hardCode{
    NSMutableArray *array = [NSMutableArray array];
    PersonUserInfo *info = [[PersonUserInfo alloc]initWithUserInfo:self.userInfo];
    [array addObject:info];[info release];
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"project" ofType:@"plist"];
    NSDictionary *project = [[NSDictionary alloc]initWithContentsOfFile:plistPath];
    NSDictionary *personalDetailplist = [project objectForKey:NSStringFromClass([self class])];
    NSArray *oneInfoList = [personalDetailplist objectForKey:NSStringFromClass([OneInfoModel class])];
    NSArray *twoSizeList = [personalDetailplist objectForKey:NSStringFromClass([TwoSideModel class])];
    
    for (int i = 0; i<oneInfoList.count; i++) {
        OneInfoModel *oneInfo = [OneInfoModel oneInfoModelWithInfo:[oneInfoList objectAtIndex:i]
                                                            RowTag:PersonReleaseDateTag+i];//从personreleaseDate开始
        [array addObject:oneInfo];
    }
    
    for (int i = 0; i<twoSizeList.count; i++) {
        NSString *answer = @"";
        NSDictionary *dic = [twoSizeList objectAtIndex:i];
        NSArray *keys = [dic allKeys];
        NSString *func = [keys firstObject];
        SEL sel = NSSelectorFromString(func);
        answer = [self.userInfo performSelector:sel];
        TwoSideModel *oneInfo = [[[TwoSideModel alloc]initWithQuestionString:[dic objectForKey:func] AnswerString:answer RowTag:PersonReleaseDateTag+i]autorelease];
        [array addObject:oneInfo];
     }

    return [[array retain]autorelease];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"个人信息";
//    ServerDataBaseManager *serverDataBase1 = [[ServerDataBaseManager alloc]initWithDelegate:self Tag:PersonInsertDateTag];
//    DateInfo *dateInfo = [[DateInfo alloc]initWithReleaseDateUserID:self.userInfo releaseUserAvaterImage:self.userInfo DateTime:[NSDate date] DateCostMethod:ITreat DateTarget:WantWomen SignUpNumbers:10 DateState:Finished];
//    [serverDataBase1 insertOneDateWithDateInfo:dateInfo];
}


- (void)dealloc{
    [_detailVC release];
    [super dealloc];
}

- (DateMealTableViewController *)detailVC{
    if (_detailVC==nil) {
        _detailVC = [[DateMealTableViewController alloc]init];
    }
    return _detailVC;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        ServerDataBaseManager *serverDataBase = [[ServerDataBaseManager alloc]initWithDelegate:self Tag:PersonDetailQueryDateMealTag];
        [serverDataBase queryReleaseDateInfoWithUserID:self.userInfo.userID];
    }
}

- (void)queryDataBase:(ServerDataBaseManager *)serverDataBaseManager
               Result:(BOOL)result Array:(NSMutableArray *)array{
    if (result) {
        if (serverDataBaseManager.tag == PersonDetailQueryDateMealTag) {
            self.detailVC.array = array;
            [array release];
            [self.navigationController pushViewController:self.detailVC animated:YES];
        }else if(serverDataBaseManager.tag == PersonInsertDateTag){
            NSLog(@"插入成功");
        }
    }
    [serverDataBaseManager autorelease];
}



@end
