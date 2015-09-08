//
//  ViewController.m
//  demo
//
//  Created by 曾宪书 on 15/4/17.
//  Copyright (c) 2015年 名兵团. All rights reserved.
//

#import "ViewController.h"
#import "DetilViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(action:) name:@"123" object:nil];
    
    
    DetilViewController *vc = [[DetilViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
    // Do any additional setup after loading the view, typically from a nib.
}


// 接收到通知处理
-(void)action:(NSNotification *)notification
{
    NSLog(@"VC => %@",notification.userInfo);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
