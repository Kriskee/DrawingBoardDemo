//
//  ViewController.m
//  Drawtest
//
//  Created by Kriskee on 16/4/12.
//  Copyright © 2016年 Kriskee. All rights reserved.
//

#import "ViewController.h"
#import "DrawManager.h"
#import "DrawView.h"
#import "DrawTableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet DrawView *drawView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

// 画笔颜色
- (IBAction)drawColor:(UIButton *)sender {
    DrawTableViewController *DTVC = [DrawTableViewController new];
    DTVC.drawType = kDrawTableColor;
    [self presentViewController:DTVC animated:YES completion:nil];
}

// 画笔粗细
- (IBAction)drawLineWidth:(UIButton *)sender {
    DrawTableViewController *DTVC = [DrawTableViewController new];
    DTVC.drawType = kDrawTableWidth;
    [self presentViewController:DTVC animated:YES completion:nil];
}

// 撤销
- (IBAction)drawRevoke:(UIButton *)sender {
    [[DrawManager shareInstance].pathArr removeLastObject];
    [DrawManager shareInstance].revoke = kRevokeYes;
    [self.drawView setNeedsDisplay];
}

// 橡皮擦
- (IBAction)drawEraser:(UIButton *)sender {
    [DrawManager shareInstance].lineColor = [UIColor whiteColor];
}

// 清空面板
- (IBAction)drawClear:(UIButton *)sender {
    [[DrawManager shareInstance].pathArr removeAllObjects];
    [self.drawView setNeedsDisplay];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
