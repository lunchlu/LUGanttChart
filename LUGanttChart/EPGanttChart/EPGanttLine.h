//
//  EPGanttLine.h
//  EPGanttChart
//
//  Created by lu_ios on 17/3/2.
//  Copyright © 2017年 luchanghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EPGanttLine : UIView
@property (nonatomic, assign) BOOL isPlanLine;
@property (nonatomic, assign) CGFloat lineWidth;
@end




@interface EPGanttVerticalLine : UIView
-(instancetype)initWithBeginPoint:(CGPoint)beginPoint endPoint:(CGPoint)endPoint;
@property (nonatomic, assign) CGPoint beginPoint;
@property (nonatomic, assign) CGPoint endPoint;
@end




@interface EPGanttCoordinate : UIView
@property (nonatomic, strong) NSArray *titleArray;
-(instancetype)initWithArray:(NSArray *)array;
@end







