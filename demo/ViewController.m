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
// 监听接收到通知处理
-(void)action:(NSNotification *)notification
{
    NSLog(@"VC中输出 => %@",notification.userInfo);
    /* VC中输出 => {
     and = 1234567;
     }
     */
    
}

-(void)preVC{
    DetilViewController *vc = [[DetilViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

// 设置本地通知
+ (void)registerLocalNotification:(NSInteger)alertTime {
    // 应用程序在后台的时候，本地通知会给设备送达一个和远程通知一样的提醒，提醒的样式由用户在手机设置中设置
    // 应用程序正在运行中，则设备不会收到提醒，但是会走应用程序delegate中的方法：
    // 创建一个本地推送
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    //设置10秒之后
    NSDate *pushDate = [NSDate dateWithTimeIntervalSinceNow:alertTime];
    // ios8后，需要添加这个注册，才能得到授权
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationType type =  UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type
                                                                                 categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    } 
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
        notification.alertBody=@"通知内容";
        notification.alertAction = @"打开";  //提示框按钮
        UIApplication *app = [UIApplication sharedApplication];
        //显示在icon上的红色圈中的数子
        notification.applicationIconBadgeNumber = app.applicationIconBadgeNumber+1;
        //设置userinfo 方便在之后需要撤销的时候使用
        NSDictionary *info = [NSDictionary dictionaryWithObject:@"name"forKey:@"key"];
        notification.userInfo = info;
        // 通知重复提示的单位，可以是天、周、月等
        //notification.repeatInterval = NSCalendarUnitDay;
        //添加推送到UIApplication
        [app scheduleLocalNotification:notification];
        //立即触发一个通知
//        [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
    }
}
// 取消某个本地推送通知
+ (void)cancelLocalNotificationWithKey:(NSString *)key {
    // 获取所有本地通知数组
    NSArray *localNotifications = [UIApplication sharedApplication].scheduledLocalNotifications;
    
    for (UILocalNotification *notification in localNotifications) {
        NSDictionary *userInfo = notification.userInfo;
        if (userInfo) {
            // 根据设置通知参数时指定的key来获取通知参数
            NSString *info = userInfo[key];
            
            // 如果找到需要取消的通知，则取消
            if (info != nil) {
                [[UIApplication sharedApplication] cancelLocalNotification:notification];
                break;  
            }  
        }  
    }  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
