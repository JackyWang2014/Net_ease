//
//  NewsViewController.m
//  Net_ease
//
//  Created by 王亓泰 on 16/4/17.
//  Copyright © 2016年 WangQitai. All rights reserved.
//

#import "NewsViewController.h"
#import "HeaderController.h"
#import "EntertainmentController.h"
#import "HotController.h"
#import "SportsController.h"
#import "LocalController.h"
@interface NewsViewController ()<UIScrollViewDelegate>
/** 顶部的所有标签*/
@property (nonatomic,weak) UIView *titlesView;
/** 选中的Button*/
@property (nonatomic,weak) UIButton *selectedButton;
/** 内容视图*/
@property (nonatomic,weak) UIScrollView *contentView;
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupChildVcs];
    [self setupTitlesView];
    [self setupContentView];
}


- (void)setupTitlesView {
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    titlesView.width = self.view.width;
    titlesView.height = 35;
    titlesView.y = 64;
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
    
    
    NSArray *titles = @[@"头条", @"娱乐", @"热点", @"体育", @"北京"];
    
    CGFloat width = titlesView.width / titles.count;
    CGFloat height = titlesView.height;
    
    for (NSInteger i = 0; i < titles.count; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.tag = i;
        button.height = height;
        button.width = width;
        button.x = i * width;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:button];
    
        // 默认点击了第一个button
        if (i == 0) {
            button.enabled = NO;
            self.selectedButton = button;
            button.titleLabel.font = [UIFont systemFontOfSize:18];
        }
    }
}

- (void)titleClick:(UIButton *)btn {
    UIButton *preBtn = _selectedButton;
    [UIView animateWithDuration:0.5 animations:^{
        _selectedButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _selectedButton = btn;
        _selectedButton.titleLabel.font = [UIFont systemFontOfSize:18];
        
    } completion:^(BOOL finished) {
        preBtn.enabled = YES;
        _selectedButton.enabled = NO;
    }];
    
    CGPoint offset = self.contentView.contentOffset;
    offset.x = btn.tag * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
}

- (void)setupChildVcs {
    HeaderController *hc = [[HeaderController alloc] init];
    [self addChildViewController:hc];
    
    EntertainmentController *ec = [[EntertainmentController alloc] init];
    [self addChildViewController:ec];
    
    HotController *hotc = [[HotController alloc] init];
    [self addChildViewController:hotc];
    
    SportsController *sc = [[SportsController alloc] init];
    [self addChildViewController:sc];
    
    LocalController *lc = [[LocalController alloc] init];
    [self addChildViewController:lc];
}

- (void)setupContentView {
    UIScrollView *contentView = [[UIScrollView alloc] init];
    self.contentView = contentView;
    contentView.frame = self.view.bounds;
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
//    contentView.backgroundColor = [UIColor redColor];
    [self.view insertSubview:contentView atIndex:0];
    contentView.contentSize = CGSizeMake(self.childViewControllers.count * contentView.width, 0);
    
    [self scrollViewDidEndScrollingAnimation:contentView];
}

#pragma mark ScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    UITableViewController *vc = self.childViewControllers[index];
    vc.view.x = scrollView.contentOffset.x;
    CGFloat hMax = CGRectGetMaxY(self.titlesView.frame);
    vc.view.y = hMax - 64;
    vc.view.height = scrollView.height;
    
    CGFloat bottom = self.tabBarController.tabBar.height;
    CGFloat top = CGRectGetMaxY(self.titlesView.frame);
    
    vc.tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
    [scrollView addSubview:vc.view];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidEndScrollingAnimation:scrollView];
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self titleClick:self.titlesView.subviews[index]];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NewsViewController *nvc = [[NewsViewController alloc] init];
//    [self.navigationController pushViewController:nvc animated:YES];
//}
@end
