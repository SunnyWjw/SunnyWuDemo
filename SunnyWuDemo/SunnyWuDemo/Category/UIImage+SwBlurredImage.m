//
//  UIImage+SwBlurredImage.m
//  SunnyWuDemo
//
//  Created by SunnyWu on 2016/10/24.
//  Copyright © 2016年 SunnyWu. All rights reserved.
//

#import "UIImage+SwBlurredImage.h"
#import "UIImage+ImageEffects.h"


CGFloat const WJWBlurredImageDefaultBlurRadius            = 20.0;
CGFloat const WJWBlurredImageDefaultSaturationDeltaFactor = 2.0;

@implementation UIImageView (SwBlurredImage)

#pragma mark - LBBlurredImage Additions

- (void)setImageToBlur:(UIImage *)image
       completionBlock:(WJWlurredImageCompletionBlock)completion
{
    [self setImageToBlur:image
              blurRadius:WJWBlurredImageDefaultBlurRadius
         completionBlock:completion];
}

- (void)setImageToBlur:(UIImage *)image
            blurRadius:(CGFloat)blurRadius
       completionBlock:(WJWlurredImageCompletionBlock)completion
{
    NSParameterAssert(image);
    blurRadius = (blurRadius <= 0) ? WJWBlurredImageDefaultBlurRadius : blurRadius;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIImage *blurredImage = [image applyBlurWithRadius:blurRadius
                                                 tintColor:nil
                                     saturationDeltaFactor:WJWBlurredImageDefaultSaturationDeltaFactor
                                                 maskImage:nil];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = blurredImage;
            if (completion) {
                completion();
            }
        });
    });
}

@end
