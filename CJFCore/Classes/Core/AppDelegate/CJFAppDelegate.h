//
//  CJFAppDelegate.h
//  caricature
//
//  Created by cjf on 2019/8/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 自定义全局应用代理
 使用方法：
 直接替换工程main.m文件中的代码：
 UIApplicationMain(argc, argv, nil, @"CJFAppDelegate");
 */
@interface CJFAppDelegate : UIResponder <UIApplicationDelegate>
    
@property (strong, nonatomic) UIWindow *window;

@end

NS_ASSUME_NONNULL_END
