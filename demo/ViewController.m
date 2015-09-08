//
//  ViewController.m
//  demo
//
//  Created by 曾宪书 on 15/4/17.
//  Copyright (c) 2015年 名兵团. All rights reserved.
//

#import "ViewController.h"
#import "DetilViewController.h"

NSString *changValue;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(action:) name:@"123" object:nil];
    
    changValue = @"全局变量";
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [button setTitle:@"下一页"forState:UIControlStateNormal];
    [button addTarget:self action:@selector(preVC) forControlEvents:UIControlEventTouchUpInside];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)preVC{
    DetilViewController *vc = [[DetilViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

// 接收到通知处理
-(void)action:(NSNotification *)notification
{
    NSLog(@"VC中输出 => %@",notification.userInfo);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
