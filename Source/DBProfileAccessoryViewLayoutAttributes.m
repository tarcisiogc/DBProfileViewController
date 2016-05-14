//
//  DBProfileAccessoryViewLayoutAttributes.m
//  DBProfileViewController
//
//  Created by Devon Boyer on 2016-04-15.
//  Copyright (c) 2015 Devon Boyer. All rights reserved.
//

#import "DBProfileAccessoryViewLayoutAttributes.h"
#import "DBProfileAccessoryViewLayoutAttributes_Private.h"

@implementation DBProfileAccessoryViewLayoutAttributes

+ (NSArray<NSString *> *)keyPathsForBindings
{
    // FIXME: `transform` and `z-index` cannot be bindings since invalidating the layout attributes may change the `z-index` and `transform` which will end up causing an infinite loop.
    // Ideally we want the layout attributes to tell the controll how to layout accessory views, not the other way around.
    return @[NSStringFromSelector(@selector(hidden)),
             NSStringFromSelector(@selector(alpha))];
}

+ (instancetype)layoutAttributesForAccessoryViewOfKind:(NSString *)accessoryViewKind
{
    DBProfileAccessoryViewLayoutAttributes *layoutAttributes = [[[self class] alloc] initWithAccessoryViewKind:accessoryViewKind];
    return layoutAttributes;
}

- (instancetype)initWithAccessoryViewKind:(NSString *)accessoryViewKind
{
    self = [super init];
    if (self) {
        _representedAccessoryKind = accessoryViewKind;

        self.hidden = NO;
        self.alpha = 1.0;
        self.transform = CGAffineTransformIdentity;
        self.zIndex = 0;
    }
    return self;
}

#pragma mark - Constraint Based Layout Attributes

- (void)uninstallConstraints {
    self.hasInstalledConstraints = NO;
    self.leadingConstraint = nil;
    self.trailingConstraint = nil;
    self.leftConstraint = nil;
    self.rightConstraint = nil;
    self.topConstraint = nil;
    self.bottomConstraint = nil;
    self.widthConstraint = nil;
    self.heightConstraint = nil;
    self.centerXConstraint = nil;
    self.centerYConstraint = nil;
    self.firstBaselineConstraint = nil;
    self.lastBaselineConstraint = nil;
}

#pragma mark - NSObject

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[self class]]) return NO;
    DBProfileAccessoryViewLayoutAttributes *otherObject = (DBProfileAccessoryViewLayoutAttributes *)object;
    return
    [self.representedAccessoryKind isEqual:otherObject.representedAccessoryKind] &&
    CGAffineTransformEqualToTransform(self.transform, otherObject.transform) &&
    self.hidden == otherObject.hidden &&
    self.alpha == otherObject.alpha &&
    self.zIndex == otherObject.zIndex &&
    self.hasInstalledConstraints == otherObject.hasInstalledConstraints;

}

@end
