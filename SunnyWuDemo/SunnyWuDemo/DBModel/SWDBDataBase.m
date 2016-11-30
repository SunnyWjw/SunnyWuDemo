//
//  SWDBDataBase.m
//  SunnyWuDemo
//
//  Created by SunnyWu on 2016/11/2.
//  Copyright © 2016年 SunnyWu. All rights reserved.
//

#import "SWDBDataBase.h"

@interface SWDBDataBase ()

@property (nonatomic, retain) FMDatabaseQueue *dbQueue;

@end


@implementation SWDBDataBase

static SWDBDataBase *_instance = nil;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    
    return _instance;
}

+ (NSString *)dbPath
{
//    NSString *docsdir = [NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    NSFileManager *filemanage = [NSFileManager defaultManager];
//    docsdir = [docsdir stringByAppendingPathComponent:@"JKBD"];
//    BOOL isDir;
//    BOOL exit =[filemanage fileExistsAtPath:docsdir isDirectory:&isDir];
//    if (!exit || !isDir) {
//        [filemanage createDirectoryAtPath:docsdir withIntermediateDirectories:YES attributes:nil error:nil];
//    }
//    NSString *dbpath = [docsdir stringByAppendingPathComponent:@"jkdb.sqlite"];
      NSString *dbpath = [[NSBundle mainBundle]pathForResource:@"numberaddress" ofType:@"db"];
    return dbpath;
}

- (FMDatabaseQueue *)dbQueue
{
    if (_dbQueue == nil) {
        _dbQueue = [[FMDatabaseQueue alloc] initWithPath:[self.class dbPath]];
    }
    return _dbQueue;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [SWDBDataBase shareInstance];
}

- (id)copyWithZone:(struct _NSZone *)zone
{
    return [SWDBDataBase shareInstance];
}

#if ! __has_feature(objc_arc)
- (oneway void)release
{
    
}

- (id)autorelease
{
    return _instance;
}

- (NSUInteger)retainCount
{
    return 1;
}
#endif


@end
