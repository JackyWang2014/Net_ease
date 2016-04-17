//
//  QTNavigationController.m
//  Net_ease
//
//  Created by 王亓泰 on 16/4/17.
//  Copyright © 2016年 WangQitai. All rights reserved.
//

#import "QTNavigationController.h"

@interface QTNavigationController ()

@end

@implementation QTNavigationController

+ (void)initialize {
    UINavigationBar * bar = [UINavigationBar appearance];
    bar.barTintColor = [UIColor redColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"top_navigation_back"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"top_navigation_back_highlighted"] forState:UIControlStateHighlighted];
        btn.size = CGSizeMake(50, 30);
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}
- (void)back {
    [self popViewControllerAnimated:YES];
}
@end
