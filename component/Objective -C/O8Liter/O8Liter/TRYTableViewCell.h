//
//  TryTableViewCell.h
//  O8Liter
//
//  Created by 진호놀이터 on 2017. 1. 1..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRYTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UILabel *itemTimerLabel;
@property (assign,nonatomic) NSDate *currentDate;
@property (nonatomic, strong) dispatch_source_t timerSource;
- (void)startTimerForCell;

@end
