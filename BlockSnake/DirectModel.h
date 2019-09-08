//
//  DirectModel.h
//  BlockSnake
//
//  Created by Alba on 2019/1/30.
//  Copyright © 2019 Albatross. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DirectModel : NSObject
{
    float moveRange;
}
@property (nonatomic) CGPoint controlCenter;//控制盘中心位置
@property (nonatomic) CGFloat controlRadius;//控制盘半径
@property (nonatomic) CGFloat circleRadius;//圆点半径

/**
 获取触摸点相对于控制盘的弧度 (横向左侧为零轴)

 @param markPoint 触摸点
 @return 弧度
 */
-(CGFloat)getRadWithMarkPoint:(CGPoint)markPoint;

/**
 获取圆点在按下的时候相对控制盘的位置

 @param rad 弧度
 @return 圆点坐标
 */
-(CGPoint)getCircleCenterPositionWithRad:(CGFloat)rad;

@end

NS_ASSUME_NONNULL_END
