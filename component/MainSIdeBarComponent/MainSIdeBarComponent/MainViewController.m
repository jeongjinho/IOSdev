//
//  MainViewController.m
//  MainSIdeBarComponent
//
//  Created by 진호놀이터 on 2016. 12. 24..
//  Copyright © 2016년 진호놀이터. All rights reserved.
//

#import "MainViewController.h"
#import "BackgroundViewController.h"
#import "SideViewController.h"
@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *sideBarButton;
@property (strong,nonatomic) BackgroundViewController *parentVC;
@property  BOOL isSideBarButtonSeleted;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;
    [self initialAttributeForViewController];
    
}


- (IBAction)touchUpInsideSideBarButton:(id)sender {
 
    BOOL isActiveListBar  = _parentVC.isActiveListBar;
    if(isActiveListBar == NO){
    [self.parentVC activeListBarFrame];
        self.parentVC.isActiveListBar = YES;
    } else {
        [self.parentVC nonActiveListBarFrame];
        self.parentVC.isActiveListBar = NO;
    }
}

- (void)initialAttributeForViewController{
    self.parentVC = (BackgroundViewController *)self.tabBarController.parentViewController;

    self.isSideBarButtonSeleted = NO;

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
