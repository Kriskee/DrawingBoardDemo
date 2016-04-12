//
//  DrawView.m
//  Drawtest
//
//  Created by Kriskee on 16/4/12.
//  Copyright © 2016年 Kriskee. All rights reserved.
//

#import "DrawView.h"
#import "DrawManager.h"

#pragma mark - Path类，用以保存贝塞尔曲线路径path及其颜色，宽度
@interface Path : NSObject
@property(nonatomic,strong)UIBezierPath *path;
@property(nonatomic,strong)UIColor *lineColor;
@property(nonatomic,assign)CGFloat lineWidth;
@end

@implementation Path
// 实现:即使没有方法亦要添加实现
@end

/**************************************************************************/

@interface DrawView ()
{
    CGPoint _startPoint;
    CGPoint _endPoint;
}
@end

@implementation DrawView

- (void)drawRect:(CGRect)rect {

    for (Path *aPath in [DrawManager shareInstance].pathArr) {
        UIBezierPath *path = aPath.path;
        if(![aPath isEqual:[[DrawManager shareInstance].pathArr lastObject]]){
            [aPath.lineColor set];
            path.lineWidth = aPath.lineWidth;
        }else{
            
            if([DrawManager shareInstance].revoke == kRevokeNo){
                aPath.lineColor = [DrawManager shareInstance].lineColor;
                aPath.lineWidth = [DrawManager shareInstance].lineWidth;
            }else{
                [DrawManager shareInstance].revoke = kRevokeNo;
            }
            
            [aPath.lineColor set];
            path.lineWidth = aPath.lineWidth;
        }
        
        // line首位圆角模式
        path.lineCapStyle = kCGLineCapRound;
        // line拐角圆角模式
        path.lineJoinStyle = kCGLineJoinRound;
        [path stroke];
        
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _startPoint = [[touches anyObject]locationInView:self];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:_startPoint];
    Path *aPath = [Path new];
    aPath.path = path;
    [[DrawManager shareInstance].pathArr addObject:aPath];
    NSLog(@"Began");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _endPoint = [[touches anyObject]locationInView:self];
    
    Path *aPath = [[DrawManager shareInstance].pathArr lastObject];
    UIBezierPath *path = aPath.path;
    [path addLineToPoint:_endPoint];
    [self setNeedsDisplay];
        NSLog(@"Moved");
}

@end
