//
//  OneInfoCell.m
//  EveryMeal
//
//  Created by  liwenhao on 14-3-23.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import "OneInfoCell.h"
#import "OneInfoModel.h"

@implementation OneInfoCell

- (id)initWithFrame:(CGRect)frame
{
    self = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OneInfoCell"];
    self.frame = frame;
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self = (OneInfoCell *)[[[NSBundle mainBundle]loadNibNamed:@"OneInfoCell" owner:nil options:nil]lastObject];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)setDataForCell:(BaseModel *)dataForCell{
    [super setDataForCell:dataForCell];
    OneInfoModel *oneinfo = (OneInfoModel *)dataForCell;
    self.label.text = oneinfo.info;
}
+(CGFloat)cellHeightForModel:(BaseModel *)dataForCell{
    return 44;
}

- (void)dealloc {
    [_label release];
    [super dealloc];
}
@end
