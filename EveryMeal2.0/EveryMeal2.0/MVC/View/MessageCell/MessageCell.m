//
//  MessageCell.m
//  EveryMeal2
//
//  Created by  lanou on 14-3-12.
//  Copyright (c) 2014年 BN. All rights reserved.
//

#import "MessageCell.h"
#import "MessageModel.h"

@implementation MessageCell

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
    [super setDataForCell:dataForCell];
    MessageModel *messageModel = (MessageModel *)dataForCell;
    self.SendTimeLabel.text = messageModel.sendTimeString;
    self.SendUserAvatarView.image = messageModel.sendUserAvatar;
    self.SendUserLabel.text = messageModel.sendUser;
    self.messageLabel.text = messageModel.message;
}
+(CGFloat)cellHeightForModel:(BaseModel *)dataForCell{
    return 80;
}


- (void)dealloc {
    [_messageLabel release];
    [_SendUserLabel release];
    [_SendTimeLabel release];
    [_SendUserAvatarView release];
    [super dealloc];
}
@end
