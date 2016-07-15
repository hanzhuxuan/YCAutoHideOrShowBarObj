
//
//  YCTabBarViewController.m
//  斗鱼TVimitation
//
//  Created by xiaochong on 16/7/12.
//  Copyright © 2016年 尹冲. All rights reserved.
//

#import "YCTabBarViewController.h"
#import "YCTableViewController.h"

@interface YCTabBarViewController ()

@end

@implementation YCTabBarViewController

+ (void)initialize {

}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 初始化子控制器
    [self setupChildViewControllers];
    self.selectedIndex = 0;
    
}

- (void)setupChildViewControllers {
    
    YCTableViewController *homeVc = [[YCTableViewController alloc] init];
    [self addChileVcWithTitle:@"自动隐藏Bar" vc:homeVc imageName:@"btn_home_normal_24x24_" selImageName:@"btn_home_selected_24x24_"];
    
}

- (void)addChileVcWithTitle:(NSString *)title vc:(UIViewController *)vc imageName:(NSString *)imageName selImageName:(NSString *)selImageName {
    [vc.tabBarItem setTitle:title];
    [vc.tabBarItem setImage:[UIImage imageNamed:imageName]];
    [vc.tabBarItem setSelectedImage:[UIImage imageNamed:selImageName]];
    UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:navVc];
}
@end
