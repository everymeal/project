//
//  DealMealCell.m
//  EveryMeal
//
//  Created by apple on 14-3-11.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import "DateMealCell.h"
#import "DateMealModel.h"

@implementation DateMealCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:Nil options:nil]firstObject];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDataForCell:(BaseModel *)dataForCell{
    //1.调用父类的setter方法,防止递归调用
    [super setDataForCell:dataForCell];
    //2.强制转换成相对应的子类化的数据模型
    DateMealModel *dateInfo = (DateMealModel *)dataForCell;
  
    //3.把相对应的数据对象中的数据设置到子类化的cell属性中
    self.userAvaterView.image = dateInfo.releaseUser.userAvatar;
    self.userNickNameLabel.text = dateInfo.releaseUser.userNickName;
    NSString *path = [[NSBundle mainBundle]pathForResource:@"project" ofType:@"plist"];
    NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:path];
    self.dateCostMethodLabel.text = [[dic objectForKey:constellations] objectAtIndex:dateInfo.releaseUser.userConstellation];
    self.datePlaceLabel.text = dateInfo.datePlace;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"mm-dd hh:mm"];
    self.dateTimeLabel.text = [formatter stringFromDate:dateInfo.dateTime];
    //    self.dateTargetLable.text = dateInfo.releaseUser.userGenderString;
    self.signUpNumberLabel.text = [NSString stringWithFormat:@"%d人报名",dateInfo.signUpNumbers];
    self.userGenderLabel.text = dateInfo.releaseUser.userGenderString;
}


- (void)dealloc {
    
    [_userAvaterView release];//
    [_userNickNameLabel release];//用户昵称
    [_dateCostMethodLabel release];//消费方式
    [_datePlaceLabel release];//约会地点
    [_dateTimeLabel release];//约会时间
    [_dateTargetLable release];//邀请什么样的人
    [_signUpNumberLabel release];//报名人数
    [_userGenderLabel release];
    [_userAgeLabel release];
    [_userConstellationLabel release];
    
    [super dealloc];
}
@end
