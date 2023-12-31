//
//  CurrentLocationIcons.m
//  CLMMapKitLiteDemo
//
//  Created by Malcolm Toon on 12/30/23.
//

#import "CurrentLocationIcons.h"

@implementation CurrentLocationIcons

+(UIImage *)currentLocationDot {
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(64, 64), NO, 0.0);

    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* sUPERLightGray = [UIColor colorWithRed: 0.921 green: 0.921 blue: 0.921 alpha: 1];
    UIColor* color17 = [UIColor colorWithRed: 0.243 green: 0.486 blue: 0.847 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0.245 green: 0.488 blue: 0.845 alpha: 0.191];

    //// Gradient Declarations
    CGFloat gradientLocations[] = {0, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(NULL, (__bridge CFArrayRef)@[(id)color17.CGColor, (id)gradientColor.CGColor], gradientLocations);

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(32, 2)];
    [bezierPath addCurveToPoint: CGPointMake(17, 10) controlPoint1: CGPointMake(22, 2) controlPoint2: CGPointMake(17, 10)];
    [bezierPath addLineToPoint: CGPointMake(27.08, 26.73)];
    [bezierPath addLineToPoint: CGPointMake(32, 25)];
    [bezierPath addLineToPoint: CGPointMake(36.92, 26.71)];
    [bezierPath addLineToPoint: CGPointMake(47, 10)];
    [bezierPath addCurveToPoint: CGPointMake(32, 2) controlPoint1: CGPointMake(47, 10) controlPoint2: CGPointMake(42, 2)];
    [bezierPath closePath];
    CGContextSaveGState(context);
    [bezierPath addClip];
    CGContextDrawLinearGradient(context, gradient, CGPointMake(32, 26.73), CGPointMake(32, 2), kNilOptions);
    CGContextRestoreGState(context);


    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(25, 25, 14, 14)];
    [color17 setFill];
    [ovalPath fill];
    [sUPERLightGray setStroke];
    ovalPath.lineWidth = 2;
    [ovalPath stroke];


    //// Cleanup
    CGGradientRelease(gradient);

    
    
    
    
    UIImage *i = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return i;

    
    
}


@end
