//
//  FirstViewController.m
//  SunnyWuDemo
//
//  Created by SunnyWu on 2016/10/24.
//  Copyright © 2016年 SunnyWu. All rights reserved.
//

#import "FirstViewController.h"
#import "SWTableViewController.h"
#import "SwCheckLauchImage.h"

@interface FirstViewController ()


@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"First";
    
    [SwCheckLauchImage checkLanuchImage:3 isShowAd:true ignore:false];
    //换成你自己的图片网址
    [SwCheckLauchImage downLauchImageUrl:@"http://i1.shouyou.itc.cn/2014/news/2014/10/24/1334x750bz1025_14.jpg" update:true];
    
    [self CreateImageView];
}

-(void)CreateImageView{
    
    NSLog(@"ababab");
 
    [self.imageView setImageToBlur:[UIImage imageNamed:@"image1"]
                        blurRadius:WJWBlurredImageDefaultBlurRadius
                   completionBlock:^(){
                       NSLog(@"The blurred image has been set");
                   }];
    
    UIImage *iconImage = [UIImage imageWithIconName:@"image3" borderImage:@"image6" border:40];
    self.HeaderImag.image = iconImage;
    
    [self.SureButton addTarget:self action:@selector(pushNewController) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)pushNewController{

    SWTableViewController *swtableVC = [[SWTableViewController alloc]init];
    swtableVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:swtableVC animated:YES];

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
