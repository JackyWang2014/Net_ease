
//
//  QTTabbarController.m
//  Net_ease
//
//  Created by 王亓泰 on 16/4/17.
//  Copyright © 2016年 WangQitai. All rights reserved.
//

#import "QTTabbarController.h"
#import "NewsViewController.h"
#import "ReadingViewController.h"
#import "VideoViewController.h"
#import "TopicViewController.h"
#import "MeViewController.h"
#import "QTNavigationController.h"
@interface QTTabbarController ()

@end

@implementation QTTabbarController

+ (void)initialize {
    
    // 通过appearance统一设置所有UITabBarItem的文字属性
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

   
    
    [self setupChildVc:[[NewsViewController alloc] init] title:@"新闻" image:@"tabbar_icon_news_normal" selectedImage:@"tabbar_icon_news_highlight"];
  

    [self setupChildVc:[[ReadingViewController alloc] init] title:@"阅读" image:@"tabbar_icon_reader_normal" selectedImage:@"tabbar_icon_reader_highlight"];
    
    [self setupChildVc:[[ReadingViewController alloc] init] title:@"视听" image:@"tabbar_icon_media_normal" selectedImage:@"tabbar_icon_news_highlight"];
    
    [self setupChildVc:[[ReadingViewController alloc] init] title:@"话题" image:@"tabbar_icon_bar_normal" selectedImage:@"tabbar_icon_bar_highlight"];
    
    [self setupChildVc:[[ReadingViewController alloc] init] title:@"我" image:@"tabbar_icon_me_normal" selectedImage:@"tabbar_icon_me_highlight"];
}

- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    // 添加子控制器
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    QTNavigationController *nc = [[QTNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
