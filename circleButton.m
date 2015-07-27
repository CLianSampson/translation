//
//  circleButton.m
//  Dictionary
//
//  Created by  chenlian on 15/6/19.
//  Copyright (c) 2015年 Sourcing Asia. All rights reserved.
//

#import "circleButton.h"
#import <math.h>

@implementation circleButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    CGContextSetLineCap(context, kCGLineCapRound);// 设置上下文画笔形状
    
    //    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
//    CGContextSetRGBFillColor(context, 1, 1, 1, 1);//设置颜色
    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1);
    
    CGContextSetLineWidth(context, 2);//设置线宽
    
//    CGContextFillEllipseInRect(context, CGRectMake(self.bounds.origin.x, self.bounds.origin.y, 30, 30));
    
    
    CGContextStrokeEllipseInRect(context, CGRectMake(self.bounds.origin.x+2, self.bounds.origin.y+2, 20, 20));
//    CGContextFillPath(context);
    
    
//    CGContextRef context1=UIGraphicsGetCurrentContext();
//    
//    CGContextSetLineCap(context1, kCGLineCapRound);// 设置上下文画笔形状
//    
//    //    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
//    CGContextSetRGBFillColor(context1, 1, 1, 1, 0);//设置颜色
//    CGContextSetRGBStrokeColor(context1, 1, 1, 1, 0);
//    
//    CGContextSetLineWidth(context1, 2);//设置线宽
//    
    CGPoint point=CGPointMake(self.bounds.origin.x+12+10*cos(45), self.bounds.origin.y+10+12*sin(45));
    CGPoint newPoint=CGPointMake(self.bounds.origin.x+10+25*cos(45), self.bounds.origin.y+10+25*sin(45));
    
    // 开始画线
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, point.x, point.y);
    CGContextAddLineToPoint(context, newPoint.x, newPoint.y);
    CGContextStrokePath(context);
        

    
//    CGContextFillEllipseInRect(context1, CGRectMake(self.bounds.origin.x+2, self.bounds.origin.y+2, 28, 28));
}


@end
