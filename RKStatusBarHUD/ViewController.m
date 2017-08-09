//
//  ViewController.m
//  RKStatusBarHUD
//
//  Created by rock on 17/5/25.
//  Copyright © 2017年 rock. All rights reserved.
//

#import "ViewController.h"
#import "RKStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [RKStatusBarHUD showSucess:@"显示成功!"]; 
}

- (IBAction)success:(id)sender {
    [RKStatusBarHUD showSucess:@"显示成功!"];
}

- (IBAction)error:(id)sender {
    [RKStatusBarHUD showError:@"显示失败!"];
}

- (IBAction)normal:(id)sender {
    [RKStatusBarHUD showMessage:@"显示普通信息"];
}

- (IBAction)hide:(id)sender {
    [RKStatusBarHUD hide];
}
- (IBAction)loading:(id)sender {
    [RKStatusBarHUD loading:@"正在加载中..."];
}
@end
