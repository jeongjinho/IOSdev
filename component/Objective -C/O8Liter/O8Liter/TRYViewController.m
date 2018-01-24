//
//  08TRYViewController.m
//  O8Liter
//
//  Created by 진호놀이터 on 2016. 12. 31..
//  Copyright © 2016년 진호놀이터. All rights reserved.
//

#import "TRYViewController.h"
#import "UIButton+SelectAction.h"
#import "TRYTableViewCell.h"
#import "Utility.h"
@interface TRYViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *itemsTableView;
@property (weak, nonatomic) IBOutlet UIView *menuBar;
@property (weak, nonatomic) IBOutlet UIButton *tableViewOffsetZeroButton;
@property (weak, nonatomic) IBOutlet UILabel *taleViewCurrentIndexLabel;
@property (weak, nonatomic) IBOutlet UIView *topOffsetView;
@property (strong,nonatomic) NSArray *imageArray;
@property (nonatomic) CGPoint currentTablePoint;




@end

@implementation TRYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializingVC];
    
}

- (void)initializingVC{
    self.imageArray = [[NSArray alloc]initWithObjects:@"samplePicture",@"bedRoom", @"lips",@"pinkPading",@"haribo",@"tea",nil];
    self.itemsTableView.dataSource = self;
    self.itemsTableView.delegate = self;
    self.itemsTableView.rowHeight = UITableViewAutomaticDimension;
    self.itemsTableView.estimatedRowHeight = 100;
    self.currentTablePoint = CGPointZero;

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if(_currentTablePoint.y>_itemsTableView.contentOffset.y||_currentTablePoint.y<=0){
        [Utility showTabBar:self];
        [self.view sendSubviewToBack:_tableViewOffsetZeroButton];
        [self.view sendSubviewToBack:_taleViewCurrentIndexLabel];
        
    } else{
        [Utility hideTabBar:self];
        [self.view bringSubviewToFront:self.tableViewOffsetZeroButton];
        [self.view bringSubviewToFront:self.taleViewCurrentIndexLabel];
        
    }
    
    self.currentTablePoint = _itemsTableView.contentOffset;
    
}
#pragma -mark  UITableView dataSource Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

#pragma -mark  UITableView delegate Methods
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    TRYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
   
//    if(indexPath.section==4){
//
//        UIImage *image =  [Utility resizingImageSize:[UIImage imageNamed:_imageArray[indexPath.section]]];
//        cell.itemImage.image = image;
//    } else{
        cell.itemImage.image = [UIImage imageNamed:_imageArray[indexPath.section]];
 //   }
    
    CGPoint point = CGPointMake(cell.itemImage.image.size.width/2,cell.itemImage.image.size.height/2);
   
    UIColor *imgColor = [Utility colorToPointForImage:cell.itemImage.image point:             point];
    
    CGFloat satuation;
    CGFloat brightness;
    
    [imgColor getHue:nil saturation:&satuation brightness:&brightness alpha:nil];
  
    
    if(satuation<0.4&&brightness>0.2){
      cell.itemTimerLabel.textColor = [UIColor blackColor];
    } else {
      cell.itemTimerLabel.textColor = [UIColor whiteColor];
    }
    //라벨에 시간찍기
    [cell startTimerForCell];
         return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1.0f;
}

#pragma -mark touchUpInside methos
- (IBAction)touchUpInsideNewItemMenuButton:(id)sender {
    if([sender isKindOfClass:[UIButton class]]){
           UIButton *btn = sender;
         for (UIButton *subButton in _menuBar.subviews) {
             //버튼 초기화
             subButton.selected = NO;
             [subButton buttomLine:NO];
             //만약 선택된것과 반복문중 같은것이 있다면
             if(btn.tag == subButton.tag){
                 //선택된버튼이 선택되어진거라면  라인을그린다.
                 if(!btn.selected) [subButton buttomLine:YES];
                 subButton.selected = !subButton.selected;
                 
                [_itemsTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationLeft];
                 
                
             }
            
         }
     }
}

- (IBAction)touchUpInsideTopOffsetButton:(id)sender {
  [self.itemsTableView setContentOffset:CGPointZero animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
