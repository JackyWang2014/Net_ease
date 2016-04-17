//
//  UIBarButtonItem+QTExtension.m
//  Budejie_jinghua
//
//  Created by 王亓泰 on 16/4/16.
//  Copyright © 2016年 WangQitai. All rights reserved.
//

#import "UIBarButtonItem+QTExtension.h"

@implementation UIBarButtonItem (QTExtension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
    
    
}
@end
