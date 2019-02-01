//
//  GameScene.m
//  BlockSnake
//
//  Created by Alba on 2019/1/25.
//  Copyright © 2019 Albatross. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene {
    SKLabelNode *backGroud;
}

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
    
    // Get label node from scene and store it for use later
    backGroud = (SKLabelNode *)[self childNodeWithName:@"//MapNode"];
    
}

@end
