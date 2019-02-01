//
//  DirectionControl.m
//  BlockSnake
//
//  Created by Alba on 2019/1/30.
//  Copyright © 2019 Albatross. All rights reserved.
//

#import "DirectionControl.h"
#import "DirectModel.h"

@interface DirectionControl ()
{
    DirectModel * model;
    UIView * circle;
}
@end

@implementation DirectionControl

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self viewDidload];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)viewDidload{
    self.frame = CGRectMake(30, IPHONE_HEIGHT-30-135, 135, 135);
    
    [self setBackgroundColor:RGBA(45, 45, 45, 0.15)];
    self.layer.cornerRadius = self.frame.size.height/2;
    self.layer.masksToBounds = YES;
    
    if(!circle) circle = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    circle.layer.cornerRadius = circle.frame.size.height/2;
    circle.layer.masksToBounds = YES;
    [circle setBackgroundColor:RGBA(75, 75, 75, 0.5)];
    circle.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    [self addSubview:circle];
    
    model = [DirectModel new];
    model.controlRadius = self.frame.size.height/2.0;
    model.circleRadius = circle.frame.size.height/2.0;
    model.controlCenter = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
}

-(void)setPosition:(CGPoint)point radius:(CGFloat)radius{
    self.center = point;
    CGRect frame = self.frame;
    frame.size.width = radius*2;
    frame.size.height = radius*2;
    self.frame = frame;
    self.layer.cornerRadius = self.frame.size.height/2;
    
    circle.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    model.controlCenter = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    model.circleRadius = circle.frame.size.height/2.0;
    model.controlRadius = radius;
}

-(void)updateCircleCenterWithPoint:(CGPoint)point{
    //// 获取返回的按钮位置
    point = [model getCircleCenterPositionWithRad:[model getRadWithMarkPoint:point]];
    if(isnan(point.x) || isnan(point.y)){
        circle.center = model.controlCenter;
    }else{
        circle.center = point;
    }
}

#pragma mark - TouchEvent

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (UITouch * touch in touches) {
        [self updateCircleCenterWithPoint:[touch locationInView:self]];
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (UITouch * touch in touches) {
        [self updateCircleCenterWithPoint:[touch locationInView:self]];
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 复位
    circle.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
}

@end
