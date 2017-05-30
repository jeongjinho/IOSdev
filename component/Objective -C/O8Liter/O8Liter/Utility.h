//
//  Utility.h
//  O8Liter
//
//  Created by 진호놀이터 on 2017. 1. 1..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Utility : NSObject
+ (UIImage *)resizingImageSize:(UIImage *)image;
+ (UIColor *)colorToPointForImage:(UIImage *)image point:(CGPoint)point;

+ (void)hideTabBar:(UIViewController *)vc;
+ (void)showTabBar:(UIViewController *)vc;

+ (NSString *)koreaTimefomattingForCurrentDate;
@end
