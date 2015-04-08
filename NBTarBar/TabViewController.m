//
//  TabViewController.m
//  NBTarBar
//
//  Created by BruceZCQ on 4/8/15.
//  Copyright (c) 2015 BruceZCQ. All rights reserved.
//

#import "TabViewController.h"
#import "NBTarBar/NBTabBarItem.h"
#import "NBTarBar/NBTabBar.h"

#import "ViewController.h"
#import "BViewController.h"

@interface TabViewController ()<NBTabBarDelegate>
{
    NBTabBar *_tabbar;
}
@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    ViewController *aVc = [ViewController new];
    UINavigationController *aNav = [[UINavigationController alloc] initWithRootViewController:aVc];
    aVc.title = @"aVc";
    aNav.title = @"adsa";
    aNav.tabBarItem.image = [UIImage imageNamed:@"setting"];
    aNav.tabBarItem.selectedImage = [UIImage imageNamed:@"setting_selected"];
    BViewController *bVc = [BViewController new];
    bVc.title = @"bVc";
    bVc.tabBarItem.image = [UIImage imageNamed:@"trash"];
    bVc.tabBarItem.selectedImage = [UIImage imageNamed:@"trash_selected"];
    BViewController *cVc = [BViewController new];
    cVc.title = @"cVc";
    cVc.tabBarItem.image = [UIImage imageNamed:@"trash"];
    cVc.tabBarItem.selectedImage = [UIImage imageNamed:@"trash_selected"];
    BViewController *dVc = [BViewController new];
    dVc.title = @"cVc";
    dVc.tabBarItem.image = [UIImage imageNamed:@"trash"];
    dVc.tabBarItem.selectedImage = [UIImage imageNamed:@"trash_selected"];
    self.viewControllers = @[aNav,bVc,cVc,dVc];
}

- (void)setViewControllers:(NSArray *)viewControllers
{
    [super setViewControllers:viewControllers];
    
    
    NSMutableArray *tabBarItems = [NSMutableArray array];
    for (UIViewController *vc in viewControllers) {
        NBTabBarItem *item = [NBTabBarItem new];
        item.image = vc.tabBarItem.image;
        item.selectedImage = vc.tabBarItem.selectedImage;
//        item.title = vc.title;
        [tabBarItems addObject:item];
    }
    
    _tabbar = [[NBTabBar alloc] initWithUITabbarController:self items:[NSArray arrayWithArray:tabBarItems]];
//    _tabbar.backgroundColor = [UIColor whiteColor];
    _tabbar.delegate = self;
}

#pragma mark - NBTabBarDelegate

- (void)didSelectedItemAtIndex:(NSUInteger)idx tabbar:(NBTabBar *)tabar
{
}

@end
