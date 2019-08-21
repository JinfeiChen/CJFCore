//
//  CJFAPPMacros.h
//  caricature
//
//  Created by cjf on 2019/8/21.
//

#ifndef CJFAPPMacros_h
#define CJFAPPMacros_h




// MARK: SIZE

#define cScreenWidth [UIScreen mainScreen].bounds.size.width
#define cScreenHeight [UIScreen mainScreen].bounds.size.height
#define cStatusBarHeight (cIsPortrait?((cIsiPhoneX()==YES)?44.f:20.f):0)
#define cNavidationContentHeight 44.f
#define cNavigationBarHeight (cStatusBarHeight + cNavidationContentHeight)
#define cTabbarHeight (cIsiPhoneX()?83.f:49.f)
#define cTabbarHomeKeyHeight (cIsiPhoneX()?34.f:0)

//iOS11的新特性代码,
//注意: 这个必须等应用准备好了才能调用，否则会在[... windows][0]调用时崩溃
#define cIsiPhoneX() ^(){\
if (@available(iOS 11.0, *)) {\
return ([[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0)?1:0;\
} else {\
return 0;\
}\
}()

// 验证是否为竖屏
#define cIsPortrait ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown)

/**< 验证是否为iPhone */
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

/**< 验证是否为iPad */
#define IS_PAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/**< 测试专用 - 打印当前类名和方法名 */
#define METHOD_LOG NSLog(@"[%@ %@]", [self class], NSStringFromSelector(_cmd));

/**< 验证系统版本为iOS8以上 */
#define IOS8_OR_LATER __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0

/**< 通过Key获取本地存储的值 */
#define GetUserDefaultsByKey(KEY) [GDUserDefaults objectForKey:KEY]
/**< 设置本地存储的键值 */
#define SetUserDefaults(OBJ,KEY) [GDUserDefaults setObject:OBJ forKey:KEY]
/**< 删除本地存储的键值 */
#define RemoveUserDefaults(KEY) [GDUserDefaults removeObjectForKey:KEY]

#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t CJF - %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif

/**
 * 弱引用
 * 使用方法：@weakify(self);
 */
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

/**
 * 强引用
 * 使用方法：@strongify(self);
 */
#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif



#endif /* CJFAPPMacros_h */
