//
//  TwoSideMode.m
//  EveryMeal
//
//  Created by  liwenhao on 14-3-21.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import "TwoSideModel.h"

@implementation TwoSideModel
- (id)initWithQuestionString:(NSString *)quesion
                AnswerString:(NSString *)answer
                      RowTag:(int)rowTag{
    if (self = [super init]) {
        self.questionString = quesion;
        self.answerString = answer;
        self.rowTag = rowTag;
    }
    return self;
}
@end
