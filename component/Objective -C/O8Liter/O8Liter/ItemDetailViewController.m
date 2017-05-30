//
//  ItemDetailViewController.m
//  O8Liter
//
//  Created by 진호놀이터 on 2017. 1. 11..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#import "ItemDetailViewController.h"

@interface ItemDetailViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *itemInfoScrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ItemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.itemInfoScrollView addSubview:_contentView];
    self.itemInfoScrollView.delegate = self;
    NSLog(@"컨텐츠사이즈 %lf",_contentView.frame.size.height);
    NSLog(@"컨텐츠사이즈 %lf",_itemInfoScrollView.frame.size.height);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    NSLog(@" snffla");
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
