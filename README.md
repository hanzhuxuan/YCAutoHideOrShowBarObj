###一行代码设置控制器的导航栏和tabBar栏的隐藏和显示

更新代码，改成直接传导航栏和tabBar栏

```
    /*--------------------------> 设置自动隐藏导航栏和tabBar栏 <------------------------*/
    [YCAutoHideOrShowBarObj setupNavBarorTabBarWithScrollView:self.tableView navigationBar:self.navigationController.navigationBar tabBar:self.tabBarController.tabBar];
```