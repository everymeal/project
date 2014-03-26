//
//  TwoSideCell.m
//  EveryMeal
//
//  Created by  liwenhao on 14-3-21.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import "TwoSideCell.h"
#import "TwoSideModel.h"

@implementation TwoSideCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self = (TwoSideCell *)[[[NSBundle mainBundle]loadNibNamed:@"TwoSideCell" owner:nil options:nil]lastObject];
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
    TwoSideModel *twoSideMode = (TwoSideModel *)dataForCell;
    self.questionLabel.text = twoSideMode.questionString;
    self.answerLabel.text = twoSideMode.answerString;
}
+(CGFloat)cellHeightForModel:(BaseModel *)dataForCell{
    return 44;
}

- (void)dealloc {
    [_questionLabel release];
    [_answerLabel release];
    [super dealloc];
}
@end
