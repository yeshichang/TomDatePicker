//
//  ViewController.m
//  Examples
//
//  Created by mac on 16/10/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "DateKeyboardManager.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *myTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    __weak ViewController *weakSelf = self;
    [[DateKeyboardManager sharedManager] dateKeyboard:self.myTextField isFromNow:NO textFeildBegin:^(NSString *DateString) {
        weakSelf.myTextField.text = DateString;
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
