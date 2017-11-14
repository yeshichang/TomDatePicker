![(logo)](http://www.yeshichang.cn/images/works/logo.png)
# TomDatePicker
A small date selection

# Contents
A very simple call system datePicker gadget and support cocoaPods

# Examples
- (void)viewDidLoad {
    [super viewDidLoad];
    __weak ViewController *weakSelf = self;
    [[DateKeyboardManager sharedManager] dateKeyboard:self.myTextField isFromNow:NO textFeildBegin:^(NSString *DateString) {
        weakSelf.myTextField.text = DateString;
    }];
}
