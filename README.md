###使用宏定义的形式实现导航栏和tabBar栏的自动隐藏和显示


下面的这个方法不用了，请使用最新的方法

```
    /*--------------------------> 设置自动隐藏导航栏和tabBar栏 <------------------------*/
    [YCAutoHideOrShowBarObj setupNavBarorTabBarWithScrollView:self.tableView navigationBar:self.navigationController.navigationBar tabBar:self.tabBarController.tabBar];
```

###最新的方法

1.在.h文件中敲入代码: `YCAutoHideOrShowTonProperty
`

2.在.m文件中敲入代码: `YCAutoHideOrShowTonMethod(self.navigationController.navigationBar, self.tabBarController.tabBar)
`