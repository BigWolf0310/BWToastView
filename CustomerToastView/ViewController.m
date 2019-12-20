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

@property (nonatomic, strong) BWToastView *toastView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    self.toastView = [[BWToastView alloc] initWithFrame:self.view.bounds isPlainText:NO];
    self.toastView.imgName = @"tip";
//    self.toastView.toastString = @"我在测试要显示的toast内容";
    [[UIApplication sharedApplication].keyWindow addSubview:self.toastView];
}












@end
