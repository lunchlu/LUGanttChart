//
//  EPGanttScrollView.m
//  EPGanttChart
//
//  Created by lu_ios on 17/3/2.
//  Copyright © 2017年 luchanghao. All rights reserved.
//

#import "EPGanttScrollView.h"
#import "EPGanttLine.h"
#import "UIView+Frame.h"

#define COLOR_HEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation EPGanttScrollView

/*
 
 @[
    @{
        @"Xtitle" : @"16.01.01",
        @"x"      : @(0),
        @"width"  : @(60)
     },
 
     @{
        @"Xtitle" : @"16.02.01",
        @"x"      : @(60),
        @"width"  : @(60)
     },

     @{
        @"Xtitle" : @"16.02.01",
        @"x"      : @(120),
        @"width"  : @(60)
     },
 ]
 
 */

-(void)setPlanArray:(NSArray *)planArray{
    _planArray = planArray;
    [self setupPlan];
    
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
}

-(void)setupPlan{
    /*
     
     @{
     @"Xtitle" : @"16.02.01",
     @"x"      : @(120),
     @"width"  : @(60)
     },
     
     */
    
    for (int i; i<_planArray.count; i++) {
        
        NSDictionary *dict = _planArray[i];
        NSString *xtitle = dict[@"Xtitle"];
        CGFloat x = [dict[@"x"] floatValue];
        CGFloat width = [dict[@"width"] floatValue];
        CGFloat y = i*20 + 4*i;
        EPGanttLine *line = [[EPGanttLine alloc] initWithFrame:(CGRectMake(x, y, width, 10))];
        line.isPlanLine = YES;
        [self addSubview:line];
        
        
        self.contentSize = CGSizeMake(x + width +20, 0);

        
        EPGanttVerticalLine *verticalLine = [[EPGanttVerticalLine alloc] initWithBeginPoint:(CGPointMake(x, y+5)) endPoint:(CGPointMake(x, _planArray.count *24 + 20))];
        [self addSubview:verticalLine];
        
        
        
        UILabel *lab = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, 80, 20))];
        lab.text = xtitle;
        lab.textAlignment = NSTextAlignmentCenter;
        lab.textColor = COLOR_HEX(0xa9a9a9);
        lab.font = [UIFont systemFontOfSize:10];
        lab.centerX = x;
        lab.top = verticalLine.bottom;
        [self addSubview:lab];
    }
    
}

/*
 
 @[
 @{
 @"x"      : @(0),
 @"width"  : @(50)
 },
 
 @{
 @"x"      : @(60),
 @"width"  : @(60)
 },
 
 @{
 @"x"      : @(120),
 @"width"  : @(70)
 },
 ]
 
 */

-(void)setRealArray:(NSArray *)realArray{
    _realArray = realArray;
    [self setupReal];
}

-(void)setupReal{
    for (int i; i<_realArray.count; i++) {
        
        NSDictionary *dict = _realArray[i];
        CGFloat x = [dict[@"x"] floatValue];
        CGFloat width = [dict[@"width"] floatValue];
        CGFloat y = i*20 + 4*i + 10;
        EPGanttLine *line = [[EPGanttLine alloc] initWithFrame:(CGRectMake(x, y, width, 10))];
        line.isPlanLine = NO;
        [self addSubview:line];
    }

}
@end


















