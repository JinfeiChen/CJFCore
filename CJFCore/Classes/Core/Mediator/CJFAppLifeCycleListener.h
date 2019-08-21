//
//  CJFAppLifeCycleListener.h
//  caricature
//
//  Created by cjf on 2019/6/17.
//  Copyright © 2019 comic. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 应用生命周期事件监听
 */
@protocol CJFAppLifeCycleListener <NSObject>

@optional
- (void)onAppWillEnterForeground;
- (void)onAppDidEnterBackgroud;
- (void)onAppDidFinishLaunching;

@end

NS_ASSUME_NONNULL_END
