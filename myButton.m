//
//  myButton.m
//  Dictionary
//
//  Created by  chenlian on 15/6/19.
//  Copyright (c) 2015年 Sourcing Asia. All rights reserved.
//

#import "myButton.h"

@implementation myButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    
    //获取图形上下文
    CGContextRef  context=UIGraphicsGetCurrentContext();
    
    
    
    CGContextSetLineCap(context, kCGLineCapRound);// 设置上下文画笔形状
    
    //    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    CGContextSetRGBFillColor(context, 1, 1, 1, 1);//设置颜色
    
    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1);
    
    CGContextSetLineWidth(context, 2);//设置线宽
    
    
    CGPoint point=CGPointMake(self.bounds.origin.x, self.bounds.origin.y);
    CGPoint newPoint;
    
    newPoint.x=point.x+self.frame.size.width;
    
    for (int i=0; i<3;i++) {
        
        if (i==0) {
            point.y=self.bounds.origin.y+1;
        }
        if (i==1) {
            point.y=self.bounds.origin.y+15;
        }
        if (i==2) {
            point.y=self.bounds.origin.y+28;
        }
        
        newPoint.y=point.y;
        
        
        
        // 开始画线
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, point.x, point.y);
        CGContextAddLineToPoint(context, newPoint.x, newPoint.y);
        CGContextStrokePath(context);
        
        //        [self setNeedsDisplay];
    }
    
    
    //画圆
//    CGContextFillEllipseInRect(context, CGRectMake(self.bounds.origin.x, self.bounds.origin.y, 40, 40));
    
    
    //画矩形
//    CGContextFillRect(context, CGRectMake(45, 0, 40, 40));
    
}


@end
