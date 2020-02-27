//
//  BWToastView.h
//  CustomerToastView
//
//  Created by syt on 2019/12/19.
//  Copyright © 2019 syt. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWToastView : UIView

/**
 toast要提示的图片
 */
@property (nonatomic, strong) NSString *imgName;
/**
 toast要提示的文本内容
 */
@property (nonatomic, strong) NSString *toastString;
/**
 初始化方法
 isPlainText bool值，判断是否是纯文本，如果是YES，只显示文字，没有图片；如果是NO，文字和图片同时显示
 */
- (instancetype)initWithFrame:(CGRect)frame isPlainText:(BOOL)isPlainText;

- (void)show;


@end

NS_ASSUME_NONNULL_END
