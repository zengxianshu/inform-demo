//
//  ViewController.m
//  demo
//
//  Created by 曾宪书 on 15/4/17.
//  Copyright (c) 2015年 名兵团. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(action:) name:@"123" object:nil];
    
    NSString *str=@"1234567";
    
    NSDictionary *dic=[[NSDictionary alloc]initWithObjectsAndKeys:str,@"and", nil];
    //发送通知
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"123"
     object:self userInfo:dic];
    // Do any additional setup after loading the view, typically from a nib.
}



-(void)action:(NSNotification *)notification
{
    NSLog(@"%@",notification.userInfo);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
