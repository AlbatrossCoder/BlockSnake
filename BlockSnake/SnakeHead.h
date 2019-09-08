//
//  SnakeHead.h
//  BlockSnake
//
//  Created by Alba on 2019/2/11.
//  Copyright © 2019 Albatross. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SnakeHead : SKSpriteNode

@property(nonatomic)CGFloat maxSpeed;//最大速度

-(void)setHeaderColor:(UIColor *)color;//设置颜色

-(void)setHeaderImage:(UIImage *)image;//可以放置图片

@end

NS_ASSUME_NONNULL_END
