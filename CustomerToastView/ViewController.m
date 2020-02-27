//
//  ViewController.m
//  CustomerToastView
//
//  Created by syt on 2019/12/19.
//  Copyright © 2019 syt. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "BWToastView.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) BWToastView *toastView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tipLabel];
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    self.toastView = [[BWToastView alloc] initWithFrame:self.view.bounds isPlainText:NO];
    self.toastView.imgName = @"tip";
    self.toastView.toastString = @"我在测试要显示的toast内容";
    [self.toastView show];
}






- (UILabel *)tipLabel
{
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, [UIScreen mainScreen].bounds.size.width - 100, 30)];
        _tipLabel.text = @"点击页面";
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        _tipLabel.font = [UIFont systemFontOfSize:18];
    }
    return _tipLabel;
}





@end
