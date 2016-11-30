//
//  UIImage+SwBorderImage.h
//  SunnyWuDemo
//
//  Created by SunnyWu on 2016/10/24.
//  Copyright © 2016年 SunnyWu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SwBorderImage)

/**
 *  @param icon         头像图片名称
 *  @param borderImage  边框的图片名称
 *  @param border       边框大小
 *
 *  @return 圆形的头像图片
 */
+ (instancetype)imageWithIconName:(NSString *)icon borderImage:(NSString *)borderImage border:(int)border;

@end
