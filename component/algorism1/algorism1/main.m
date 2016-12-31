//
//  main.m
//  algorism1
//
//  Created by 진호놀이터 on 2016. 12. 26..
//  Copyright © 2016년 진호놀이터. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSInteger n =1000
        ;
        NSInteger result;
        NSInteger total;
        for (NSInteger i=1; result<n;i++) {
            total +=result;
            NSLog(@"total:%ld",total);
            result  = 3*i;
        }
        result = 0;
        for (NSInteger i=1; result<n;i++) {
            total +=result;
            result  = 5*i;
        }
        
        NSLog(@"total:%ld",total);
        
        
 
        return 0;

    }

}
