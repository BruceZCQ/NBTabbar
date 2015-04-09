# NBTabbar

在原有的系统 UITabBar 的基础上自定义了 TabBarItem, badge.
系统的badge 太大.而且不能修改其对应的颜色.

###使用方式
```
- (void)setViewControllers:(NSArray *)viewControllers
{
    [super setViewControllers:viewControllers];
    
    
    NSMutableArray *tabBarItems = [NSMutableArray array];
    NSUInteger idx = 0;
    for (UIViewController *vc in viewControllers) {
        NBTabBarItem *item = [NBTabBarItem new];
        item.image = vc.tabBarItem.image;
        item.selectedImage = vc.tabBarItem.selectedImage;
        item.title = vc.title;
        [tabBarItems addObject:item];
        vc.tabBarItem.image = nil;
        vc.tabBarItem.selectedImage = nil;
        vc.title = nil;
        if (idx == 0) {
            item.badgeValue = @"";
        }else if(idx == 2){
            item.badgeValue = @"21";
        }
        idx++;
    }
    
    _tabbar = [[NBTabBar alloc] initWithUITabbarController:self];
    _tabbar.items = [NSArray arrayWithArray:tabBarItems];
    _tabbar.backgroundColor = [UIColor clearColor];
    _tabbar.delegate = self;
}

```

效果图
 ![image](https://github.com/BruceZCQ/NBTabbar/raw/master/screenshot.png)