//
//  WHMenuVC.m
//  WHSlipVC
//
//  Created by wuhao on 2018/7/4.
//  Copyright © 2018年 wuhao. All rights reserved.
//

#import "WHMenuVC.h"

#define kMenuScale 0.7 // 宽度比例
#define kMenuWidth [UIScreen mainScreen].bounds.size.width * kMenuScale // menu宽度

@implementation WHMenuVC

// 初始化
static WHMenuVC *menuVC = nil;
- (instancetype)initWithLeftVC:(UIViewController *)leftVC centerVC:(UIViewController *)centerVC {
    @synchronized(self) {
        if (!menuVC) {
            menuVC = [[WHMenuVC alloc] init];
            menuVC.leftViewController = leftVC;
            menuVC.centerViewController = centerVC;
            if (leftVC) {
                [menuVC addChildViewController:leftVC];
                [menuVC.view addSubview:leftVC.view];
            } else {
                [menuVC setupLeftViewController]; // 如果没有使用另一个VC，则自己创建
            }
            if (centerVC) {
                [menuVC addChildViewController:centerVC];
                [menuVC.view addSubview:centerVC.view];
            }
        }
    }
    return menuVC;
}

// 创建页面
- (void)setupLeftViewController {
    self.view.backgroundColor = [UIColor lightGrayColor];
}

// 展示状态
+ (BOOL)isShowing {
    return menuVC.centerViewController.view.transform.tx > 0 ? YES : NO;
}

// 获取
+ (WHMenuVC *)getMenuViewController {
    return menuVC;
}

+ (void)show {
    [menuVC showLeftViewController];
}

+ (void)hide {
    [menuVC hideLeftViewControlller];
}

// 展示
- (void)showLeftViewController {
    [UIView animateWithDuration:0.5 animations:^{
        self.centerViewController.view.transform = CGAffineTransformMakeTranslation(kMenuWidth, 0);
        self.leftViewController.view.transform = CGAffineTransformMakeTranslation(kMenuWidth, 0);
    }];
}

// 关闭
- (void)hideLeftViewControlller {
    [UIView animateWithDuration:0.5 animations:^{
        self.centerViewController.view.transform = CGAffineTransformMakeTranslation(0, 0);
        self.leftViewController.view.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
}

@end
