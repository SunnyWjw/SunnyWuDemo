//
//  SwCollectionHeaderView.h
//  SunnyWuDemo
//
//  Created by SunnyWu on 2016/10/28.
//  Copyright © 2016年 SunnyWu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwCollectionHeaderView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UIScrollView *SwHeaderScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *SwHeaderImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ImageWidth;

@end
