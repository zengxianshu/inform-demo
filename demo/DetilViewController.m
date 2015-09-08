//
//  DetilViewController.m
//  demo
//
//  Created by 曾宪书 on 15/9/8.
//  Copyright (c) 2015年 名兵团. All rights reserved.
//

#import "DetilViewController.h"

@interface DetilViewController ()

@end

@implementation DetilViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *str=@"1234567";
    
    NSLog(@"detilVC => %@",str);
    
    NSDictionary *dic=[[NSDictionary alloc]initWithObjectsAndKeys:str,@"and", nil];
    //发送通知
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"123"
     object:self userInfo:dic];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
