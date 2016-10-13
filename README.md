# TomDatePicker
A small date selection

# Contents
A very simple call system datePicker gadget

# Examples
// viewDidLoad function
- (void)viewDidLoad {\n
    [super viewDidLoad];\n

    // Do any additional setup after loading the view, typically from a nib.\n
    __weak ViewController *weakSelf = self;\n
    [[DateKeyboardManager sharedManager] dateKeyboard:self.myTextField isFromNow:NO textFeildBegin:^(NSString *DateString) {\n
        weakSelf.myTextField.text = DateString;\n
    }];\n
}
