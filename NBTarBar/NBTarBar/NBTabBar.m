//
//  NBTabBar.m
//  NBTarBar
//
//  Created by BruceZCQ on 4/8/15.
//  Copyright (c) 2015 BruceZCQ. All rights reserved.
//

#import "NBTabBar.h"
#import "NBTabBarItem.h"

@interface NBTabBar()
{
    NSArray *_items_;
    UITabBarController *_tabBarController;
}
@end

@implementation NBTabBar

- (id)initWithUITabbarController:(UITabBarController *)tabbarController
                           items:(NSArray *)items
{
    if (self = [super init]) {
        self.frame = tabbarController.tabBar.bounds;
        [tabbarController.tabBar addSubview:self];
        
        _tabBarController = tabbarController;
        [self setItems:items];
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
        [item addTarget:self action:@selector(onSelectedItem:) forControlEvents:UIControlEventTouchUpInside];
        item.tag = idx;
        idx++;
    }
}

- (NSArray *)items
{
    return _items_;
}

- (void)onSelectedItem:(NBTabBarItem *)selectedItem
{
    _tabBarController.selectedIndex = selectedItem.tag;
    
    for (NBTabBarItem *item in _items_) {
        if ([selectedItem isEqual:item]) {
            item.selected = YES;
        }else{
            item.selected = NO;
        }
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedItemAtIndex:tabbar:)]) {
        [self.delegate didSelectedItemAtIndex:selectedItem.tag tabbar:self];
    }
}

@end
