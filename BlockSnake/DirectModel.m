//
//  DirectModel.m
//  BlockSnake
//
//  Created by Alba on 2019/1/30.
//  Copyright © 2019 Albatross. All rights reserved.
//

#import "DirectModel.h"

@implementation DirectModel

-(CGFloat)getRadWithMarkPoint:(CGPoint)markPoint{
    //oc为传统的左上角为（0，0）
    float edgeH = _controlCenter.y - markPoint.y;
    float edgeV = markPoint.x - _controlCenter.x;
    
    float rad = atan(edgeH/edgeV);// 反正切
    
    // 根据象限算出真确的弧度值   这里可能有更有算法或者方法，
    // 第二象限  注意！！！PI值 也就是180°的时候 需要包含在内，不然就是0了，在第一象限内！
    if(edgeH>=0 && edgeV<0){
        rad = PI+rad;
    }
    // 第三象限
    if(edgeH<0 && edgeV<0){
        rad = PI+rad;
    }
    // 第四象限
    if(edgeH<0 && edgeV>0){
        rad = 2*PI + rad;
    }
    
    //// 同时记录一下 触摸点到中心点的位置
    moveRange = sqrtf(powf(edgeH, 2)+powf(edgeV, 2));
    
    return rad;
}

-(CGPoint)getCircleCenterPositionWithRad:(CGFloat)rad{
    float x,y;
    
    float range = _controlRadius - _circleRadius;//// 中心圆可移动的范围
    range = range>moveRange?moveRange:range;
    
    x = range * cos(rad);
    y = range * sin(rad);
    
    //不明显的触摸不处理
    if(fabsf(x)<5 && fabsf(y)<5){
        x=y=0;
    }
    
    x = _controlCenter.x + x;// X轴是右为正向，直接相加
    y = _controlCenter.y - y;// 注意iOS坐标系是左上为原点，Y轴是向下为正向，不是向上，所以这里Y值需要相减才是正确值
    
    return CGPointMake(x, y);
}

@end
