//
//  SWDBDataBase.h
//  SunnyWuDemo
//
//  Created by SunnyWu on 2016/11/2.
//  Copyright © 2016年 SunnyWu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface SWDBDataBase : NSObject

@property (nonatomic, retain, readonly) FMDatabaseQueue *dbQueue;

+ (SWDBDataBase *)shareInstance;

+ (NSString *)dbPath;

@end
