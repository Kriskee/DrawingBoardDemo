//
//  DrawManager.m
//  Drawtest
//
//  Created by Kriskee on 16/4/12.
//  Copyright © 2016年 Kriskee. All rights reserved.
//

#import "DrawManager.h"

DrawManager *manager = nil;

@implementation DrawManager
+ (instancetype)shareInstance{
    if(!manager){
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [DrawManager new];
        });
    }
    return manager;
}

#pragma mark - 懒加载和初始化
- (NSMutableArray *)pathArr{
    if(!_pathArr){
        _pathArr = [NSMutableArray array];
    }
    return _pathArr;
}

- (UIColor *)lineColor{
    if(!_lineColor){
        _lineColor = [UIColor redColor];
    }
    return _lineColor;
}

- (CGFloat)lineWidth{
    if (_lineWidth == 0) {
        _lineWidth = 1;
    }
    return _lineWidth;
}

- (ERevoke)revoke{
    if (_revoke == 0){
        _revoke = kRevokeNo;
    }
    return _revoke;
}
@end
