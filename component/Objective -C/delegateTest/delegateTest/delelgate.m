//
//  delelgate.m
//  delegateTest
//
//  Created by 진호놀이터 on 2017. 1. 13..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#import "delelgate.h"

@implementation delelgate


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self searchDelegate];

}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
           }
    return self;
}
- (instancetype)initWithDelegate:(id<delegates>)delegate
{
    self = [super init];
    if (self) {
        [self setDelegate:delegate];
       
    }
    return self;
}

- (void)searchDelegate{
    
    NSString *test;
    if([self.delegate respondsToSelector:@selector(delegateMethod)]) {
    
        test = [self.delegate delegateMethod];
        NSLog(@"테스트%@",test);
    }
    

}




@end
