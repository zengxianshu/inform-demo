//
//  ViewController.h
//  demo
//
//  Created by 曾宪书 on 15/4/17.
//  Copyright (c) 2015年 名兵团. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

/// 设置本地通知
+ (void)registerLocalNotification:(NSInteger)alertTime ;
/// 取消某个本地推送通知
+ (void)cancelLocalNotificationWithKey:(NSString *)key ;
@end

