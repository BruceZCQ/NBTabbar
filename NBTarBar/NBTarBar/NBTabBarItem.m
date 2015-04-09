//
//  NBTabBarItem.m
//  NSTabbar
//
//  Created by BruceZCQ on 4/8/15.
//  Copyright (c) 2015 BruceZCQ. All rights reserved.
//

#import "NBTabBarItem.h"

#define kItemIconSize   40
#define kColor [UIColor grayColor]

@interface NBTabBarItem()
{
    UIImageView *_imageView;
    UILabel *_titleView;
    UIColor *_selectedColor;
    UIColor *_color;
    UIImage *_selectedImage;
    UIImage *_image;
    BOOL _selected;
    UITapGestureRecognizer *_tap;
    UILabel *_badgeView;
    NSString *_badgeValue;
}
@end

@implementation NBTabBarItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        _imageView = [UIImageView new];
        _imageView.backgroundColor = [UIColor clearColor];
//        _imageView.adjustsImageWhenHighlighted = NO;
        [self addSubview:_imageView];
        _titleView = [UILabel new];
        _titleView.backgroundColor = [UIColor clearColor];
        _titleView.textAlignment = NSTextAlignmentCenter;
        _titleView.font = [UIFont systemFontOfSize:10.f];
       
        _badgeView = [UILabel new];
        _badgeView.backgroundColor = [UIColor redColor];
        _badgeView.textAlignment = NSTextAlignmentCenter;
        _badgeView.font = [UIFont systemFontOfSize:8.f];
        _badgeView.textColor = [UIColor whiteColor];
        _badgeView.layer.cornerRadius = 5.0f;
        _badgeView.clipsToBounds = YES;
        _badgeView.hidden = YES;
        [_imageView addSubview:_badgeView];
        self.color = kColor;
        [self addAction];
        [self addSubview:_titleView];
    }
    return self;
}

- (void)addAction
{
    self.userInteractionEnabled = YES;
    
    _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapAction)];
    [self addGestureRecognizer:_tap];
}

- (void)setBadgeColor:(UIColor *)badgeColor
{
    _badgeView.backgroundColor = badgeColor;
}

- (UIColor *)badgeColor
{
    return _badgeView.backgroundColor;
}

- (void)setSelectedColor:(UIColor *)selectedColor
{
    _selectedColor = selectedColor;
    
    _titleView.textColor = selectedColor;
}

- (UIColor *)selectedColor
{
    return _selectedColor;
}

- (void)setColor:(UIColor *)color
{
    _color = color;
    _titleView.textColor = color;
}

- (UIColor *)color
{
    return _color;
}

- (void)setTitle:(NSString *)title
{
    _titleView.text = title;
}

- (NSString *)title
{
    return _titleView.text;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    [self updateImage];
}

- (UIImage *)image
{
    return _image;
}

- (void)setSelectedImage:(UIImage *)selectedImage
{
    _selectedImage = selectedImage;
}

- (UIImage *)selectedImage
{
    return _selectedImage;
}

- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    [self updateImage];
}

- (BOOL)selected
{
    return _selected;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = badgeValue;
    if (_badgeValue == nil) {
        _badgeView.hidden = YES;
    }
    _badgeView.text = _badgeValue;
    _badgeView.hidden = NO;
}

- (NSString *)badgeValue
{
    return _badgeValue;
}

- (void)updateImage
{
    if (self.selected) {
        _imageView.image = _selectedImage;
    }else{
        _imageView.image = _image;
    }
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    
    CGRect imageFrame = CGRectMake((width-kItemIconSize)/2, (height-kItemIconSize)/2-5.f, kItemIconSize, kItemIconSize);
    _imageView.frame = imageFrame;
    
    _badgeView.frame = CGRectMake(_imageView.bounds.size.width-15, 5.f, 10, 10);
   CGRect titleFrame =  CGRectMake(0, height-8.f, width, 11.f);
    _titleView.frame = titleFrame;
}

- (void)dealloc
{
    _imageView = nil;
    _titleView = nil;
    _tap = nil;
}

#pragma mark - Actions

- (void)onTapAction
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedItem:)]) {
        [self.delegate didSelectedItem:self];
    }
}

@end
