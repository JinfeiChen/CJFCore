//
//  CJFAppLifeCycleMediator.m
//  caricature
//
//  Created by cjf on 2019/6/17.
//  Copyright © 2019 comic. All rights reserved.
//

#import "CJFAppLifeCycleMediator.h"

#import "CJFAppLifeCycleListener.h"

@implementation CJFAppLifeCycleMediator {
    @private
    NSArray<id<CJFAppLifeCycleListener>> * _listeners;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithListeners:(NSArray<id<CJFAppLifeCycleListener>> *)listeners
{
    if (self = [super init]) {
        _listeners = listeners;
        // 监听应用的各种生命周期事件
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onAppWillEnterForeground)
                                                     name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onAppDidEnterBackgroud)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onAppDidFinishLaunching)
                                                     name:UIApplicationDidFinishLaunchingNotification
                                                   object:nil];
    }
    return self;
}


+ (instancetype)makeDefaultMediator
{
    static CJFAppLifeCycleMediator * mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // MARK: 此处注意各监听器的顺序
        NSArray *defListeners = [NSArray arrayWithObjects:
                                 [NSClassFromString(@"CJFAppListener") new],
                                 [NSClassFromString(@"CJFLauchListener") new],
                                 [NSClassFromString(@"CJFRouteListener") new],
                                 [NSClassFromString(@"CJFNotificationListener") new],
                                 nil];
        mediator = [[CJFAppLifeCycleMediator alloc] initWithListeners:defListeners];
    });
    return mediator;
}

- (void)onAppWillEnterForeground
{
    NSLog(@"%s", __FUNCTION__);
    [_listeners enumerateObjectsUsingBlock:^(id<CJFAppLifeCycleListener>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj respondsToSelector:@selector(onAppWillEnterForeground)]) {
            [obj onAppWillEnterForeground];
        }
    }];
}

- (void)onAppDidEnterBackgroud
{
    NSLog(@"%s", __FUNCTION__);
    [_listeners enumerateObjectsUsingBlock:^(id<CJFAppLifeCycleListener>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj respondsToSelector:@selector(onAppDidEnterBackgroud)]) {
            [obj onAppDidEnterBackgroud];
        }
    }];
}

- (void)onAppDidFinishLaunching
{
    NSLog(@"%s", __FUNCTION__);
    [_listeners enumerateObjectsUsingBlock:^(id<CJFAppLifeCycleListener>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj respondsToSelector:@selector(onAppDidFinishLaunching)]) {
            [obj onAppDidFinishLaunching];
        }
    }];
}


@end
