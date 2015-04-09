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
    aNav.title = @"AVC";
    aNav.tabBarItem.image = [UIImage imageNamed:@"setting"];
    aNav.tabBarItem.selectedImage = [UIImage imageNamed:@"setting_selected"];
    
    BViewController *bVc = [BViewController new];
    UINavigationController *bNav = [[UINavigationController alloc] initWithRootViewController:bVc];
    bVc.title = @"bVc";
    bNav.title = @"BVC";
    bNav.tabBarItem.image = [UIImage imageNamed:@"trash"];
    bNav.tabBarItem.selectedImage = [UIImage imageNamed:@"trash_selected"];
    
    BViewController *cVc = [BViewController new];
    UINavigationController *cNav = [[UINavigationController alloc] initWithRootViewController:cVc];
    cVc.title = @"CVC";
    cNav.tabBarItem.image = [UIImage imageNamed:@"trash"];
    cNav.tabBarItem.selectedImage = [UIImage imageNamed:@"trash_selected"];
    
    BViewController *dVc = [BViewController new];
    UINavigationController *dNav = [[UINavigationController alloc] initWithRootViewController:cVc];
    dVc.title = @"DVC";
    dNav.tabBarItem.image = [UIImage imageNamed:@"trash"];
    dNav.tabBarItem.selectedImage = [UIImage imageNamed:@"trash_selected"];
    self.viewControllers = @[aNav,bNav,cNav,dNav];
}

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

#pragma mark - NBTabBarDelegate

- (void)didSelectedItemAtIndex:(NSUInteger)idx item:(NBTabBarItem *)item tabbar:(NBTabBar *)tabar
{
    
}

@end
