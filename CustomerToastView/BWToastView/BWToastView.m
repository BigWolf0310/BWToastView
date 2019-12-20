//
//  BWToastView.m
//  CustomerToastView
//
//  Created by syt on 2019/12/19.
//  Copyright © 2019 syt. All rights reserved.
//

#import "BWToastView.h"
#import "Masonry.h"

@interface BWToastView ()

@property (nonatomic, strong) UIImageView *tipImgView;
@property (nonatomic, strong) UILabel *tipLabel;
/**
 添加定时器
 */
@property (nonatomic, strong) NSTimer *timer;
/**
 判断是否是纯文本的提示(默认是NO)
 */
@property (nonatomic, assign) BOOL isPlainText;

@end

@implementation BWToastView

- (instancetype)initWithFrame:(CGRect)frame isPlainText:(BOOL)isPlainText
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imgName = @"tip";
        self.toastString = @"有什么要提示的么？有什么问题么？";
        self.isPlainText = isPlainText;
//        self.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:.1];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5f target:self selector:@selector(removeTimer) userInfo:nil repeats:NO];
        [self loadSubViews];
    }
    return self;
}

- (void)loadSubViews
{
    if (self.isPlainText) {
        [self addSubview:self.tipLabel];
    } else {
        [self addSubview:self.tipImgView];
        [self addSubview:self.tipLabel];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.isPlainText) {
        [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-10);
            make.center.equalTo(self);
        }];
    } else {
        [self.tipImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self).offset(-50);
            make.centerX.equalTo(self);
        }];
        [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tipImgView.mas_bottom).offset(10);
            make.left.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-10);
        }];
    }
}










#pragma mark - setter方法
- (void)setImgName:(NSString *)imgName
{
    _imgName = imgName;
    self.tipImgView.image = [UIImage imageNamed:imgName];
}

- (void)setToastString:(NSString *)toastString
{
    _toastString = toastString;
    self.tipLabel.text = [NSString stringWithFormat:@"%@", toastString];
}


#pragma mark - timer
- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
    [self removeFromSuperview];
}









#pragma mark - lazy loading

- (UIImageView *)tipImgView
{
    if (!_tipImgView) {
        _tipImgView = [[UIImageView alloc] init];
        _tipImgView.image = [UIImage imageNamed:self.imgName];
        _tipImgView.layer.masksToBounds = YES;
    }
    return _tipImgView;
}

- (UILabel *)tipLabel
{
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] init];
        _tipLabel.text = self.toastString;
        _tipLabel.textColor = UIColor.redColor;
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        _tipLabel.numberOfLines = 0;
        _tipLabel.font = [UIFont systemFontOfSize:18];
    }
    return _tipLabel;
}





@end
