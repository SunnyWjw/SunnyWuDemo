//
//  ThreeViewController.m
//  SunnyWuDemo
//
//  Created by SunnyWu on 2016/10/24.
//  Copyright © 2016年 SunnyWu. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Three";
    
    NSLog(@"floatValue:%f",[[UIDevice currentDevice].systemVersion floatValue] );
    NSLog(@"doubleValue:%f",[[UIDevice currentDevice].systemVersion doubleValue] );
    
    NSUInteger suc = 1;
    NSUInteger nums = suc *2/10;
    NSLog(@"nums == %lu",(unsigned long)nums);
      NSString * s = [NSString stringWithFormat:@"%.1f",suc * 2.0f / 10.0f];
    NSLog(@"s == %@",s);
    
    
//    NSString* systemVersion = [[UIDevice currentDevice] systemVersion];
//    NSLog(@"systemVersion:%@",systemVersion );
//    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 200, 120, 45)];
//    [self.view addSubview:btn];
//    NSDictionary *attributeDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                                   [UIFont systemFontOfSize:15.0],NSFontAttributeName,
//                                   [UIColor redColor],NSForegroundColorAttributeName,
//                                   NSUnderlineStyleAttributeName,NSUnderlineStyleSingle,nil];
//    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:@"今天天气不错呀" attributes:attributeDict];
//    [btn setAttributedTitle:AttributedStr forState:UIControlStateNormal];
    
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
