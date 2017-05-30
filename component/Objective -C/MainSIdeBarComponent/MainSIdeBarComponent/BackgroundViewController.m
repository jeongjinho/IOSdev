//
//  BackgroundViewController.m
//  MainSIdeBarComponent
//
//  Created by 진호놀이터 on 2016. 12. 24..
//  Copyright © 2016년 진호놀이터. All rights reserved.
//

#import "BackgroundViewController.h"
#import "MainViewController.h"
#import "SideViewController.h"
typedef enum {

    SideBarHalfStyle = 0,
    SideBarOneThird = 1,
    SideBarAll = 2
    
}SideBarStyle;

@interface BackgroundViewController ()

@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIView *sideView;
@property (weak, nonatomic) IBOutlet UIButton *sidbarButton;
@property (weak,nonatomic)UITabBarController *mainTabBarVC;
@property (strong,nonatomic)UISwipeGestureRecognizer *rightSwipeGesture;
@property (strong,nonatomic)UISwipeGestureRecognizer *leftSwipeGesture;
@property (assign,nonatomic)NSInteger selectedRowNumber;
@end

@implementation BackgroundViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.mainTabBarVC.tabBar setHidden:YES];
    self.isActiveListBar = NO;
    [self initialChildeViewWithButton:SideBarHalfStyle];
    [self initialSwipeGesture];
}

- (void)activeListBarFrame{
    
    [UIView animateWithDuration:0.1f animations:^{
        
        [self.mainView setFrame:CGRectMake(self.sideView.frame.size.width, self.sideView.frame.origin.y,self.mainView.frame.size.width-self.sideView.frame.size.width,self.mainView.frame.size.height)];
    } completion:^(BOOL finished) {
        self.isActiveListBar = YES;
    }];
}

- (void)nonActiveListBarFrame{
    [UIView animateWithDuration:0.1f animations:^{
        [self.mainView setFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y,self.view.frame.size.width,self.view.frame.size.height)];
    } completion:^(BOOL finished) {
        self.isActiveListBar = NO;
    }];
}


- (void)initialChildeViewWithButton:(SideBarStyle)sideBarStyle{
    
    switch (sideBarStyle) {
        case 0:
            [self.mainView setFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y,self.view.frame.size.width,self.view.frame.size.height)];
            [self.sideView setFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y,self.view.frame.size.width/2,self.view.frame.size.height)];
           
            break;

            default:
            break;
    }
}

- (void)initialSwipeGesture{
    
    self.rightSwipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightDirectionAction:)];
    self.rightSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    self.rightSwipeGesture.numberOfTouchesRequired = 1;
    [self.mainView addGestureRecognizer:_rightSwipeGesture];
    
    self.leftSwipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftDirectionAction:)];
    self.leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    self.leftSwipeGesture.numberOfTouchesRequired = 1;
    [self.mainView addGestureRecognizer:_leftSwipeGesture];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    UITabBarController *tabBar = [self.childViewControllers objectAtIndex:1] ;
    NSInteger tabBarCount = tabBar.viewControllers.count;
    if([keyPath isEqualToString:@"selectedRowNumber"]){
        self.selectedRowNumber = [[change objectForKey:NSKeyValueChangeNewKey] integerValue];
        
        if (tabBarCount>self.selectedRowNumber) {
            
            if([[tabBar.viewControllers objectAtIndex:self.selectedRowNumber] isKindOfClass:[UINavigationController class]]){
            
                [(UINavigationController *)[tabBar.viewControllers objectAtIndex:self.selectedRowNumber] popToRootViewControllerAnimated:NO];
                }
                [tabBar setSelectedViewController: [tabBar.viewControllers objectAtIndex:self.selectedRowNumber]];
                NSLog(@"탭바컨트롤러 %@",[tabBar.viewControllers objectAtIndex:self.selectedRowNumber].class);
            
            }  else {
            NSLog(@"선택된뷰컨트롤러가 없습니다.");
        }
    }
    [self nonActiveListBarFrame];
}

- (void)rightDirectionAction:(UISwipeGestureRecognizer *)sender{
    UISwipeGestureRecognizer *rightGesture = sender;
    if(rightGesture.direction==UISwipeGestureRecognizerDirectionRight&&_isActiveListBar ==NO){
        
        [self activeListBarFrame];
    }
}

- (void)leftDirectionAction:(UISwipeGestureRecognizer *)sender{
    UISwipeGestureRecognizer *leftGesture = sender;
    if(leftGesture.direction == UISwipeGestureRecognizerDirectionLeft &&_isActiveListBar == YES){
        
        [self nonActiveListBarFrame];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
