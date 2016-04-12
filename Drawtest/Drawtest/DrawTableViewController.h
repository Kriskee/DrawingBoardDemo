//
//  DrawTableViewController.h
//  Drawtest
//
//  Created by Kriskee on 16/4/12.
//  Copyright © 2016年 Kriskee. All rights reserved.
//
/*
 * 曲线颜色和宽度展示类
 */

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, EDrawTable) {
    kDrawTableColor,
    kDrawTableWidth,
};

@interface DrawTableViewController : UITableViewController
@property(nonatomic,assign)EDrawTable drawType;
@end
