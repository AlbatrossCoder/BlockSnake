//
//  SnakeHead.m
//  BlockSnake
//
//  Created by Alba on 2019/2/11.
//  Copyright © 2019 Albatross. All rights reserved.
//

#import "SnakeHead.h"

@implementation SnakeHead

-(instancetype)initWithColor:(UIColor *)color size:(CGSize)size{
    self = [super initWithColor:color size:size];
    
    if(self){
        [self createSnakeHead];
    }
    
    return self;
}

-(instancetype)initWithImageNamed:(NSString *)name{
    self = [super initWithImageNamed:name];
    if(self){
        [self createSnakeHead];
    }
    return self;
}

-(void)createSnakeHead{
    
    self.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.frame.size.height/2.0];//圆形的碰撞身体
    self.anchorPoint = CGPointMake(.5, .5);//锚点
    self.physicsBody.dynamic = YES;//可否受力
}

-(void)setHeaderColor:(UIColor *)color{
    self.color = color;
}

-(void)setHeaderImage:(UIImage *)image{
    
}

@end
