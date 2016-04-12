//
//  DrawManager.h
//  Drawtest
//
//  Created by Kriskee on 16/4/12.
//  Copyright © 2016年 Kriskee. All rights reserved.
//
/*
 * 画板管理类
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ERevoke) {
    kRevokeYes = 0x100,
    kRevokeNo =  0X101,
};

@interface DrawManager : NSObject
@property(nonatomic,strong)NSMutableArray *pathArr;
@property(nonatomic,strong)UIColor *lineColor;
@property(nonatomic,assign)CGFloat lineWidth;
@property(nonatomic,assign)ERevoke revoke;

+ (instancetype)shareInstance;
@end
