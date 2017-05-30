//
//  Utility.m
//  O8Liter
//
//  Created by 진호놀이터 on 2017. 1. 1..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#import "Utility.h"

@implementation Utility


+ (UIColor *)colorToPointForImage:(UIImage *)image point:(CGPoint)point{

   
    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f,image.size.width,image.size.height), point)) {
        return nil;
    }
    //CGBitmap으로구현하기위해선 해당 매개변수를 정해줘야 합니다.
    //먼저  포인트의  x,y를 정수형태로 가져옵니다. 이때 trunc 함수를 써서 소수점을 버려버리는거죠
    NSInteger pointX = trunc(point.x);
    NSInteger pointY = trunc(point.y);
    // coreGraphic에서 이미지를 다룰 수있도록 이미지의 하위레벨에 포인터를 저장 시킵니다.
    CGImageRef cgImage = image.CGImage;
    NSUInteger width = image.size.width;
    NSUInteger height = image.size.height;
    //이미지를 어떤색상공간으로 환경을 설정할거냐면 RGB값으로 저는 설정하겠습니다.
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    // 한픽셀당 바이트를 4로 해줬습니다.
    int bytesPerPixel = 4;
    //저는 한줄만가져올거므로 *1
    int bytesPerRow = bytesPerPixel * 1;
    //기본 8비트로 해줬습니다.
    NSUInteger bitsPerComponent = 8;
    //그리고 pixcelData를 가져올수있는 배열을 하나만들어줬습니다. 물론포인터입니다.
    unsigned char pixelData[4] = { 0, 0, 0, 0 };
    //이제 설정해준것들을 넣어서 context를 만듭니다. 
    CGContextRef context = CGBitmapContextCreate(pixelData, 1, 1, bitsPerComponent, bytesPerRow, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    // 그다음 colorspace는 다썻으니 할당해제합니다. 왜냐면 여기선 arc가 안막히기떄문이죠
    CGColorSpaceRelease(colorSpace);
    //나중에그려지느것은 기존에있는것을삭제 즉 업데이트해주는것
    CGContextSetBlendMode(context, kCGBlendModeCopy);
 //쿼츠는 좌표계가 왼쪽으로 (0,0)이기에 바꿔줬습니다. 우리가 알수 있도록
    CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)height);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
    CGContextRelease(context);
    

    CGFloat red   = (CGFloat)pixelData[0] / 255.0f;
    CGFloat green = (CGFloat)pixelData[1] / 255.0f;
    CGFloat blue  = (CGFloat)pixelData[2] / 255.0f;
    CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    
    

}

//createWithdata

+ (UIImage *)resizingImageSize:(UIImage *)image{
    
    CGImageRef cgImage = image.CGImage;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    NSUInteger bitsPerComponent = 8;
    CGFloat targetWidth = 375.0;
    CGFloat scaleFactor = targetWidth / image.size.width;
    CGFloat targetHeight = image.size.height * scaleFactor;
    
    CGContextRef context = CGBitmapContextCreate(NULL, 375, targetHeight, bitsPerComponent, 4*375, colorSpace, kCGImageAlphaPremultipliedLast);

    CGContextDrawImage(context, CGRectMake(0,0,375,targetHeight),cgImage);
    CGImageRef  ref = CGBitmapContextCreateImage(context);
    UIImage*    result = [UIImage imageWithCGImage:ref];
  
    
    
    return result;
}


+ (void)hideTabBar:(UIViewController *)vc {
    UITabBar *tabBar = vc.tabBarController.tabBar;
    UIView *parent = tabBar.superview; // UILayoutContainerView
    UIView *content = [parent.subviews objectAtIndex:0];  // UITransitionView
    UIView *window = parent.superview;
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         CGRect tabFrame = tabBar.frame;
                         tabFrame.origin.y = CGRectGetMaxY(window.bounds);
                         tabBar.frame = tabFrame;
                         content.frame = window.bounds;
                     }];
}

+ (void)showTabBar:(UIViewController *)vc {
    UITabBar *tabBar = vc.tabBarController.tabBar;
    UIView *parent = tabBar.superview; // UILayoutContainerView
    UIView *content = [parent.subviews objectAtIndex:0];  // UITransitionView
    UIView *window = parent.superview;
    
    [UIView animateWithDuration:0.1
                     animations:^{
                         CGRect tabFrame = tabBar.frame;
                         tabFrame.origin.y = CGRectGetMaxY(window.bounds) - CGRectGetHeight(tabBar.frame);
                         tabBar.frame = tabFrame;
                         
                         CGRect contentFrame = content.frame;
                         contentFrame.size.height -= tabFrame.size.height;
                     }];
}

+ (NSString *)koreaTimefomattingForCurrentDate{
    NSDate *date = [[NSDate alloc] init];
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    //[dateFormat setDateFormat:@"EEEE MMMM d, YYYY hh"];
    [dateFormat setDateFormat:@"yyyy,MMM DD일,hh:mm:ss a"];
    [dateFormat setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"ko_KR"]];
    NSString *dateString = [dateFormat stringFromDate:date];
  
    
    return dateString;
    
}

@end
