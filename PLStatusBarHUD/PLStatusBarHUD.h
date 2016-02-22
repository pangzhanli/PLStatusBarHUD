//
//  PLStatusBarHUD.h
//  PLStatusBarHUD
//
//  Created by tusm on 16/2/17.
//  Copyright © 2016年 oa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PLStatusBarHUD : NSObject

/**
 *  显示带有文字和图片的消息
 *
 *  @param msg      文字
 *  @param image    图片
 *
 */
+(void)showMessage:(NSString *)msg image:(UIImage *)image;

/**
 *  显示成功消息
 *
 *  @param msg      成功消息
 */
+(void)showSuccess:(NSString *)msg;

/**
 *  显示错误消息
 *
 *  @param msg      错误消息
 */
+(void)showError:(NSString *)msg;

/**
 *  显示正在加载信息
 *
 *  @param msg      文字
 */
+(void)showLoading:(NSString *)msg;

/**
 *  显示普通消息
 *
 *  @param msg      文字
 */
+(void)showMessage:(NSString *)msg;


/**
 *  隐藏
 *
 */
+(void)hide;

@end
