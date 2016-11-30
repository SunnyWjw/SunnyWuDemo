//
//  SwCollectionHeaderView.m
//  SunnyWuDemo
//
//  Created by SunnyWu on 2016/10/28.
//  Copyright © 2016年 SunnyWu. All rights reserved.
//

#import "SwCollectionHeaderView.h"

@implementation SwCollectionHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.ImageWidth.constant = CGRectGetWidth([UIScreen mainScreen].bounds) *4;
}

@end
