//
//  GameViewController.m
//  BlockSnake
//
//  Created by Alba on 2019/1/25.
//  Copyright © 2019 Albatross. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"
#import "DirectionControl.h"

@interface GameViewController ()
{
    DirectionControl * controllRod;
}
@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // Load the SKScene from 'GameScene.sks'
    GameScene *scene = (GameScene *)[SKScene nodeWithFileNamed:@"GameScene"];
    
    // Set the scale mode to scale to fit the window
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    SKView *skView = (SKView *)self.view;
    
    // Present the scene
    [skView presentScene:scene];
    
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    controllRod = [[DirectionControl alloc]init];
    [controllRod setPosition:CGPointMake(30.0+60, IPHONE_HEIGHT-30.0-60) radius:60.0];
    controllRod.delegate = scene;
    [self.view addSubview:controllRod];
}

#pragma mark - Other

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
