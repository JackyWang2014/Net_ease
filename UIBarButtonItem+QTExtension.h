//
//  UIBarButtonItem+QTExtension.h
//  Budejie_jinghua
//
//  Created by 王亓泰 on 16/4/16.
//  Copyright © 2016年 WangQitai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (QTExtension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end
