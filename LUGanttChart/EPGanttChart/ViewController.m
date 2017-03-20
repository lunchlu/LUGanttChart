//
//  ViewController.m
//  EPGanttChart
//
//  Created by lu_ios on 17/3/1.
//  Copyright © 2017年 luchanghao. All rights reserved.
//

#import "ViewController.h"
#import "EPGanttChart.h"
#import "EPGanttLine.h"
#import "EPGanttScrollView.h"


#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


#import "UIView+Frame.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    EPGanttChart *view = [[EPGanttChart alloc] initWithFrame:(CGRectMake(0, 40, SCREEN_WIDTH, 700/3))];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    view.YtitleArray = @[@"TR1",@"TR2",@"TR3",@"TR4",@"TR5",@"TR6"];
    
      NSArray *array =    @[
             @{
             @"Xtitle" : @"16.01.01",
             @"x"      : @(30),
             @"width"  : @(60)
             },

             @{
             @"Xtitle" : @"16.02.01",
             @"x"      : @(90),
             @"width"  : @(80)
             },

             @{
             @"Xtitle" : @"16.02.01",
             @"x"      : @(170),
             @"width"  : @(100)
             },

             @{
                 @"Xtitle" : @"16.01.01",
                 @"x"      : @(270),
                 @"width"  : @(60)
                 },

             @{
                 @"Xtitle" : @"16.02.01",
                 @"x"      : @(330),
                 @"width"  : @(80)
                 },

             @{
                 @"Xtitle" : @"16.02.01",
                 @"x"      : @(410),
                 @"width"  : @(100)
                 },
      ];
    view.planArray = array;
    
    
    
    NSArray *array2 =    @[
                             @{
                                 @"x"      : @(30),
                                 @"width"  : @(50)
                                 },
   
                             @{
                                 @"x"      : @(90),
                                 @"width"  : @(70)
                                 },
   
                             @{
                                 @"x"      : @(170),
                                 @"width"  : @(100)
                                 },
   
   
                             @{
                                 @"x"      : @(270),
                                 @"width"  : @(60)
                                 },
                             
                             @{
                                 @"x"      : @(330),
                                 @"width"  : @(60)
                                 },
                             
                             @{
                                 @"x"      : @(410),
                                 @"width"  : @(80)
                                 },
                             
                             ];
   
       
       view.realArray = array2;
}


@end



















