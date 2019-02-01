//
//  DirectionControl.h
//  BlockSnake
//
//  Created by Alba on 2019/1/30.
//  Copyright © 2019 Albatross. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol directionDelegate <NSObject>

/**
 按下控制盘

 @param rad 方向弧度，横向左侧为零轴
 */
-(void)didPressControlWithDirection:(CGFloat)rad;

/**
 控制方向变化

 @param rad 方向弧度
 */
-(void)didChangeDirection:(CGFloat)rad;

/**
 松开控制
 */
-(void)pressControlCancelled;

@end

@interface DirectionControl : UIView

@property(nonatomic,strong)id<directionDelegate> delegate;

/**
 初始化并设定位置和半径大小

 @param point 中心点位置
 @param radius 控制盘半径
 */
-(void)setPosition:(CGPoint)point radius:(CGFloat)radius;

@end

NS_ASSUME_NONNULL_END
