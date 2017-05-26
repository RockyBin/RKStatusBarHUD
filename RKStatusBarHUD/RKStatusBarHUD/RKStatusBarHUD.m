//
//  RKStatusBarHUD.m
//  RKStatusBarHUD
//
//  Created by rock on 17/5/25.
//  Copyright © 2017年 rock. All rights reserved.
//

#import "RKStatusBarHUD.h"

static UIWindow *window_;
static NSTimer *timer_;

#define RKScreenW [UIScreen mainScreen].bounds.size.width
#define RKStatusBarFont [UIFont systemFontOfSize:12]
#define RKButtonInset UIEdgeInsetsMake(0, 10, 0, 0)

CGFloat const RKStatusBarHeight = 20;
CGFloat const RKStatuBarDelay = 2.0;
CGFloat const RKAnimationDelay = 0.25;

@implementation RKStatusBarHUD

+ (void)show{
    //fame
    CGRect frame = CGRectMake(0, - RKStatusBarHeight, RKScreenW, RKStatusBarHeight);
    
    window_ = [[UIWindow alloc] init];
    
    window_.hidden = YES;
    
    window_.frame = frame;
    
    window_.windowLevel = UIWindowLevelAlert;
    
    window_.hidden = NO;
    
    //动画
    frame.origin.y = 0;
    [UIView animateWithDuration:RKAnimationDelay animations:^{
        window_.frame = frame;
    }];
    
}

/**
 *  显示成功信息
 */
+ (void)showSucess:(NSString *)message{
    
    [self showMessage:@"显示成功" image:[UIImage imageNamed:@"RKStatusBarHUD.bundle/success"]];
}

/**
 *  显示失败
 */
+ (void)showError:(NSString *)message{
    [self showMessage:@"显示失败" image:[UIImage imageNamed:@"RKStatusBarHUD.bundle/error"]];
}

/**
 *  显示普通信息
 */
+ (void)showMessage:(NSString *)message{
    [self showMessage:message image:nil];
}

/**
 *  显示信息
 */
+ (void)showMessage:(NSString *)message image:(UIImage *)image{

    //停止定时器
    [timer_ invalidate];
    
    
    //显示窗口
    [self show];
    
    //添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:message forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = RKStatusBarFont;
    button.frame = window_.bounds;
    
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    
    //设置安钮内部标题内边距
    button.titleEdgeInsets = RKButtonInset;
    
    [window_ addSubview:button];
    
    //定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:RKStatuBarDelay target:self selector:@selector(hide) userInfo:nil repeats:nil];
    
}

/**
 *  正在加载
 */
+ (void)loading:(NSString *)message{
    
    //停止定时器
    [timer_ invalidate];
    //清空定时器
    timer_ = nil;
    
    //显示窗口
    [self show];
    
    //添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:message forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = RKStatusBarFont;
    button.frame = window_.bounds;
    
    [window_ addSubview:button];
    
    //添加转菊花
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] init];
    
    activity.frame = CGRectMake(0, 0, RKStatusBarHeight, RKStatusBarHeight);
    
    [activity startAnimating];
    
    //计算文字宽度
    CGFloat textW = [message sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12]}].width;
    CGFloat centerX = (window_.frame.size.width - textW) * 0.5 - RKStatusBarHeight;
    CGFloat centerY = window_.frame.size.height * 0.5;
    
    activity.center = CGPointMake(centerX, centerY);
    
    [window_ addSubview:activity];
}


/**
 *  隐藏
 */
+ (void)hide{
    //清空窗口
    window_ = nil;
    //清空定时器
    timer_ = nil;
}

@end
