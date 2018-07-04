//
//  ViewController.m
//  WHSlipVC
//
//  Created by wuhao on 2018/7/4.
//  Copyright © 2018年 wuhao. All rights reserved.
//

#import "ViewController.h"
#import "WHMenuVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 导航栏左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStyleDone target:self action:@selector(showMemu)];
    
    // 添加侧滑出菜单的手势
    [self addGesture];
}

- (void)addGesture {
    // 左滑
    UISwipeGestureRecognizer *leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipeGestureRecognizer];
    // 右滑
    UISwipeGestureRecognizer *rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipeGestureRecognizer];
}

// 展示侧边栏
- (void)showMemu {
    if (WHMenuVC.isShowing) {
        [WHMenuVC hide];
    } else  {
        [WHMenuVC show];
    }
}

// 手势展示侧边栏
- (void)handleSwipes:(UISwipeGestureRecognizer *)sender {
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        if (WHMenuVC.isShowing ) {
            [WHMenuVC hide];
        }
    } else if (sender.direction==UISwipeGestureRecognizerDirectionRight) {
        if (!WHMenuVC.isShowing) {
            [WHMenuVC show];
        }
    }
}

@end
