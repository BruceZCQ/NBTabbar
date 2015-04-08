//
//  NBTabBarItem.m
//  NSTabbar
//
//  Created by BruceZCQ on 4/8/15.
//  Copyright (c) 2015 BruceZCQ. All rights reserved.
//

#import "NBTabBarItem.h"

@implementation NBTabBarItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tintColor = [UITabBar appearance].tintColor;
        self.titleLabel.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)setImage:(UIImage *)image
{
    [self setImage:image forState:UIControlStateNormal];
}

- (UIImage *)image
{
    return [self imageForState:UIControlStateNormal];
}

- (void)setSelectedImage:(UIImage *)selectedImage
{
    [self setImage:selectedImage forState:UIControlStateSelected];
}

- (UIImage *)selectedImage
{
    return [self imageForState:UIControlStateSelected];
}

- (void)setTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
}

- (NSString *)title
{
    return [self titleForState:UIControlStateNormal];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
}

@end
