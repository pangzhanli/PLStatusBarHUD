//
//  PLStatusBarHUD.m
//  PLStatusBarHUD
//
//  Created by tusm on 16/2/17.
//  Copyright © 2016年 oa. All rights reserved.
//

#import "PLStatusBarHUD.h"

//定时器的持续时间
static CGFloat const XMGMessageDuration = 2.0;
//动画执行的时间
static CGFloat const XMGAnimationDuration = 0.25;

@implementation PLStatusBarHUD

/** 全局窗口 */
static UIWindow *window_;
/** 定时器 */
static NSTimer *timer_;

/** 显示窗口 */
+(void)showWindow{
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    //向将原先的隐藏
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.frame = frame;
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        window_.frame = frame;
    }];
}


+(void)showMessage:(NSString *)msg image:(UIImage *)image{
    //显示窗口
    [self showWindow];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:12]];
    //如果有图片
    if(image){
        [button setImage:image forState:UIControlStateNormal];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    [timer_ invalidate];
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:XMGMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:nil];
    
}
+(void)showSuccess:(NSString *)msg{
    [self showMessage:msg image:[UIImage imageNamed:@"PLStatusBarHUD.bundle/success"]];
}
+(void)showError:(NSString *)msg{
    [self showMessage:msg image:[UIImage imageNamed:@"PLStatusBarHUD.bundle/error"]];
}
+(void)showLoading:(NSString *)msg{
    //将原先的定时器置为无效
    [timer_ invalidate];
    timer_ = nil;
    
    //显示窗口
    [self showWindow];
    
    //添加文字
    UILabel *label = [[UILabel alloc] init];
    label.text = msg;
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = window_.bounds;
    [window_ addSubview:label];
    
    //添加圈圈
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    //文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]}].width;
    
    CGFloat centerX = (window_.bounds.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.bounds.size.height * 0.5;
    activityView.center = CGPointMake(centerX, centerY);
    
    [window_ addSubview:activityView];
    [activityView startAnimating];
    
}
+(void)showMessage:(NSString *)msg{
    [self showMessage:msg image:nil];
}

+(void)hide{
    
    CGRect frame = window_.frame;
    frame.origin.y = -frame.size.height;
    
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
    
}

@end
