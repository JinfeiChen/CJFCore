//
//  CJFAppLifeCycleMediator.h
//  caricature
//
//  Created by cjf on 2019/6/17.
//  Copyright © 2019 comic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 全局模块化中介管理器
 */
@interface CJFAppLifeCycleMediator : NSObject

///定义好静态类方法，初始化所有监听者
+ (instancetype)makeDefaultMediator; 

@end

NS_ASSUME_NONNULL_END
