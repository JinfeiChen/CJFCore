//
//  CJFShareManager.m
//  caricature
//
//  Created by cjf on 2019/6/17.
//  Copyright © 2019 comic. All rights reserved.
//

#import "CJFShareManager.h"

#import <UIKit/UIKit.h>
#import <Social/Social.h>

@implementation CJFShareManager

+ (void)share:(NSArray *)items target:(id)target success:(SucceessBlock)successBlock
{
    if (items.count == 0 || target == nil) {
        return;
    }
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];
    
    //去除一些不需要的图标选项
    //    excludedActivityTypes 的 可选项：
    //    UIActivityTypePostToFacebook,
    //    UIActivityTypePostToTwitter,
    //    UIActivityTypePostToWeibo,
    //    UIActivityTypeMessage,
    //    UIActivityTypeMail,
    //    UIActivityTypePrint,
    //    UIActivityTypeCopyToPasteboard,
    //    UIActivityTypeAssignToContact,
    //    UIActivityTypeSaveToCameraRoll,
    //    UIActivityTypeAddToReadingList,
    //    UIActivityTypePostToFlickr,
    //    UIActivityTypePostToVimeo,
    //    UIActivityTypePostToTencentWeibo,
    //    UIActivityTypeAirDrop,
    //    UIActivityTypeOpenInIBooks
    if (@available(iOS 11.0, *)) {//UIActivityTypeMarkupAsPDF是在iOS 11.0 之后才有的
        activityVC.excludedActivityTypes = @[UIActivityTypeMessage,UIActivityTypeMail,UIActivityTypeOpenInIBooks,UIActivityTypeMarkupAsPDF];
    }
    else if (@available(iOS 9.0, *)) {//UIActivityTypeOpenInIBooks是在iOS 9.0 之后才有的
        activityVC.excludedActivityTypes = @[UIActivityTypeMessage,UIActivityTypeMail,UIActivityTypeOpenInIBooks];
    }
    else {
        activityVC.excludedActivityTypes = @[UIActivityTypeMessage,UIActivityTypeMail];
    }
    
    activityVC.completionWithItemsHandler = ^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
        
        if (completed) {
            NSLog(@">>>>>success");
            if (successBlock) {
                successBlock(YES, @"");
            }
        }
        else {
            NSLog(@">>>>>fail");
            if (successBlock) {
                successBlock(NO, @"");
            }
        }
    };
    
    //这儿一定要做iPhone与iPad的判断，因为这儿只有iPhone可以present，iPad需pop，
    //所以这儿actVC.popoverPresentationController.sourceView = self.view;
    //在iPad下必须有，不然iPad会crash，self.view你可以换成任何view，你可以理解为弹出的窗需要找个依托。
    UIViewController *vc = target;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        activityVC.popoverPresentationController.sourceView = vc.view;
        [vc presentViewController:activityVC animated:YES completion:nil];
    }
    else {
        [vc presentViewController:activityVC animated:YES completion:nil];
    }
}

+ (void)share:(NSArray *)items target:(id)target sourceView:(UIView *)sourceView success:(SucceessBlock)successBlock
{
    if (items.count == 0 || target == nil) {
        return;
    }
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];
    
    //去除一些不需要的图标选项
    //    excludedActivityTypes 的 可选项：
    //    UIActivityTypePostToFacebook,
    //    UIActivityTypePostToTwitter,
    //    UIActivityTypePostToWeibo,
    //    UIActivityTypeMessage,
    //    UIActivityTypeMail,
    //    UIActivityTypePrint,
    //    UIActivityTypeCopyToPasteboard,
    //    UIActivityTypeAssignToContact,
    //    UIActivityTypeSaveToCameraRoll,
    //    UIActivityTypeAddToReadingList,
    //    UIActivityTypePostToFlickr,
    //    UIActivityTypePostToVimeo,
    //    UIActivityTypePostToTencentWeibo,
    //    UIActivityTypeAirDrop,
    //    UIActivityTypeOpenInIBooks
    if (@available(iOS 11.0, *)) {//UIActivityTypeMarkupAsPDF是在iOS 11.0 之后才有的
        activityVC.excludedActivityTypes = @[UIActivityTypeMessage,UIActivityTypeMail,UIActivityTypeOpenInIBooks,UIActivityTypeMarkupAsPDF];
    }
    else if (@available(iOS 9.0, *)) {//UIActivityTypeOpenInIBooks是在iOS 9.0 之后才有的
        activityVC.excludedActivityTypes = @[UIActivityTypeMessage,UIActivityTypeMail,UIActivityTypeOpenInIBooks];
    }
    else {
        activityVC.excludedActivityTypes = @[UIActivityTypeMessage,UIActivityTypeMail];
    }
    
    activityVC.completionWithItemsHandler = ^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
        
        if (completed) {
            NSLog(@">>>>>success");
            if (successBlock) {
                successBlock(YES, @"");
            }
        }
        else {
            NSLog(@">>>>>fail");
            if (successBlock) {
                successBlock(NO, @"");
            }
        }
    };
    
    //这儿一定要做iPhone与iPad的判断，因为这儿只有iPhone可以present，iPad需pop，
    //所以这儿actVC.popoverPresentationController.sourceView = self.view;
    //在iPad下必须有，不然iPad会crash，self.view你可以换成任何view，你可以理解为弹出的窗需要找个依托。
    UIViewController *vc = target;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        activityVC.popoverPresentationController.sourceView = sourceView;
        [vc presentViewController:activityVC animated:YES completion:nil];
    }
    else {
        [vc presentViewController:activityVC animated:YES completion:nil];
    }
}

@end
