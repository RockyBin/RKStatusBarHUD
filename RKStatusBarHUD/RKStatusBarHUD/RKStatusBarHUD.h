//
//  RKStatusBarHUD.h
//  RKStatusBarHUD
//
//  Created by rock on 17/5/25.
//  Copyright © 2017年 rock. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RKStatusBarHUD : NSObject

/**
 *  显示成功信息
 */
+ (void)showSucess:(NSString *)message;

/**
 *  显示失败
 */
+ (void)showError:(NSString *)message;

/**
 *  显示信息
 */
+ (void)showMessage:(NSString *)message image:(UIImage *)image;


/**
 *  显示普通信息
 */
+ (void)showMessage:(NSString *)message;

/**
 *  正在加载
 */
+ (void)loading:(NSString *)message;

/**
 *  隐藏
 */
+ (void)hide;

@end
