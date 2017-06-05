
//
//  ZQDrawableImageView.m
//  MCamera
//
//  Created by 郑志勤 on 2017/6/5.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import "ZQDrawableImageView.h"

@interface ZQDrawableImageView()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) UIBezierPath *bezierPath;

@end

@implementation ZQDrawableImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        
        self.shapeLayer = ({
            CAShapeLayer *shapeLayer = [CAShapeLayer layer];
            shapeLayer.strokeColor = [UIColor redColor].CGColor;
            shapeLayer.fillColor = [UIColor clearColor].CGColor;

            shapeLayer;
        });
        
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [touches.anyObject locationInView:self];
    self.bezierPath = [UIBezierPath new];
    self.bezierPath.lineWidth = 2;
    [self.bezierPath moveToPoint:point];
    [self.layer addSublayer:self.shapeLayer];

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [touches.anyObject locationInView:self];
    [self.bezierPath addLineToPoint:point];
    self.shapeLayer.path = self.bezierPath.CGPath;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.bezierPath closePath];
    [self.bezierPath stroke];

}



@end
