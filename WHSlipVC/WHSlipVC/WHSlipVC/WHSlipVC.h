//
//  WHSlipVC.h
//  WHSlipVC
//
//  Created by 吴浩 on 2021/3/29.
//  Copyright © 2021 wuhao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WHSlipVC : UIViewController

@property(nonatomic,strong)UIViewController *leftViewController;
@property(nonatomic,strong)UIViewController *centerViewController;

- (instancetype)initWithLeftVC:(UIViewController *)leftVC centerVC:(UIViewController *)centerVC;

+ (WHSlipVC *)getMenuViewController;

+ (void)show;
+ (void)hide;
+ (BOOL)isShowing;

@end

NS_ASSUME_NONNULL_END
