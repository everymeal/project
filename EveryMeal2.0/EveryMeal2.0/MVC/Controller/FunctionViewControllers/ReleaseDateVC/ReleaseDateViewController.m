//
//  ReleaseDate.m
//  EveryMeal2
//
//  Created by  ; on 14-3-11.
//  Copyright (c) 2014年 BN. All rights reserved.
//

#import "ReleaseDateViewController.h"
#import "DatePlaceViewController.h"

@interface ReleaseDateViewController (){
    UIButton *_time;
    UIView *_dateView;
    UIPickerView *_datePicker;
    UIButton *_dateButton;
    NSInteger _year;
    NSInteger _month;
    NSInteger _day;
    NSInteger _hour;
    NSInteger _minute;
    UIButton *_place;
    UITextField *_description;
}

@end

@implementation ReleaseDateViewController
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        
//        _datePicker = nil;
//        _dateButton = nil;
//        _dateView =nil;
//        _time = nil;
//        _year = 2014;
//        
//        _place = nil;
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dateTable.dataSource =self;
    self.dateTable.delegate = self;
    CGRect rect = self.dateTable.bounds;
    rect.size.width = 320;
    self.dateTable.bounds = rect;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    switch (indexPath.row) {
        case 0:{
            cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
            cell.textLabel.text = @"约会的对象";
            break;
        }
        case 1:{
            cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
            UISegmentedControl *gender = [[UISegmentedControl alloc]initWithItems:@[@"女",@"男",@"不限"]];
            gender.frame = CGRectMake(0, 0, 280, 44);
            [cell addSubview:gender];MyRelease(gender);
            
            break;
        }
        case 2:{
            
            cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 2, 50, 40)];
            label.text = @"费用";
            [cell addSubview:label];MyRelease(label);
            
            UISegmentedControl *cost = [[UISegmentedControl alloc]initWithItems:@[@"我管饭",@"AA",@"求管饭"]];
            cost.frame = CGRectMake(60, 2, 210, 40);
            [cell addSubview:cost];MyRelease(cost);
            break;
        }
        case 3:{
            cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
            _time = [[UIButton alloc]init];
            _time.frame = CGRectMake(0, 2, 280, 40);
            [_time setTitle:@"时间" forState:UIControlStateNormal];
            [_time setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            _time.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            _time.contentEdgeInsets = UIEdgeInsetsMake(0,10, 0, 0);
            [_time addTarget:self action:@selector(timeButtonAction:) forControlEvents:UIControlEventTouchDown];
            [_time addTarget:self action:@selector(timeButtonActionTouchUpInside:)forControlEvents:UIControlEventTouchUpInside];
            [_time addTarget:self action:@selector(timeButtonActionTouchUpOutside:)forControlEvents:UIControlEventTouchUpOutside];
            
            [cell addSubview:_time];
            break;
        }
        case 4:{
            cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
            _place = [[UIButton alloc]init];
            _place.frame = CGRectMake(0, 2, cell.bounds.size.width, cell.bounds.size.height-4);
            _place.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            _place.contentEdgeInsets = UIEdgeInsetsMake(0,10, 0, 0);
            [_place setTitle:@"地点" forState:UIControlStateNormal];
            [_place setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [_place addTarget:self action:@selector(datePlaceButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:_place];
            break;
        }
        case 5:{
            cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 2, 50, 40)];
            label.text = @"说明";
            [cell addSubview:label];MyRelease(label);
            
            if (_description == nil) {
                _description = [[UITextField alloc]initWithFrame:CGRectMake(60, 0, cell.bounds.size.width-60, 40)];
                [cell addSubview:_description];
                _description.delegate = self;
            }
            break;
        }
            
        default:
            break;
    }
    return cell;
}

- (void)datePlaceButtonAction:(UIButton *)sender{
    DatePlaceViewController *dateVC = [[DatePlaceViewController alloc]init];
    [self.navigationController pushViewController:dateVC animated:YES];
    MyRelease(dateVC);
}



- (void)timeButtonAction:(UIButton *)sender{
    [sender setTitleColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0] forState:UIControlStateNormal];
}

- (void)timeButtonActionTouchUpInside:(UIButton *)sender{
    [sender setTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0] forState:UIControlStateNormal];
    CGRect rect = sender.superview.superview.frame;
    if (_dateView == nil) {
        _dateView = [[UIView alloc]initWithFrame:CGRectMake(0, rect.origin.y+44, rect.size.width, 150)];
        _dateView.backgroundColor = [UIColor whiteColor];
        _dateButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, rect.size.width, 40)];
        [_dateButton setTitle:@"完成" forState:UIControlStateNormal];
        [_dateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_dateButton addTarget:self action:@selector(completeSelectedTime:) forControlEvents:UIControlEventTouchUpInside];
        _dateButton.backgroundColor = [UIColor grayColor];
        _datePicker  = [[UIPickerView alloc]initWithFrame:CGRectMake(0,30, rect.size.width, _dateView.bounds.size.height-40)];
        [self.dateTable addSubview:_dateView];
        [_dateView addSubview:_dateButton];
        [_dateView addSubview:_datePicker];
        _datePicker.delegate = self;
        _datePicker.dataSource = self;
        
        
        
        NSUInteger max = timePickerNumber;
        NSUInteger base10 = (max/2)-(max/2)%12;
        //NSInteger interg = [_datePicker selectedRowInComponent:0];
        [_datePicker selectRow:[_datePicker selectedRowInComponent:0]%12+base10 inComponent:0 animated:false];
        NSInteger day = [self dayFromMonth:[_datePicker selectedRowInComponent:0] AndYear:_year];
         base10 = (max/2)-(max/2)%day;
        [_datePicker selectRow:[_datePicker selectedRowInComponent:1]%day+base10 inComponent:1 animated:false];
        base10 = (max/2)-(max/2)%24;
        [_datePicker selectRow:[_datePicker selectedRowInComponent:2]%24+base10 inComponent:2 animated:false];
        base10 = (max/2)-(max/2)%60;
        [_datePicker selectRow:[_datePicker selectedRowInComponent:3]%60+base10 inComponent:3 animated:false];

    }else{
        _dateView.hidden = NO;
    }
}

- (NSInteger)dayFromMonth:(NSInteger)Month
                  AndYear:(NSInteger)year{
    if (Month == 2) {
        if (year%4) {
            return 28;
        }
        if (year%100==0) {
            if (year%400) {
                return 29;
            }
            return 28;
        }
        return 29;
    }
    if (Month%2==1 && Month<8) {
        return 31;
    }
    if (Month%2==0 && Month>7) {
        return 31;
    }
    return 30;
}

- (void)completeSelectedTime:(UIButton *)sender{
    _dateView.hidden = YES;
    [_datePicker selectedRowInComponent:0];
    [_time setTitle:[NSString stringWithFormat:@"时间:    %ld月%ld日 %ld时%ld分",_month,_day,_hour,_minute] forState:UIControlStateNormal];

}

- (void)timeButtonActionTouchUpOutside:(UIButton *)sender{
    [sender setTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0] forState:UIControlStateNormal];
}



#pragma mark - UIPickView Delegate Function -
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 4;
}



// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger number = timePickerNumber;
//    switch (component) {
//        case 0:
//            number = 12;
//            break;
//        case 1:
//            number = 31;
//            break;
//        case 2:
//            number = 24;
//            break;
//        case 3:
//            number = 60;
//            break;
//        default:
//            break;
//    }
    return number;
}


// returns width of column and height of row for each component.
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    CGFloat width = 0;
    switch (component) {
        case 0:
            width = 60;
            break;
        case 1:
            width = 60;
            break;
        case 2:
            width = 40;
            break;
        case 3:
            width = 40;
            break;
        default:
            break;
    }
    return width;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 20;
}

// these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
// for the view versions, we cache any hidden and thus unused views and pass them back for reuse.
// If you return back a different object, the old one will be released. the view will be centered in the row rect
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSMutableString *string = nil;
    switch (component) {
        case 0:{
            _month = row%12+1;
            string = [NSMutableString stringWithFormat:@"%ld%@",_month,@"月"];
            
            break;
        }
        case 1:{
            NSInteger day = [self dayFromMonth:_month AndYear:_year];
            _day = row%day+1;
            string = [NSMutableString stringWithFormat:@"%ld%@",_day,@"日"];
            break;
        }
        case 2:{
            _hour = row%24;
            string = [NSMutableString stringWithFormat:@"%ld",row%24];
            break;
        }
        case 3:{
            _minute = row%60;
            string = [NSMutableString stringWithFormat:@"%ld",row%60];
            break;
        }
        default:
            break;
    }
    return string;
}

//- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component NS_AVAILABLE_IOS(6_0);
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    switch (component) {
        case 0:{
            _month = row%12+1;
            break;
        }
        case 1:{
            NSInteger day = [self dayFromMonth:_month AndYear:_year];
            _day = row%day+1;
            break;
        }
        case 2:{
            _hour = row%24;
            break;
        }
        case 3:{
            _minute = row%60;
            break;
        }
        default:
            break;
    }
    
}

#pragma mark - delegate method - 

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_datePicker release];
    [_dateTable release];
    [_dateButton release];
    [_dateView release];
    [_time release];
    [_place release];
    [_description release];
    [_dateTable release];
    [super dealloc];
}
- (IBAction)ReleaseButtonAction:(UIButton *)sender {
    NSLog(@"%s", __FUNCTION__);
}
@end
