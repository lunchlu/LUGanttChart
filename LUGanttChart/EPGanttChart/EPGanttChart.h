//
//  EPGanttChart.h
//  EPGanttChart
//
//  Created by lu_ios on 17/3/1.
//  Copyright © 2017年 luchanghao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^EPGanttChartBlock)(NSArray *array);

@interface EPGanttChart : UIView
@property (nonatomic, strong) NSArray *YtitleArray;
@property (nonatomic, strong) NSArray *planArray;
@property (nonatomic, strong) NSArray *realArray;
@property (nonatomic, copy)  EPGanttChartBlock block;
@end


