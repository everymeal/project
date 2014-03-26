//
//  PersonalInfoCell.m
//  EveryMeal
//
//  Created by apple on 14-3-11.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import "PersonInfoCell.h"
#import "PersonUserInfo.h"

@implementation PersonInfoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self = (PersonInfoCell *)[[[NSBundle mainBundle]loadNibNamed:@"PersonInfoCell" owner:nil options:nil]lastObject];
    }
    return self;
}
- (void)setDataForCell:(BaseModel *)dataForCell{
    [super setDataForCell:dataForCell];
    PersonUserInfo *userInfo = (PersonUserInfo *)dataForCell;
    self.userNickNameLabel.text = userInfo.userNickName;
    self.userIndividualitysignatureLabel.text = userInfo.userIndividualitysignature;
    self.userAvatarView.image = userInfo.userAvatar;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (CGFloat)cellHeightForModel:(BaseModel *)dataForCell{
    return 120;
}


- (void)dealloc {
    [_userAvatarView release];
    [_userNickNameLabel release];
    [_userIndividualitysignatureLabel release];
    [super dealloc];
}
@end
