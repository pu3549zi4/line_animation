//
//  were.m
//  line_animation
//
//  Created by Xmart on 15/12/22.
//  Copyright © 2015年 Xmart. All rights reserved.
//

#import "were.h"

@implementation were


- (void)drawRect:(CGRect)rect {
    
    //  抛物线运动并同时旋转
    //mSprite：需要做抛物线的精灵
    //startPoint:起始位置
    //endPoint:中止位置
    //startA:起始角度
    //endA:中止角度
    //dirTime:起始位置到中止位置的所需时间
    
    CGPoint startPoint = CGPointMake(50, 50);
    CGPoint endPoint = CGPointMake(300, 200);
    CGPoint controlPoint = CGPointMake(200, 50);
    
    UIColor *color = [UIColor redColor];
    [color set];  //设置线条颜色
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound;  //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound;  //终点处理
    [aPath moveToPoint:startPoint];
    [aPath addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    [aPath stroke];

    
    CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 5;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
//    animation.repeatCount = HUGE_VALF;// repeat forever
    animation.calculationMode = kCAAnimationCubicPaced;
    UIView *vol = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 20, 20)];
    vol.layer.cornerRadius = 10;
    vol.backgroundColor = [UIColor cyanColor];
    [self addSubview:vol];
    animation.path = aPath.CGPath;
    [vol.layer addAnimation:animation forKey: nil];
    
    /**
     *
     */
    // 第一、 UIBezierPath 绘制线段
    
    CGPoint startPoint1 = CGPointMake(50, 250);
    CGPoint endPoint1 = CGPointMake(300, 400);
    CGPoint controlPoint1 = CGPointMake(200, 250);
    
    UIColor *color1 = [UIColor clearColor];
    [color1 set];  //设置线条颜色
    UIBezierPath* aPath1 = [UIBezierPath bezierPath];
    aPath1.lineWidth = 1.5;
    aPath1.lineCapStyle = kCGLineCapRound;  //线条拐角
    aPath1.lineJoinStyle = kCGLineCapRound;  //终点处理
    [aPath1 moveToPoint:startPoint1];
    [aPath1 addQuadCurveToPoint:endPoint1 controlPoint:controlPoint1];
    [aPath1 stroke];
    // 第二、 UIBezierPath 和 CAShapeLayer 关联
    
    CAShapeLayer *lineLayer2 = [ CAShapeLayer layer ];
    lineLayer2. frame = CGRectZero;
    lineLayer2. fillColor = [ UIColor clearColor ]. CGColor ;
    lineLayer2. path = aPath1. CGPath ;
    lineLayer2. strokeColor = [UIColor cyanColor]. CGColor ;
    lineLayer2. lineWidth = 1.5;
    //第三，动画
    
    CABasicAnimation *ani = [ CABasicAnimation animationWithKeyPath : NSStringFromSelector ( @selector (strokeEnd))];
    ani. fromValue = @0 ;
    ani. toValue = @1 ;
    ani. duration = 0.6 ;
    [lineLayer2 addAnimation :ani forKey : NSStringFromSelector ( @selector (strokeEnd))];
    [self. layer addSublayer :lineLayer2];
    


}


@end
