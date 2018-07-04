//
//  WHMenuVC.h
//  WHSlipVC
//
//  Created by wuhao on 2018/7/4.
//  Copyright © 2018年 wuhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WHMenuVC : UIViewController

@property(nonatomic,strong)UIViewController *leftViewController;

@property(nonatomic,strong)UIViewController *centerViewController;

// 初始化
- (instancetype)initWithLeftVC:(UIViewController *)leftVC centerVC:(UIViewController *)centerVC;

// 获取
+ (WHMenuVC *)getMenuViewController;

// 展示
+ (void)show;

// 关闭
+ (void)hide;

// 是否展示
+ (BOOL)isShowing;

@end
