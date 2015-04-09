//
//  NBTabBarItem.h
//  NSTabbar
//
//  Created by BruceZCQ on 4/8/15.
//  Copyright (c) 2015 BruceZCQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NBTabBarItem;

@protocol NBTabBarItemDelegate <NSObject>
- (void)didSelectedItem:(NBTabBarItem *)item;
@end

@interface NBTabBarItem : UIView

@property (nonatomic, copy)  NSString *badgeValue;
@property (nonatomic, retain) UIColor *badgeColor;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) UIImage *selectedImage;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) UIColor *selectedColor;
@property (nonatomic, retain) UIColor *color;
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, weak) id<NBTabBarItemDelegate> delegate;

@end
