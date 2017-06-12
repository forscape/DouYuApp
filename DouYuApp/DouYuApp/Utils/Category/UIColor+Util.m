//
//  UIColor+Util.m
//  DouYuApp
//
//  Created by ethan on 17/6/12.
//  Copyright © 2017年 ethan. All rights reserved.
//

#import "UIColor+Util.h"

@implementation UIColor (Util)

+(UIColor*)colorWithRGBA:(NSUInteger)color
{
    return [UIColor colorWithRed:((color>>24)&0xFF)/255.0
                           green:((color>>16)&0xFF)/255.0
                            blue:((color>>8)&0xFF)/255.0
                           alpha:((color)&0xFF)/255.0];
}


+ (UIColor *)colorWithString:(NSString *)string
{
    NSInteger c = 0;
    sscanf([string UTF8String], "%lx", &c);
    return [UIColor colorWithRGBA:c];
}

+ (UIColor*) inverseColor:(UIColor *)color
{
    CGFloat r,g,b,a;
    [color getRed:&r green:&g blue:&b alpha:&a];
    if (r < 0.5 && g< 0.5 && b < 0.5) {
        return [UIColor whiteColor];
    }
    return [UIColor colorWithRed:1.-r green:1.-g blue:1.-b alpha:a];
}

+ (UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:0.8];
    
    return color;
}

+ (UIColor *)randomColorWithCacheKey:(NSString *)key
{
    NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
    NSString * hueKey = [NSString stringWithFormat:@"hue:%@",key];
    NSString * saturationKey = [NSString stringWithFormat:@"hue:%@",key];
    NSString * brightnessKey = [NSString stringWithFormat:@"hue:%@",key];
    
    CGFloat hue = [ud floatForKey:hueKey];
    CGFloat saturation = [ud floatForKey:saturationKey];
    CGFloat brightness = [ud floatForKey:brightnessKey];
    
    if (hue && saturation && brightness) {
        
        UIColor * randomColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:0.8];
        return randomColor;
        
    }else{
        
        UIColor * randomColor = [UIColor randomColor];
        BOOL resultValue = [randomColor getHue:&hue saturation:&saturation brightness:&brightness alpha:nil];
        
        if (resultValue) {
            
            [ud setFloat:hue forKey:hueKey];
            [ud setFloat:saturation forKey:saturationKey];
            [ud setFloat:brightness forKey:brightnessKey];
            [ud synchronize];
        }
        return randomColor;
    }
}

@end
