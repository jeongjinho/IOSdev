//
//  ViewController.m
//  drawingTest
//
//  Created by 진호놀이터 on 2017. 1. 6..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UIImageView *tempDrawImage;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *pain;
//@property (strong,nonatomic) NSMutableArray *pointArray;
@property NSMutableArray *pointArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _red = 55.0/255.0;
    _green = 5.0/255.0;
    _blue = 25.0/255.0;
    _brush = 25.0;
    _opacity = 1;
    _pointArray = [[NSMutableArray alloc]init];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.mainImage setNeedsDisplay];
    [self.tempDrawImage setNeedsDisplay];
    _mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    _lastPoint = [touch locationInView:self.view];
    [_pointArray addObject:[NSValue valueWithCGPoint:_lastPoint]];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
   [self.mainImage setNeedsDisplay];
    [self.tempDrawImage setNeedsDisplay];
    _mouseSwiped = YES;
    
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
   
    for (NSValue *point  in self.pointArray) {
        
        CGPoint arrayPoint = point.CGPointValue;
        if(currentPoint.x==arrayPoint.x&&currentPoint.y==arrayPoint.y){
            NSLog(@"로그");
            return ;
        }
        
    }
    UIGraphicsBeginImageContext(self.view.frame.size);
   
  
    [self.mainImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), _lastPoint.x, _lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapSquare);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), _brush );
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), _red, _green, _blue, .5);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.mainImage.image = UIGraphicsGetImageFromCurrentImageContext();

   // [self.tempDrawImage setAlpha:_opacity];
  
    [self.mainImage setNeedsDisplay];
      [_pointArray addObject:[NSValue valueWithCGPoint:currentPoint]];
    UIGraphicsEndImageContext();
      _lastPoint = currentPoint;


}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
      [self.view setNeedsDisplay];
       [self.tempDrawImage setNeedsDisplay];
    if(!_mouseSwiped) {
        [self touchesBegan:touches withEvent:event];
        UIGraphicsBeginImageContext(self.view.frame.size);
        [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), _brush);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), _red, _green, _blue, _opacity);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), _lastPoint.x, _lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), _lastPoint.x, _lastPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
 
    UIGraphicsBeginImageContext(self.mainImage.frame.size);
    [self.mainImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
    [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) blendMode:kCGBlendModeNormal alpha:_opacity];
    self.mainImage.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.view setNeedsDisplay];
    [self.tempDrawImage setNeedsDisplay];
    self.tempDrawImage.image = nil;
    UIGraphicsEndImageContext();
}
- (IBAction)touchUpInsideRedButtn:(id)sender {
    
    _red = 232.0/255.0;
    _green = 5.0/255.0;
    _blue = 25.0/255.0;
    _brush = 10.0;
    _opacity = 1.0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
