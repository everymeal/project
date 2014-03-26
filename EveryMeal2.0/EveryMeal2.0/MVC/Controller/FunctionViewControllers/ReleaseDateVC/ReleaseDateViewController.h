//
//  ReleaseDate.h
//  EveryMeal2
//
//  Created by  lanou on 14-3-11.
//  Copyright (c) 2014年 BN. All rights reserved.
//

#import <UIKit/UIKit.h>
#define timePickerNumber 16384

@interface ReleaseDateViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
@property (retain, nonatomic) IBOutlet UITableView *dateTable;

- (IBAction)ReleaseButtonAction:(UIButton *)sender;

@end
