//
//  SideViewController.m
//  MainSIdeBarComponent
//
//  Created by 진호놀이터 on 2016. 12. 24..
//  Copyright © 2016년 진호놀이터. All rights reserved.
//

#import "SideViewController.h"
#import "BackgroundViewController.h"
@interface SideViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *sideTableView;
@property (strong,nonatomic) NSNumber *selectedRowNumber;

@end

@implementation SideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectedRowNumber = @0;
    self.sideTableView.delegate = self;
    self.sideTableView.dataSource = self;
}

#pragma -mark tableView delegate Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    self.selectedRowNumber  = [NSNumber numberWithInteger:indexPath.row];
    if([self.parentViewController isKindOfClass:[BackgroundViewController class]]){
        [self addObserver:self.parentViewController
                                    forKeyPath:@"selectedRowNumber"
                                       options:NSKeyValueObservingOptionInitial |
                                    NSKeyValueObservingOptionNew
                                       context:nil];
        }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
