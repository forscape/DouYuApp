//
//  UIColor+Util.h
//  DouYuApp
//
//  Created by ethan on 17/6/12.
//  Copyright © 2017年 ethan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)

+(UIColor *)colorWithRGBA:(NSUInteger)color;
+(UIColor *)colorWithString:(NSString *)string;
+(UIColor *)inverseColor:(UIColor *)color;
+(UIColor *)randomColor;
+(UIColor *)randomColorWithCacheKey:(NSString *)key;

@end
