//
//  TwoSideMode.h
//  EveryMeal
//
//  Created by  liwenhao on 14-3-21.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import "BaseModel.h"

@interface TwoSideModel : BaseModel
@property(nonatomic,retain) NSString *questionString;
@property(nonatomic,retain) NSString *answerString;
@property(nonatomic,assign) int rowTag;
- (id)initWithQuestionString:(NSString *)quesion
                AnswerString:(NSString *)answer
                         RowTag:(int)rowTag;
@end
