//
//  GameScene.m
//  BlockSnake
//
//  Created by Alba on 2019/1/25.
//  Copyright © 2019 Albatross. All rights reserved.
//

#import "GameScene.h"
#import "SnakeHead.h"
#import "SnakeBody.h"

@interface GameScene ()<SKPhysicsContactDelegate>
{
    
}
@end

@implementation GameScene {
    SKTileMapNode *backGroud;
    SKCameraNode *mainCamera;
    
    SnakeHead * playerSnakeHead;
    SnakeBody * playerSnakeBody;
}

- (void)didMoveToView:(SKView *)view {
    // Get label node from scene and store it for use later
    backGroud = (SKTileMapNode *)[self childNodeWithName:@"//MapNode"];
    mainCamera = (SKCameraNode *)[self childNodeWithName:@"//MainCamera"];
    
    // Setup your scene here
    //设置物理效果边界
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:backGroud.frame];
    self.physicsWorld.gravity = CGVectorMake(0, 0);//重力设置
    self.physicsBody.friction = 1;//线性阻尼
    self.physicsWorld.contactDelegate = self;//碰撞代理
    self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    
    //测试目标
    playerSnakeHead = [[SnakeHead alloc]initWithImageNamed:@"snakeHead_img"];
    playerSnakeHead.position = CGPointMake(0, 0);
    
    [self addChild:playerSnakeHead];
    
}

-(void)update:(NSTimeInterval)currentTime{
    mainCamera.position = playerSnakeHead.position;
}

-(void)updateSnakeHeaderWithRad:(CGFloat)rad{
    [playerSnakeHead.physicsBody applyForce:CGVectorMake(100*cos(rad), 100*sin(rad))];
    
}

#pragma mark - DirectionDelegate

//static CGFloat maxPower = 100.0;
//static CGFloat maxSpeed = 20.0;

-(void)didPressControlWithDirection:(CGFloat)rad{
    [self updateSnakeHeaderWithRad:rad];
}

-(void)didChangeDirection:(CGFloat)rad{
    [self updateSnakeHeaderWithRad:rad];
}

-(void)pressControlCancelled{
    
}

@end
