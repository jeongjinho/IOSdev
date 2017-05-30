//
//  delelgate.h
//  delegateTest
//
//  Created by 진호놀이터 on 2017. 1. 13..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol delegates;




@interface delelgate : UILabel
@property id<delegates> delegate;

- (instancetype)initWithDelegate:(id<delegates>)delegate;
@end

@protocol delegates <NSObject>
@optional
- (NSString *)delegateMethod;

@end
