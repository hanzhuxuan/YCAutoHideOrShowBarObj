//
//  YCAutoHideOrShowBarObj.h
//  YCAutoHideShowNavBar
//
//  Created by xiaochong on 16/7/15.
//  Copyright © 2016年 尹冲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YCAutoHideOrShowBarObj : NSObject

+ (void)setupNavBarorTabBarWithScrollView:(UIScrollView *)scrollView NavigationVc:(UINavigationController *)navVc tabBarVc:(UITabBarController *)tabBarVc;

@end
