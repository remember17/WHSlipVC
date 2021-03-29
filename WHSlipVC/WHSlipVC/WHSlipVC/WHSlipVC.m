//
//  WHSlipVC.m
//  WHSlipVC
//
//  Created by 吴浩 on 2021/3/29.
//  Copyright © 2021 wuhao. All rights reserved.
//

#import "WHSlipVC.h"

#define kMenuScale 0.7
#define kMenuWidth [UIScreen mainScreen].bounds.size.width * kMenuScale

@implementation WHSlipVC

static WHSlipVC *slipVC = nil;
- (instancetype)initWithLeftVC:(UIViewController *)leftVC centerVC:(UIViewController *)centerVC {
    @synchronized(self) {
        if (!slipVC) {
            slipVC = [[WHSlipVC alloc] init];
            slipVC.leftViewController = leftVC;
            slipVC.centerViewController = centerVC;
            if (leftVC) {
                [slipVC addChildViewController:leftVC];
                [slipVC.view addSubview:leftVC.view];
            }
            if (centerVC) {
                [slipVC addChildViewController:centerVC];
                [slipVC.view addSubview:centerVC.view];
            }
        }
    }
    return slipVC;
}

+ (BOOL)isShowing {
    return slipVC.centerViewController.view.transform.tx > 0 ? YES : NO;
}

+ (WHSlipVC *)getMenuViewController {
    return slipVC;
}

+ (void)show {
    [slipVC showLeftViewController];
}

+ (void)hide {
    [slipVC hideLeftViewControlller];
}

- (void)showLeftViewController {
    [UIView animateWithDuration:0.5 animations:^{
        self.centerViewController.view.transform = CGAffineTransformMakeTranslation(kMenuWidth, 0);
    }];
}

- (void)hideLeftViewControlller {
    [UIView animateWithDuration:0.5 animations:^{
        self.centerViewController.view.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
}
@end
