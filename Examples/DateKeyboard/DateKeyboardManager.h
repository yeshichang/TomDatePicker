//
//  DateKeyboardManager.h
//  TravelAppeal
//
//  Created by mac on 16/3/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DateKeyboardManager : NSObject

@property (nonatomic,strong) UITextField *textField;

+ (DateKeyboardManager *)sharedManager;

/**
 *  自定义键盘输入框
 *
 *  @param textField textField
 *  @param fromNow   是否从现在开始
 *  @param block     block
 */
- (void)dateKeyboard:(UITextField *)textField isFromNow:(BOOL)fromNow textFeildBegin:(void(^)(NSString *DateString))block;


@end
