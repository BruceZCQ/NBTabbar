//
//  NBTabBarItem.h
//  NSTabbar
//
//  Created by BruceZCQ on 4/8/15.
//  Copyright (c) 2015 BruceZCQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NBTabBarItem : UIButton

@property (nonatomic,copy)  NSString *badgeValue;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) UIImage *selectedImage;
@property (nonatomic, retain) NSString *title;

@end
