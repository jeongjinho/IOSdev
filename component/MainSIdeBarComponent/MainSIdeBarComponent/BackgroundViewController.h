//
//  BackgroundViewController.h
//  MainSIdeBarComponent
//
//  Created by 진호놀이터 on 2016. 12. 24..
//  Copyright © 2016년 진호놀이터. All rights reserved.
//



#import <UIKit/UIKit.h>


@interface BackgroundViewController : UIViewController

@property (nonatomic)BOOL isActiveListBar;
- (void)activeListBarFrame;
- (void)nonActiveListBarFrame;
@end






