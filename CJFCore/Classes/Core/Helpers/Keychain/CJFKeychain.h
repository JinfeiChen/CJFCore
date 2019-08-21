//
//  CJFKeychain.h
//  caricature
//
//  Created by cjf on 2019/8/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJFKeychain : NSObject

+ (void)save:(NSString *)key data:(id)data; //增
+ (void)delete:(NSString *)key;             //删
+ (id)load:(NSString *)key;                 //查

@end

NS_ASSUME_NONNULL_END
