//
//  EPGanttLine.m
//  EPGanttChart
//
//  Created by lu_ios on 17/3/2.
//  Copyright © 2017年 luchanghao. All rights reserved.
//

#import "EPGanttLine.h"
#import "UIView+Frame.h"


#define MAIN_SCREEN ([UIScreen mainScreen].bounds)
//add screen's WIDTH and HEIGHT
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define NAVBAR_HEIGHT 64
#define TABBAR_HEIGHT 49

// 颜色(RGB)
#define COLOR_RGB(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define COLOR_RGBA(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define COLOR_HEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@implementation EPGanttLine

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

-(void)setup{
    self.layer.cornerRadius = self.height/3;
}

-(void)setLineWidth:(CGFloat)lineWidth{
    _lineWidth = lineWidth;
    self.width = lineWidth;
    [self setup];
}

-(void)setIsPlanLine:(BOOL)isPlanLine{
    _isPlanLine = isPlanLine;
    if (isPlanLine) {
        self.backgroundColor = COLOR_HEX(0xfa8e4e);
    }
    else{
        self.backgroundColor = COLOR_HEX(0x84d947);
    }
}

@end




@interface EPGanttVerticalLine ()

@end

@implementation EPGanttVerticalLine

-(instancetype)initWithBeginPoint:(CGPoint)beginPoint endPoint:(CGPoint)endPoint
{
    if (self = [super init]) {
        self.beginPoint = beginPoint;
        self.endPoint = endPoint;
        [self setup];
    }
    return self;
}

-(void)setup{
    CGFloat height = _endPoint.y - _beginPoint.y;
    self.frame = CGRectMake(0, 0, 10, height);
    self.centerX = _beginPoint.x;
    self.top = _beginPoint.y;
    self.backgroundColor =[UIColor clearColor];
    [self setNeedsDisplay];
}


-(void)drawRect:(CGRect)rect{
    
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context, COLOR_HEX(0xfa8e4e).CGColor);
    CGFloat lengths[] = {1.3,1.5};
    CGContextSetLineDash(context, 0, lengths,2);
    CGContextMoveToPoint(context, self.width/2, 0);
    CGContextAddLineToPoint(context, self.width/2,self.height);
    CGContextStrokePath(context);
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    view.centerX = self.width /2;
    view.bottom  = self.height;
    CGContextAddEllipseInRect(context, view.frame);
    [COLOR_HEX(0xfa8e4e) setFill];
    CGContextFillPath(context);
    
    CGContextClosePath(context);
}
@end






@implementation EPGanttCoordinate

-(instancetype)initWithArray:(NSArray *)array{
    if (self = [super init]) {
        self.titleArray = array;
        [self setup];
    }
    return self;
}

-(void)setup{
    self.frame = CGRectMake(0, 0, 30, _titleArray.count * 24);
    for (int i; i<_titleArray.count; i++) {
        UILabel *lab = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, self.width, 24))];
        lab.top = i* 24;
        lab.text = _titleArray[i];
        lab.textAlignment = NSTextAlignmentRight;
        lab.textColor = COLOR_HEX(0xa9a9a9);
        lab.font = [UIFont systemFontOfSize:10];
        [self addSubview:lab];
    }
}



@end








