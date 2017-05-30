//
//  view.m
//  drawingTest
//
//  Created by 진호놀이터 on 2017. 2. 24..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#import "view.h"

@implementation view


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, 50, 50);
    CGPathCloseSubpath(path);
    CGContextAddPath(ctx, path);
    CGContextSetStrokeColorWithColor(ctx,[UIColor blackColor].CGColor);
    CGContextStrokePath(ctx);
    CGPathRelease(path);
}


@end
