//
//  CJFShareManager.h
//  caricature
//
//  Created by cjf on 2019/6/17.
//  Copyright © 2019 comic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SucceessBlock)(BOOL result, id responseObject);

@interface CJFShareManager : NSObject

/**
 *  iOS原生分享
 *  多图分享，items里面直接放图片
 *  分享链接
 *  NSString *textToShare = @"mq分享";
 *  UIImage *imageToShare = [UIImage imageNamed:@"imageName"];
 *  NSURL *urlToShare = [NSURL URLWithString:@"https://www.baidu.com"];
 *  NSArray *items = @[urlToShare,textToShare,imageToShare];
 */
+ (void)share:(NSArray *)items target:(id)target success:(SucceessBlock)successBlock;

+ (void)share:(NSArray *)items target:(id)target sourceView:(UIView *)sourceView success:(SucceessBlock)successBlock;

@end

NS_ASSUME_NONNULL_END
