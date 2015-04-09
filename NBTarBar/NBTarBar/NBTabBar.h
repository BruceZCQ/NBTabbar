//
//  NBTabBar.h
//  NBTarBar
//
//  Created by BruceZCQ on 4/8/15.
//  Copyright (c) 2015 BruceZCQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NBTabBar;
@class NBTabBarItem;

@protocol NBTabBarDelegate <NSObject>

- (void)didSelectedItemAtIndex:(NSUInteger)idx
                          item:(NBTabBarItem *)item
                        tabbar:(NBTabBar *)tabar;

@end

@interface NBTabBar : UIView

@property (nonatomic, weak) id<NBTabBarDelegate> delegate;
@property (nonatomic, retain) NSArray *items;
@property (nonatomic, retain) UIColor *selectedColor;
@property (nonatomic, retain) UIColor *color;

- (id)initWithUITabbarController:(UITabBarController *)tabbarController;

@end
