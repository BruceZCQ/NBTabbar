//
//  NBTabBar.h
//  NBTarBar
//
//  Created by BruceZCQ on 4/8/15.
//  Copyright (c) 2015 BruceZCQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NBTabBar;

@protocol NBTabBarDelegate <NSObject>

- (void)didSelectedItemAtIndex:(NSUInteger)idx tabbar:(NBTabBar *)tabar;

@end

@interface NBTabBar : UIView

@property (nonatomic, weak) id<NBTabBarDelegate> delegate;

- (id)initWithUITabbarController:(UITabBarController *)tabbarController
                           items:(NSArray *)items;

@end
