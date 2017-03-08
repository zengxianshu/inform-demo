//
//  DetilViewController.m
//  demo
//
//  Created by 曾墨 on 15/4/17.
//  Copyright (c) 2015年 . All rights reserved.
//

#import "DetilViewController.h"


extern NSString *changValue;
@interface DetilViewController ()

@end

@implementation DetilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *str=@"1234567";
    
    NSLog(@"detilVC中输出 => %@",str);
    
    NSLog(@"detilVC中输出changValue => %@",changValue);
    
//    NSDictionary *dic=[[NSDictionary alloc]initWithObjectsAndKeys:str,@"and", nil];
    NSDictionary *dic=@{@"and":str};
    //发送通知
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"123"
     object:self userInfo:dic];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [button setTitle:@"返回"forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dissVC) forControlEvents:UIControlEventTouchUpInside];

}

-(void)dissVC{
    [self dismissViewControllerAnimated:YES completion:nil];
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
