//
//  ViewController.m
//  delegateTest
//
//  Created by 진호놀이터 on 2017. 1. 13..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#import "ViewController.h"
#import "CustomNavigationBar.h"
#import "delelgate.h"
@interface ViewController ()<UICustomNavigationBarDelegate,delegates>
@property (weak, nonatomic) IBOutlet delelgate *test2;

@property CustomNavigationBar *navi;

@property delelgate *test;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        self.test2.delegate = self;
   // self.test = [[delelgate alloc]initWithDelegate:self];
   
    self.navi = [[CustomNavigationBar alloc]initWithStyle:UICustomNavigationBarLeftButtonStyle barColor:UICustomNavigationBarBlueColor mainLogo:@"로고" delegate:self];
    [self.view addSubview:_navi];

    
}


-(NSString *)uiCustomNavigationBarLeftButtonImageName{

    return @"logo";
}
-(NSString *)delegateMethod{

    return @"눌렸따";

}
- (void)didSelectedLeftButton:(CustomNavigationBar *)customNavigationBar{

    NSLog(@"버튼눌린거 델리게이트로 갔다옴");
}
- (IBAction)touchUpInside:(id)sender {
    
    [self delegateMethod];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
