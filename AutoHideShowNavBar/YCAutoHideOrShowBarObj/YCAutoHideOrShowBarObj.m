//
//  YCAutoHideOrShowBarObj.m
//  YCAutoHideShowNavBar
//
//  Created by xiaochong on 16/7/15.
//  Copyright © 2016年 尹冲. All rights reserved.
//

#import "YCAutoHideOrShowBarObj.h"

@interface YCAutoHideOrShowBarObj () <UIScrollViewDelegate>
/**
 *  上一次的contentOfset的y值
 */
@property (nonatomic,strong) NSNumber *lastY;
/**
 *  开始拖拽时的位置
 */
@property (nonatomic,strong) NSNumber *originY;
/**
 *  需要隐藏的导航栏
 */
@property (nonatomic,strong) UINavigationBar *navBar;
/**
 *  需要隐藏的tabbar栏
 */
@property (nonatomic,strong) UITabBar *tabBar;

/**
 *  需要自动隐藏的tabBar栏的控制器
 */
@property (nonatomic,strong) UITabBarController *autoHideTabBarVc;

/**
 *  需要自动隐藏的navBar的控制器
 */
@property (nonatomic,strong) UINavigationController *autoHideNavigationVc;

@end

@implementation YCAutoHideOrShowBarObj

static id _instance = nil;
+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}
- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}

+ (void)setupNavBarorTabBarWithScrollView:(UIScrollView *)scrollView navigationBar:(UINavigationBar *)navBar tabBar:(UITabBar *)tabBar {
    YCAutoHideOrShowBarObj *obj = [self sharedInstance];
    obj.navBar = navBar;
    obj.tabBar = tabBar;
    scrollView.delegate = obj;
}

#pragma mark UIScrollViewDelegate
/**
 *  开始拖拽
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    self.originY = [NSNumber numberWithFloat:scrollView.contentOffset.y];
    self.lastY = [NSNumber numberWithFloat:scrollView.contentOffset.y];
    
}

/**
 *  正在拖拽
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
#pragma warning 控制器第一次显示的时候，会调用一次这个方法，而不调用上一个方法，所以要在这里做一层判断
    if (self.lastY == nil) { // lastY 代表 上一次的contentOfset的y值
        return;
    }
    
    CGFloat distance = scrollView.contentOffset.y - self.lastY.floatValue;
    
    if (distance >= 0) {
        if (self.navBar.frame.origin.y <= -44) {
            self.navBar.transform = CGAffineTransformMakeTranslation(0, -64);
            self.tabBar.transform = CGAffineTransformMakeTranslation(0, 49);
            return;
        }
    } else {
        if (self.navBar.frame.origin.y >= 20) {
            self.navBar.transform = CGAffineTransformMakeTranslation(0, 0);
            self.tabBar.transform = CGAffineTransformMakeTranslation(0, 0);
            return;
        }
    }
    
    self.lastY = [NSNumber numberWithFloat:scrollView.contentOffset.y];
    if(scrollView.contentOffset.y - self.originY.floatValue > 64 && self.originY != nil) {
        self.navBar.transform = CGAffineTransformMakeTranslation(0, -64);
        self.tabBar.transform = CGAffineTransformMakeTranslation(0, 49);
    } else if(self.originY.floatValue - scrollView.contentOffset.y > 64 && self.originY != nil){
        self.navBar.transform = CGAffineTransformIdentity;
        self.tabBar.transform = CGAffineTransformIdentity;
    } else {
        self.navBar.transform = CGAffineTransformTranslate(self.navBar.transform, 0, -distance);
        self.tabBar.transform = CGAffineTransformTranslate(self.tabBar.transform, 0, distance);
    }
    
}

/**
 *  拖拽完了
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self hideOrHiddenNavBar:scrollView];
    self.lastY = nil;
    self.originY = nil;
}

/**
 *  减速完了
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self hideOrHiddenNavBar:scrollView];
    self.lastY = nil;
    self.originY = nil;
}

/**
 *  拖拽都停止了，调用这个方法，判断显示和隐藏
 */
- (void)hideOrHiddenNavBar:(UIScrollView *)scrollView {
    CGFloat navY = self.navBar.frame.origin.y;
    if (navY == 20 || navY == -44) {
        return;
    }
    if (navY > -11) {
        [UIView animateWithDuration:0.3 animations:^{
            self.navBar.transform = CGAffineTransformMakeTranslation(0, 0);
            self.tabBar.transform = CGAffineTransformMakeTranslation(0, 0);
        }];
        
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            self.navBar.transform = CGAffineTransformMakeTranslation(0, -64);
            self.tabBar.transform = CGAffineTransformMakeTranslation(0, 49);
        }];
        if (scrollView.contentOffset.y < 0) {
            [scrollView setContentOffset:CGPointMake(0, 0)];
        }
    }
}

@end
