//
//  NBTabBar.m
//  NBTarBar
//
//  Created by BruceZCQ on 4/8/15.
//  Copyright (c) 2015 BruceZCQ. All rights reserved.
//

#import "NBTabBar.h"
#import "NBTabBarItem.h"

@interface NBTabBar()<NBTabBarItemDelegate>
{
    NSArray *_items_;
    UITabBarController *_tabBarController;
}
@end

@implementation NBTabBar

- (id)initWithUITabbarController:(UITabBarController *)tabbarController
{
    if (self = [super init]) {
        self.frame = tabbarController.tabBar.bounds;
        [tabbarController.tabBar addSubview:self];
        
        _tabBarController = tabbarController;
    }
    return self;
}

- (void)setItems:(NSArray *)items
{
    _items_ = items;
    
    CGFloat itemWidth = self.bounds.size.width/_items_.count;
    CGFloat yOffset = 10;
    CGFloat itemHeight = self.bounds.size.height - yOffset;
    
    NSUInteger idx = 0;
    for (NBTabBarItem *item in items) {
        // first selected
        if (idx == 0) {
            item.selected = YES;
        }
        item.frame = CGRectMake(itemWidth*idx, yOffset/2, itemWidth, itemHeight);
        [self addSubview:item];
        item.tag = idx;
        item.delegate = self;
        idx++;
    }
}

- (NSArray *)items
{
    return _items_;
}

- (void)setSelectedColor:(UIColor *)selectedColor
{
    for (NBTabBarItem *item in _items_) {
        item.selectedColor = selectedColor;
    }
}

- (void)setColor:(UIColor *)color
{
    for (NBTabBarItem *item in _items_) {
        item.color = color;
    }
}

#pragma mark - NBTabBarItemDelegate

- (void)didSelectedItem:(NBTabBarItem *)item
{
    //selected
    if (_tabBarController.selectedIndex == item.tag) {
        return;
    }
    
    _tabBarController.selectedIndex = item.tag;
    
    for (NBTabBarItem *i in _items_) {
        if ([i isEqual:item]) {
            i.selected = YES;
        }else{
            i.selected = NO;
        }
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedItemAtIndex:item:tabbar:)]) {
        [self.delegate didSelectedItemAtIndex:item.tag item:item tabbar:self];
    }
}

@end
