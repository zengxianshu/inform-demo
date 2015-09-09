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

-(void)NotifyInNative{
    // 创建一个本地推送
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    //设置10秒之后
    NSDate *pushDate = [NSDate dateWithTimeIntervalSinceNow:10];
    if (notification != nil) {
        // 设置推送时间
        notification.fireDate = pushDate;
        // 设置时区
        notification.timeZone = [NSTimeZone defaultTimeZone];
        // 设置重复间隔
        notification.repeatInterval = kCFCalendarUnitDay;
        // 推送声音
        notification.soundName = UILocalNotificationDefaultSoundName;
        // 推送内容
        notification.alertBody = @"o.o";
        //显示在icon上的红色圈中的数子
        notification.applicationIconBadgeNumber = 1;
        //设置userinfo 方便在之后需要撤销的时候使用
        NSDictionary *info = [NSDictionary dictionaryWithObject:@"name"forKey:@"key"];
        notification.userInfo = info;
        //添加推送到UIApplication
        UIApplication *app = [UIApplication sharedApplication];
        [app scheduleLocalNotification:notification];
        
    }
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
