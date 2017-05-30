//
//  UIButton+SelectAction.m
//  O8Liter
//
//  Created by 진호놀이터 on 2017. 1. 1..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#import "UIButton+SelectAction.h"

@implementation UIButton(SelectAction)

- (void)buttomLine:(BOOL)isSelected{
    

    CALayer *btnLayer  =[CALayer layer];
    btnLayer.frame = CGRectMake(5,self.frame.size.height-2,self.frame.size.width-10,2);
    if(isSelected){
    btnLayer.backgroundColor = [UIColor blackColor].CGColor;
    } else {
        btnLayer.backgroundColor = [UIColor whiteColor].CGColor;
    }
    [self.layer addSublayer:btnLayer];
}

- (void)removeButtomLine{

    

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
