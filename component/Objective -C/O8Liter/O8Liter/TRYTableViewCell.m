//
//  TryTableViewCell.m
//  O8Liter
//
//  Created by 진호놀이터 on 2017. 1. 1..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#import "TRYTableViewCell.h"
#import "Utility.h"
@implementation TRYTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
  }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)startTimerForCell{


    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    self.timerSource = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(self.timerSource, dispatch_walltime(NULL, 0), 1ull * NSEC_PER_SEC, 1ull * NSEC_PER_SEC);
    dispatch_source_set_event_handler(self.timerSource, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
          
            self.itemTimerLabel.text = [Utility koreaTimefomattingForCurrentDate];
        });

    });
    dispatch_resume(self.timerSource);

}


@end
