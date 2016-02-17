//
//  ViewController.m
//  PLStatusBarHUD
//
//  Created by tusm on 16/2/17.
//  Copyright © 2016年 oa. All rights reserved.
//

#import "ViewController.h"
#import "PLStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)success {
    [PLStatusBarHUD showSuccess:@"成功了"];
}
- (IBAction)error {
    [PLStatusBarHUD showError:@"失败了"];
}
- (IBAction)loading {
    [PLStatusBarHUD showLoading:@"正在加载中..."];
}
- (IBAction)hide {
    [PLStatusBarHUD hide];
}
- (IBAction)showMessage {
    [PLStatusBarHUD showMessage:@"这是信息"];
}

@end
