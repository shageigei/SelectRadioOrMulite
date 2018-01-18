//
//  UIView+DBExtension.m
//  单选和多选
//
//  Created by lang on 2018/1/10.
//  Copyright © 2018年 lang. All rights reserved.
//

#import "UIView+DBExtension.h"

@implementation UIView (DBExtension)

// set
- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
// get
- (CGFloat)x {
    return self.frame.origin.x;
}
- (CGFloat)y {
    return self.frame.origin.y;
}
- (CGFloat)centerX {
    return self.center.x;
}
- (CGFloat)centerY {
    return self.center.y;
}
- (CGFloat)width {
    return self.frame.size.width;
}
- (CGFloat)height {
    return self.frame.size.height;
}
- (CGSize)size {
    return self.frame.size;
}
- (CGPoint)origin {
    return self.frame.origin;
}

@end
