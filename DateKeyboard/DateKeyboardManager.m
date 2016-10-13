//
//  DateKeyboardManager.m
//  TravelAppeal
//
//  Created by mac on 16/3/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "DateKeyboardManager.h"

@interface DateKeyboardManager ()<UITextFieldDelegate>

@property (nonatomic,copy) void(^textFeildBegin)(NSString *DateString);

@property (nonatomic,weak) UIDatePicker *datepicker;

@property (nonatomic,copy) NSString *str;

@end

@implementation DateKeyboardManager

static DateKeyboardManager *shareManager = nil;
+ (DateKeyboardManager *)sharedManager {
    static dispatch_once_t once_t;
    dispatch_once(&once_t, ^{
        shareManager = [[DateKeyboardManager alloc] init];
//        shareManager.textField.delegate = shareManager;
    });
    return shareManager;
}

- (void)dateKeyboard:(UITextField *)textField isFromNow:(BOOL)fromNow textFeildBegin:(void(^)(NSString *DateString))block {
    self.textField = textField;
    self.textField.delegate = self;
    // 创建自定义键盘UIDatePicker
    self.textFeildBegin = block;
    UIDatePicker *datepicker = [[UIDatePicker alloc] init];
    
    if (fromNow) {
        NSDate *date = [NSDate dateWithTimeIntervalSinceNow:24 * 60 * 60];
        datepicker.minimumDate = date;
    }
    
    // 设置地区:zh:中国
    datepicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    
    // 监听UIDatePicker的滚动事件
    [datepicker addTarget:self action:@selector(timeChange:) forControlEvents:UIControlEventValueChanged];
    
    // 设置模式
    datepicker.datePickerMode = UIDatePickerModeDate;
    
    self.datepicker = datepicker;

    // inputView自定义键盘
    self.textField.inputView = datepicker;

}

// 监听键盘的滚动
- (void)timeChange:(UIDatePicker *)datepicker
{
     // 日期格式字符串:日期转字符串
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    
    // 设置格式2020-07-08
    fmt.dateFormat = @"yyyy-MM-dd";
    
    // 把日期字符串显示到生日文本框
    self.textField.text = [fmt stringFromDate:datepicker.date];
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSString *str = [self setupDateFormat];
//    self.textFeildBegin(str);
    self.textField.text = str;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSString *str = [self setupDateFormat];
    self.textFeildBegin(str);
    
}

// 设定日期格式
- (NSString *)setupDateFormat {
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *str = [fmt stringFromDate:self.datepicker.date];
    return str;
}

@end
