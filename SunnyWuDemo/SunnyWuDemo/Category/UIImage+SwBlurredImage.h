//
//  UIImage+SwBlurredImage.h
//  SunnyWuDemo
//
//  Created by SunnyWu on 2016/10/24.
//  Copyright © 2016年 SunnyWu. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^WJWlurredImageCompletionBlock)(void);

extern CGFloat const WJWBlurredImageDefaultBlurRadius;

@interface UIImageView (SwBlurredImage)

/**
 Set the blurred version of the provided image to the UIImageView

 @param image      the image to blur and set as UIImageView's image
 @param blurRadius the radius of the blur used by the Gaussian filter
 @param completion a completion block called after the image
 */
- (void)setImageToBlur:(UIImage *)image
            blurRadius:(CGFloat)blurRadius
       completionBlock:(WJWlurredImageCompletionBlock)completion;

/**
 Set the blurred version of the provided image to the UIImageView
 with the default blur radius

 @param image      the image to blur and set as UIImageView's image
 @param completion a completion block called after the image
 was blurred and set to the UIImageView (the block is dispatched on main thread)
 */
- (void)setImageToBlur:(UIImage *)image
       completionBlock:(WJWlurredImageCompletionBlock)completion;

@end
