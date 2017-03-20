//
//  EPGanttChart.m
//  EPGanttChart
//
//  Created by lu_ios on 17/3/1.
//  Copyright © 2017年 luchanghao. All rights reserved.
//

#import "EPGanttChart.h"
#import "EPGanttScrollView.h"
#import "EPGanttLine.h"
#import "UIView+Frame.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define COLOR_HEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface EPGanttChart ()
@property (nonatomic, strong) EPGanttScrollView *scrollView;
@end

@implementation EPGanttChart

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

-(void)setup{
    self.scrollView = [[EPGanttScrollView alloc] init];
    [self addSubview:_scrollView];
    
    UILabel *realLab = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, 50, 15))];
    realLab.right = SCREEN_WIDTH - 20;
    realLab.text = @"实际完成";
    realLab.textAlignment = NSTextAlignmentLeft;
    realLab.top = 10;
    realLab.font = [UIFont systemFontOfSize:10];
    [self addSubview:realLab];
    
    
    UIView *realImg = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, 10, 10))];
    realImg.backgroundColor = COLOR_HEX(0x84d947);
    realImg.centerY = realLab.centerY;
    realImg.right = realLab.left - 5;
    [self addSubview:realImg];
    
    
    
    UILabel *planLab = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, 50, 15))];
    planLab.right = realImg.left - 20;
    planLab.text = @"计划时间";
    planLab.textAlignment = NSTextAlignmentLeft;
    planLab.top = realLab.top;
    planLab.font = [UIFont systemFontOfSize:10];
    [self addSubview:planLab];
    
    
    UIView *planImg = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, 10, 10))];
    planImg.backgroundColor = COLOR_HEX(0xfa8e4e);
    planImg.centerY = planLab.centerY;
    planImg.right = planLab.left - 5;
    [self addSubview:planImg];

}

-(void)setYtitleArray:(NSArray *)YtitleArray{
    _YtitleArray = YtitleArray;
    EPGanttCoordinate *line4 = [[EPGanttCoordinate alloc] initWithArray:YtitleArray];
    line4.top = 30;
    line4.left = 10;
    [self addSubview:line4];
    
    _scrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH - line4.right -10, line4.height + 50);
    _scrollView.top = line4.top;
    _scrollView.left = line4.right +10;
}

-(void)setPlanArray:(NSArray *)planArray{
    _planArray = planArray;
    _scrollView.planArray = planArray;
}

-(void)setRealArray:(NSArray *)realArray{
    _realArray = realArray;
    _scrollView.realArray = realArray;
}

@end


















