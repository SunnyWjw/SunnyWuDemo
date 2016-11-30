//
//  SwRewriteCollectionViewLayout.h
//  SunnyWuDemo
//
//  Created by SunnyWu on 2016/10/26.
//  Copyright © 2016年 SunnyWu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  CGFloat(^SwItemHeightBlock)(NSIndexPath* index);

@interface SwRewriteCollectionViewLayout : UICollectionViewLayout

@property(nonatomic,strong )SwItemHeightBlock heightBlock ;

-(instancetype)initWithItemsHeightBlock:(SwItemHeightBlock)block;

@end
