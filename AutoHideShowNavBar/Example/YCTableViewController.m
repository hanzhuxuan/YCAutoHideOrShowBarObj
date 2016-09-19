//
//  YCTableViewController.m
//  AutoHideShowNavBar
//
//  Created by xiaochong on 16/7/14.
//  Copyright © 2016年 尹冲. All rights reserved.
//

#import "YCTableViewController.h"
//#import "YCAutoHideOrShowBarObj.h"

#import "YCAutoHideOrShowTon.h"

@interface YCTableViewController ()

YCAutoHideOrShowTonProperty

@end

@implementation YCTableViewController

YCAutoHideOrShowTonMethod(self.navigationController.navigationBar, self.tabBarController.tabBar)


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"自动隐藏Bar";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
#warning 这个是之前采用的方法，但是扩展性不好，遂废弃，请采用最新的方法
    /*--------------------------> 设置自动隐藏导航栏和tabBar栏 <------------------------*/
//    [YCAutoHideOrShowBarObj setupNavBarorTabBarWithScrollView:self.tableView navigationBar:self.navigationController.navigationBar tabBar:self.tabBarController.tabBar];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = @"测试";
    [self.navigationController pushViewController:vc animated:YES];
}



@end
