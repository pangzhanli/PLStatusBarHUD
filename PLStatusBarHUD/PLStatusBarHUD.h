//
//  PLStatusBarHUD.h
//  PLStatusBarHUD
//
//  Created by tusm on 16/2/17.
//  Copyright © 2016年 oa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PLStatusBarHUD : NSObject

+(void)showMessage:(NSString *)msg image:(UIImage *)image;
+(void)showSuccess:(NSString *)msg;
+(void)showError:(NSString *)msg;
+(void)showLoading:(NSString *)msg;
+(void)showMessage:(NSString *)msg;

+(void)hide;

@end
