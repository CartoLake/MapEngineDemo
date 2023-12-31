//
//  TrafficIcons.m
//  CLMMapKitLiteDemo
//
//  Created by Malcolm Toon on 12/27/23.
//

#import "TrafficIcons.h"

@implementation TrafficIcons

+(UIImage *)singleEngine {
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(64, 64), NO, 0.0);

    
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 0.297 green: 0.627 blue: 0.768 alpha: 1];

    //// Bezier Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 1.25, 29.58);
    CGContextRotateCTM(context, -45 * M_PI/180);

    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(43.79, 30.93)];
    [bezierPath addLineToPoint: CGPointMake(31.83, 18.64)];
    [bezierPath addLineToPoint: CGPointMake(34.35, 16.06)];
    [bezierPath addCurveToPoint: CGPointMake(34.35, 14.55) controlPoint1: CGPointMake(34.75, 15.64) controlPoint2: CGPointMake(34.75, 14.97)];
    [bezierPath addLineToPoint: CGPointMake(36.38, 12.47)];
    [bezierPath addCurveToPoint: CGPointMake(35.48, 9.56) controlPoint1: CGPointMake(36.38, 12.47) controlPoint2: CGPointMake(36.74, 11.05)];
    [bezierPath addLineToPoint: CGPointMake(35.75, 9.28)];
    [bezierPath addLineToPoint: CGPointMake(36.09, 9.62)];
    [bezierPath addLineToPoint: CGPointMake(36.27, 9.45)];
    [bezierPath addCurveToPoint: CGPointMake(38.43, 12.24) controlPoint1: CGPointMake(36.72, 10.2) controlPoint2: CGPointMake(37.41, 11.2)];
    [bezierPath addCurveToPoint: CGPointMake(41.29, 14.55) controlPoint1: CGPointMake(39.5, 13.35) controlPoint2: CGPointMake(40.54, 14.09)];
    [bezierPath addCurveToPoint: CGPointMake(41.85, 13.97) controlPoint1: CGPointMake(41.65, 14.77) controlPoint2: CGPointMake(42.07, 14.35)];
    [bezierPath addCurveToPoint: CGPointMake(39.61, 11.03) controlPoint1: CGPointMake(41.41, 13.2) controlPoint2: CGPointMake(40.69, 12.14)];
    [bezierPath addCurveToPoint: CGPointMake(36.88, 8.81) controlPoint1: CGPointMake(38.59, 9.99) controlPoint2: CGPointMake(37.62, 9.27)];
    [bezierPath addLineToPoint: CGPointMake(37.06, 8.63)];
    [bezierPath addLineToPoint: CGPointMake(37.08, 8.65)];
    [bezierPath addCurveToPoint: CGPointMake(37.25, 8.65) controlPoint1: CGPointMake(37.12, 8.7) controlPoint2: CGPointMake(37.2, 8.7)];
    [bezierPath addLineToPoint: CGPointMake(37.39, 8.51)];
    [bezierPath addCurveToPoint: CGPointMake(37.39, 8.33) controlPoint1: CGPointMake(37.43, 8.46) controlPoint2: CGPointMake(37.43, 8.38)];
    [bezierPath addLineToPoint: CGPointMake(37.25, 8.19)];
    [bezierPath addCurveToPoint: CGPointMake(37.11, 7.39) controlPoint1: CGPointMake(37.37, 7.93) controlPoint2: CGPointMake(37.33, 7.6)];
    [bezierPath addCurveToPoint: CGPointMake(36.33, 7.25) controlPoint1: CGPointMake(36.9, 7.17) controlPoint2: CGPointMake(36.59, 7.12)];
    [bezierPath addLineToPoint: CGPointMake(36.19, 7.11)];
    [bezierPath addCurveToPoint: CGPointMake(36.02, 7.11) controlPoint1: CGPointMake(36.14, 7.06) controlPoint2: CGPointMake(36.07, 7.06)];
    [bezierPath addLineToPoint: CGPointMake(35.88, 7.25)];
    [bezierPath addCurveToPoint: CGPointMake(35.88, 7.42) controlPoint1: CGPointMake(35.83, 7.3) controlPoint2: CGPointMake(35.83, 7.38)];
    [bezierPath addLineToPoint: CGPointMake(35.9, 7.44)];
    [bezierPath addLineToPoint: CGPointMake(35.73, 7.62)];
    [bezierPath addCurveToPoint: CGPointMake(33.57, 4.83) controlPoint1: CGPointMake(35.28, 6.87) controlPoint2: CGPointMake(34.58, 5.87)];
    [bezierPath addCurveToPoint: CGPointMake(30.7, 2.52) controlPoint1: CGPointMake(32.49, 3.72) controlPoint2: CGPointMake(31.45, 2.98)];
    [bezierPath addCurveToPoint: CGPointMake(30.14, 3.1) controlPoint1: CGPointMake(30.34, 2.3) controlPoint2: CGPointMake(29.92, 2.72)];
    [bezierPath addCurveToPoint: CGPointMake(32.38, 6.04) controlPoint1: CGPointMake(30.58, 3.87) controlPoint2: CGPointMake(31.31, 4.93)];
    [bezierPath addCurveToPoint: CGPointMake(35.11, 8.26) controlPoint1: CGPointMake(33.4, 7.08) controlPoint2: CGPointMake(34.37, 7.79)];
    [bezierPath addLineToPoint: CGPointMake(34.93, 8.43)];
    [bezierPath addLineToPoint: CGPointMake(35.27, 8.78)];
    [bezierPath addLineToPoint: CGPointMake(35, 9.06)];
    [bezierPath addCurveToPoint: CGPointMake(32.16, 8.14) controlPoint1: CGPointMake(33.55, 7.76) controlPoint2: CGPointMake(32.16, 8.14)];
    [bezierPath addLineToPoint: CGPointMake(30.13, 10.23)];
    [bezierPath addCurveToPoint: CGPointMake(28.67, 10.23) controlPoint1: CGPointMake(29.73, 9.81) controlPoint2: CGPointMake(29.07, 9.81)];
    [bezierPath addLineToPoint: CGPointMake(26.15, 12.81)];
    [bezierPath addLineToPoint: CGPointMake(14.19, 0.53)];
    [bezierPath addCurveToPoint: CGPointMake(11.71, 0.53) controlPoint1: CGPointMake(13.5, -0.18) controlPoint2: CGPointMake(12.39, -0.18)];
    [bezierPath addLineToPoint: CGPointMake(7.44, 4.91)];
    [bezierPath addCurveToPoint: CGPointMake(7.44, 7.46) controlPoint1: CGPointMake(6.75, 5.62) controlPoint2: CGPointMake(6.75, 6.76)];
    [bezierPath addLineToPoint: CGPointMake(17.62, 17.91)];
    [bezierPath addLineToPoint: CGPointMake(17.62, 21.59)];
    [bezierPath addCurveToPoint: CGPointMake(7.54, 33.46) controlPoint1: CGPointMake(12.84, 26.61) controlPoint2: CGPointMake(9.63, 30.6)];
    [bezierPath addLineToPoint: CGPointMake(5.13, 33.46)];
    [bezierPath addLineToPoint: CGPointMake(4.32, 32.63)];
    [bezierPath addCurveToPoint: CGPointMake(0.5, 32.63) controlPoint1: CGPointMake(3.27, 31.55) controlPoint2: CGPointMake(1.56, 31.55)];
    [bezierPath addCurveToPoint: CGPointMake(0.5, 35.12) controlPoint1: CGPointMake(-0.17, 33.32) controlPoint2: CGPointMake(-0.17, 34.43)];
    [bezierPath addLineToPoint: CGPointMake(4.87, 39.6)];
    [bezierPath addCurveToPoint: CGPointMake(4.48, 40.69) controlPoint1: CGPointMake(4.62, 40.05) controlPoint2: CGPointMake(4.52, 40.45)];
    [bezierPath addCurveToPoint: CGPointMake(4.68, 40.9) controlPoint1: CGPointMake(4.46, 40.81) controlPoint2: CGPointMake(4.56, 40.92)];
    [bezierPath addCurveToPoint: CGPointMake(5.74, 40.5) controlPoint1: CGPointMake(4.92, 40.86) controlPoint2: CGPointMake(5.3, 40.76)];
    [bezierPath addLineToPoint: CGPointMake(10.11, 44.98)];
    [bezierPath addCurveToPoint: CGPointMake(12.53, 44.98) controlPoint1: CGPointMake(10.78, 45.67) controlPoint2: CGPointMake(11.86, 45.67)];
    [bezierPath addCurveToPoint: CGPointMake(12.53, 41.06) controlPoint1: CGPointMake(13.58, 43.9) controlPoint2: CGPointMake(13.58, 42.14)];
    [bezierPath addLineToPoint: CGPointMake(11.72, 40.23)];
    [bezierPath addLineToPoint: CGPointMake(11.72, 37.76)];
    [bezierPath addCurveToPoint: CGPointMake(23.28, 27.4) controlPoint1: CGPointMake(14.51, 35.61) controlPoint2: CGPointMake(18.39, 32.31)];
    [bezierPath addLineToPoint: CGPointMake(26.86, 27.4)];
    [bezierPath addLineToPoint: CGPointMake(37.04, 37.86)];
    [bezierPath addCurveToPoint: CGPointMake(39.52, 37.86) controlPoint1: CGPointMake(37.73, 38.56) controlPoint2: CGPointMake(38.84, 38.56)];
    [bezierPath addLineToPoint: CGPointMake(43.79, 33.47)];
    [bezierPath addCurveToPoint: CGPointMake(43.79, 30.93) controlPoint1: CGPointMake(44.48, 32.77) controlPoint2: CGPointMake(44.48, 31.63)];
    [bezierPath closePath];
    [color2 setFill];
    [bezierPath fill];
    [UIColor.blackColor setStroke];
    bezierPath.lineWidth = 0.5;
    bezierPath.miterLimit = 1;
    [bezierPath stroke];

    CGContextRestoreGState(context);

    
    
    UIImage *i = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return i;

}

+(UIImage *)commercialJet {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(64, 64), NO, 0.0);

    
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 0.297 green: 0.627 blue: 0.768 alpha: 1];

    //// Bezier Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, -2.75, 37.75);
    CGContextRotateCTM(context, -45 * M_PI/180);

    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(46.92, 7.75)];
    [bezierPath addCurveToPoint: CGPointMake(48.47, 0.43) controlPoint1: CGPointMake(46.92, 7.75) controlPoint2: CGPointMake(50.62, 2.84)];
    [bezierPath addCurveToPoint: CGPointMake(40.52, 3.01) controlPoint1: CGPointMake(48.47, 0.43) controlPoint2: CGPointMake(45.43, -1.55)];
    [bezierPath addLineToPoint: CGPointMake(32.29, 11.8)];
    [bezierPath addLineToPoint: CGPointMake(25.86, 10.19)];
    [bezierPath addLineToPoint: CGPointMake(26.81, 9.19)];
    [bezierPath addCurveToPoint: CGPointMake(26.78, 7.37) controlPoint1: CGPointMake(27.31, 8.68) controlPoint2: CGPointMake(27.29, 7.86)];
    [bezierPath addLineToPoint: CGPointMake(25.29, 5.93)];
    [bezierPath addCurveToPoint: CGPointMake(23.46, 5.97) controlPoint1: CGPointMake(24.77, 5.44) controlPoint2: CGPointMake(23.95, 5.46)];
    [bezierPath addLineToPoint: CGPointMake(20.66, 8.89)];
    [bezierPath addLineToPoint: CGPointMake(6.8, 5.42)];
    [bezierPath addCurveToPoint: CGPointMake(4.82, 7.66) controlPoint1: CGPointMake(6.8, 5.42) controlPoint2: CGPointMake(4.57, 5.51)];
    [bezierPath addLineToPoint: CGPointMake(23.03, 21.2)];
    [bezierPath addLineToPoint: CGPointMake(14.06, 30.43)];
    [bezierPath addLineToPoint: CGPointMake(1.81, 29.11)];
    [bezierPath addCurveToPoint: CGPointMake(0, 31.09) controlPoint1: CGPointMake(1.81, 29.11) controlPoint2: CGPointMake(-0.08, 30.15)];
    [bezierPath addLineToPoint: CGPointMake(8.83, 37.77)];
    [bezierPath addCurveToPoint: CGPointMake(7.87, 41.57) controlPoint1: CGPointMake(8.83, 37.77) controlPoint2: CGPointMake(7.14, 40.54)];
    [bezierPath addCurveToPoint: CGPointMake(11.63, 40.54) controlPoint1: CGPointMake(7.87, 41.57) controlPoint2: CGPointMake(8.69, 42.3)];
    [bezierPath addLineToPoint: CGPointMake(17.97, 49.5)];
    [bezierPath addCurveToPoint: CGPointMake(20.24, 46.94) controlPoint1: CGPointMake(17.97, 49.5) controlPoint2: CGPointMake(19.86, 48.39)];
    [bezierPath addLineToPoint: CGPointMake(18.71, 35.19)];
    [bezierPath addLineToPoint: CGPointMake(28.03, 26.63)];
    [bezierPath addLineToPoint: CGPointMake(41.34, 44.13)];
    [bezierPath addCurveToPoint: CGPointMake(43.02, 44.07) controlPoint1: CGPointMake(41.34, 44.13) controlPoint2: CGPointMake(41.9, 44.86)];
    [bezierPath addCurveToPoint: CGPointMake(43.74, 41.35) controlPoint1: CGPointMake(43.02, 44.07) controlPoint2: CGPointMake(44.42, 43.15)];
    [bezierPath addLineToPoint: CGPointMake(40.34, 28.85)];
    [bezierPath addLineToPoint: CGPointMake(43.55, 25.51)];
    [bezierPath addCurveToPoint: CGPointMake(43.51, 23.68) controlPoint1: CGPointMake(44.04, 25) controlPoint2: CGPointMake(44.02, 24.17)];
    [bezierPath addLineToPoint: CGPointMake(42.02, 22.25)];
    [bezierPath addCurveToPoint: CGPointMake(40.2, 22.28) controlPoint1: CGPointMake(41.51, 21.75) controlPoint2: CGPointMake(40.69, 21.77)];
    [bezierPath addLineToPoint: CGPointMake(38.92, 23.61)];
    [bezierPath addLineToPoint: CGPointMake(37.25, 17.5)];
    [bezierPath addLineToPoint: CGPointMake(46.92, 7.75)];
    [bezierPath closePath];
    [color2 setFill];
    [bezierPath fill];
    [UIColor.blackColor setStroke];
    bezierPath.lineWidth = 0.5;
    bezierPath.miterLimit = 1;
    [bezierPath stroke];

    CGContextRestoreGState(context);

    
    
    UIImage *i = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return i;
}

+(UIImage *)fighterJet {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(64, 64), NO, 0.0);

    
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 0.297 green: 0.627 blue: 0.768 alpha: 1];

    //// Bezier Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, -1.25, 38.5);
    CGContextRotateCTM(context, -45 * M_PI/180);

    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(13.85, 38.59)];
    [bezierPath addCurveToPoint: CGPointMake(13.84, 41.84) controlPoint1: CGPointMake(12.49, 39.74) controlPoint2: CGPointMake(13.06, 40.74)];
    [bezierPath addCurveToPoint: CGPointMake(16.56, 46.13) controlPoint1: CGPointMake(14.83, 43.21) controlPoint2: CGPointMake(15.73, 44.66)];
    [bezierPath addCurveToPoint: CGPointMake(19.36, 46.87) controlPoint1: CGPointMake(17.26, 47.37) controlPoint2: CGPointMake(18.4, 47)];
    [bezierPath addCurveToPoint: CGPointMake(20.02, 45.26) controlPoint1: CGPointMake(19.66, 46.84) controlPoint2: CGPointMake(20.01, 45.83)];
    [bezierPath addCurveToPoint: CGPointMake(20.07, 36.49) controlPoint1: CGPointMake(20.1, 42.34) controlPoint2: CGPointMake(20.06, 39.41)];
    [bezierPath addCurveToPoint: CGPointMake(20.5, 34.93) controlPoint1: CGPointMake(20.07, 36.02) controlPoint2: CGPointMake(20.11, 35.54)];
    [bezierPath addCurveToPoint: CGPointMake(22.5, 37.89) controlPoint1: CGPointMake(21.17, 35.92) controlPoint2: CGPointMake(21.85, 36.89)];
    [bezierPath addCurveToPoint: CGPointMake(26.61, 44.47) controlPoint1: CGPointMake(23.89, 40.07) controlPoint2: CGPointMake(25.33, 42.22)];
    [bezierPath addCurveToPoint: CGPointMake(29.27, 45.9) controlPoint1: CGPointMake(27.25, 45.58) controlPoint2: CGPointMake(28.01, 45.94)];
    [bezierPath addCurveToPoint: CGPointMake(32.36, 42.82) controlPoint1: CGPointMake(32.35, 45.8) controlPoint2: CGPointMake(32.35, 45.85)];
    [bezierPath addCurveToPoint: CGPointMake(32.38, 35.98) controlPoint1: CGPointMake(32.37, 40.54) controlPoint2: CGPointMake(32.34, 38.26)];
    [bezierPath addCurveToPoint: CGPointMake(32.74, 34.12) controlPoint1: CGPointMake(32.39, 35.36) controlPoint2: CGPointMake(32.61, 34.74)];
    [bezierPath addCurveToPoint: CGPointMake(32.94, 33.58) controlPoint1: CGPointMake(32.78, 33.93) controlPoint2: CGPointMake(32.96, 33.75)];
    [bezierPath addCurveToPoint: CGPointMake(33.54, 30.3) controlPoint1: CGPointMake(32.7, 31.62) controlPoint2: CGPointMake(32.69, 31.62)];
    [bezierPath addCurveToPoint: CGPointMake(33.91, 26.95) controlPoint1: CGPointMake(32.27, 30.14) controlPoint2: CGPointMake(32.27, 30.14)];
    [bezierPath addCurveToPoint: CGPointMake(32.4, 27.44) controlPoint1: CGPointMake(33.42, 27.11) controlPoint2: CGPointMake(33.03, 27.23)];
    [bezierPath addCurveToPoint: CGPointMake(33.45, 21.59) controlPoint1: CGPointMake(32.63, 25.35) controlPoint2: CGPointMake(31.63, 23.35)];
    [bezierPath addCurveToPoint: CGPointMake(37.04, 17.32) controlPoint1: CGPointMake(34.79, 20.31) controlPoint2: CGPointMake(35.79, 18.7)];
    [bezierPath addCurveToPoint: CGPointMake(37.5, 15.22) controlPoint1: CGPointMake(37.65, 16.65) controlPoint2: CGPointMake(37.97, 16.06)];
    [bezierPath addCurveToPoint: CGPointMake(38.19, 12.38) controlPoint1: CGPointMake(36.85, 14.07) controlPoint2: CGPointMake(37.26, 13.23)];
    [bezierPath addCurveToPoint: CGPointMake(47.38, -0) controlPoint1: CGPointMake(42.03, 8.9) controlPoint2: CGPointMake(45.21, 4.91)];
    [bezierPath addCurveToPoint: CGPointMake(40.52, 4.6) controlPoint1: CGPointMake(45.08, 1.52) controlPoint2: CGPointMake(42.7, 2.93)];
    [bezierPath addCurveToPoint: CGPointMake(35.11, 9.54) controlPoint1: CGPointMake(38.59, 6.09) controlPoint2: CGPointMake(36.85, 7.82)];
    [bezierPath addCurveToPoint: CGPointMake(32.48, 10.16) controlPoint1: CGPointMake(34.3, 10.35) controlPoint2: CGPointMake(33.54, 10.72)];
    [bezierPath addCurveToPoint: CGPointMake(29.97, 10.72) controlPoint1: CGPointMake(31.47, 9.63) controlPoint2: CGPointMake(30.78, 9.99)];
    [bezierPath addCurveToPoint: CGPointMake(24.87, 14.7) controlPoint1: CGPointMake(28.37, 12.17) controlPoint2: CGPointMake(26.77, 13.75)];
    [bezierPath addCurveToPoint: CGPointMake(19.82, 15.28) controlPoint1: CGPointMake(23.54, 15.37) controlPoint2: CGPointMake(21.72, 15.1)];
    [bezierPath addCurveToPoint: CGPointMake(20.5, 13.75) controlPoint1: CGPointMake(20.16, 14.5) controlPoint2: CGPointMake(20.31, 14.16)];
    [bezierPath addCurveToPoint: CGPointMake(20.06, 13.73) controlPoint1: CGPointMake(20.3, 13.74) controlPoint2: CGPointMake(20.13, 13.67)];
    [bezierPath addCurveToPoint: CGPointMake(18.49, 14.89) controlPoint1: CGPointMake(19.53, 14.11) controlPoint2: CGPointMake(19.06, 14.58)];
    [bezierPath addCurveToPoint: CGPointMake(17.12, 13.97) controlPoint1: CGPointMake(17.74, 15.29) controlPoint2: CGPointMake(17, 15.43)];
    [bezierPath addCurveToPoint: CGPointMake(15.91, 14.72) controlPoint1: CGPointMake(16.64, 14.27) controlPoint2: CGPointMake(16.3, 14.53)];
    [bezierPath addCurveToPoint: CGPointMake(14.68, 15.12) controlPoint1: CGPointMake(15.52, 14.9) controlPoint2: CGPointMake(15.02, 15.22)];
    [bezierPath addCurveToPoint: CGPointMake(8.27, 15.21) controlPoint1: CGPointMake(12.53, 14.47) controlPoint2: CGPointMake(10.43, 15.42)];
    [bezierPath addCurveToPoint: CGPointMake(1.65, 15.22) controlPoint1: CGPointMake(6.09, 14.99) controlPoint2: CGPointMake(3.86, 15.19)];
    [bezierPath addCurveToPoint: CGPointMake(1.59, 15.23) controlPoint1: CGPointMake(1.63, 15.22) controlPoint2: CGPointMake(1.61, 15.22)];
    [bezierPath addCurveToPoint: CGPointMake(0.93, 16.16) controlPoint1: CGPointMake(1.17, 15.34) controlPoint2: CGPointMake(0.9, 15.74)];
    [bezierPath addCurveToPoint: CGPointMake(1.25, 19.32) controlPoint1: CGPointMake(1, 17.22) controlPoint2: CGPointMake(1.07, 18.28)];
    [bezierPath addCurveToPoint: CGPointMake(2.2, 20.5) controlPoint1: CGPointMake(1.32, 19.76) controlPoint2: CGPointMake(1.78, 20.24)];
    [bezierPath addCurveToPoint: CGPointMake(11.64, 26.38) controlPoint1: CGPointMake(5.33, 22.49) controlPoint2: CGPointMake(8.49, 24.42)];
    [bezierPath addCurveToPoint: CGPointMake(12.26, 27.25) controlPoint1: CGPointMake(11.88, 26.52) controlPoint2: CGPointMake(12.09, 26.7)];
    [bezierPath addCurveToPoint: CGPointMake(1.94, 27.29) controlPoint1: CGPointMake(8.81, 27.26) controlPoint2: CGPointMake(5.36, 27.27)];
    [bezierPath addCurveToPoint: CGPointMake(0, 29.26) controlPoint1: CGPointMake(0.84, 27.29) controlPoint2: CGPointMake(-0.07, 28.18)];
    [bezierPath addCurveToPoint: CGPointMake(1.8, 31.24) controlPoint1: CGPointMake(0.06, 30.06) controlPoint2: CGPointMake(0.58, 30.5)];
    [bezierPath addCurveToPoint: CGPointMake(5.39, 33.44) controlPoint1: CGPointMake(3, 31.97) controlPoint2: CGPointMake(4.2, 32.7)];
    [bezierPath addCurveToPoint: CGPointMake(8.26, 33.71) controlPoint1: CGPointMake(6.3, 34.01) controlPoint2: CGPointMake(7.16, 34.86)];
    [bezierPath addCurveToPoint: CGPointMake(8.99, 33.87) controlPoint1: CGPointMake(8.35, 33.61) controlPoint2: CGPointMake(8.91, 33.72)];
    [bezierPath addCurveToPoint: CGPointMake(9.22, 34.94) controlPoint1: CGPointMake(9.17, 34.18) controlPoint2: CGPointMake(9.31, 34.63)];
    [bezierPath addCurveToPoint: CGPointMake(8.37, 36.67) controlPoint1: CGPointMake(9.03, 35.55) controlPoint2: CGPointMake(8.74, 36.15)];
    [bezierPath addCurveToPoint: CGPointMake(8.56, 38.59) controlPoint1: CGPointMake(7.83, 37.41) controlPoint2: CGPointMake(7.89, 37.94)];
    [bezierPath addCurveToPoint: CGPointMake(10.51, 38.83) controlPoint1: CGPointMake(9.21, 39.21) controlPoint2: CGPointMake(9.74, 39.39)];
    [bezierPath addCurveToPoint: CGPointMake(12, 38.15) controlPoint1: CGPointMake(10.94, 38.51) controlPoint2: CGPointMake(11.47, 38.27)];
    [bezierPath addCurveToPoint: CGPointMake(13.66, 38.12) controlPoint1: CGPointMake(12.53, 38.04) controlPoint2: CGPointMake(13.1, 38.12)];
    [bezierPath addLineToPoint: CGPointMake(13.85, 38.59)];
    [bezierPath closePath];
    [color2 setFill];
    [bezierPath fill];
    [UIColor.blackColor setStroke];
    bezierPath.lineWidth = 0.5;
    bezierPath.miterLimit = 1;
    [bezierPath stroke];

    CGContextRestoreGState(context);

    
    
    UIImage *i = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return i;
    
}

+(UIImage *)twinRadial {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(64, 64), NO, 0.0);

    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 0.297 green: 0.627 blue: 0.768 alpha: 1];

    //// Bezier Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 1.25, 26.7);
    CGContextRotateCTM(context, -45 * M_PI/180);

    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(43.82, 37.22)];
    [bezierPath addLineToPoint: CGPointMake(39.33, 28.34)];
    [bezierPath addLineToPoint: CGPointMake(41.38, 26.28)];
    [bezierPath addLineToPoint: CGPointMake(41.54, 26.43)];
    [bezierPath addLineToPoint: CGPointMake(42.2, 25.77)];
    [bezierPath addLineToPoint: CGPointMake(41.89, 25.46)];
    [bezierPath addLineToPoint: CGPointMake(42.07, 25.27)];
    [bezierPath addLineToPoint: CGPointMake(40.81, 23.99)];
    [bezierPath addLineToPoint: CGPointMake(41.08, 23.72)];
    [bezierPath addLineToPoint: CGPointMake(41.28, 23.93)];
    [bezierPath addLineToPoint: CGPointMake(41.37, 23.83)];
    [bezierPath addCurveToPoint: CGPointMake(42.56, 25.34) controlPoint1: CGPointMake(41.62, 24.24) controlPoint2: CGPointMake(42.01, 24.78)];
    [bezierPath addCurveToPoint: CGPointMake(44.14, 26.58) controlPoint1: CGPointMake(43.16, 25.93) controlPoint2: CGPointMake(43.73, 26.33)];
    [bezierPath addCurveToPoint: CGPointMake(44.45, 26.27) controlPoint1: CGPointMake(44.34, 26.69) controlPoint2: CGPointMake(44.57, 26.47)];
    [bezierPath addCurveToPoint: CGPointMake(43.21, 24.68) controlPoint1: CGPointMake(44.2, 25.85) controlPoint2: CGPointMake(43.81, 25.28)];
    [bezierPath addCurveToPoint: CGPointMake(41.71, 23.49) controlPoint1: CGPointMake(42.66, 24.12) controlPoint2: CGPointMake(42.12, 23.74)];
    [bezierPath addLineToPoint: CGPointMake(41.81, 23.39)];
    [bezierPath addLineToPoint: CGPointMake(41.82, 23.41)];
    [bezierPath addCurveToPoint: CGPointMake(41.92, 23.41) controlPoint1: CGPointMake(41.85, 23.43) controlPoint2: CGPointMake(41.89, 23.43)];
    [bezierPath addLineToPoint: CGPointMake(41.99, 23.33)];
    [bezierPath addCurveToPoint: CGPointMake(41.99, 23.23) controlPoint1: CGPointMake(42.02, 23.3) controlPoint2: CGPointMake(42.02, 23.26)];
    [bezierPath addLineToPoint: CGPointMake(41.92, 23.16)];
    [bezierPath addCurveToPoint: CGPointMake(41.84, 22.72) controlPoint1: CGPointMake(41.98, 23.02) controlPoint2: CGPointMake(41.96, 22.84)];
    [bezierPath addCurveToPoint: CGPointMake(41.41, 22.65) controlPoint1: CGPointMake(41.72, 22.61) controlPoint2: CGPointMake(41.55, 22.58)];
    [bezierPath addLineToPoint: CGPointMake(41.33, 22.57)];
    [bezierPath addCurveToPoint: CGPointMake(41.24, 22.57) controlPoint1: CGPointMake(41.31, 22.55) controlPoint2: CGPointMake(41.26, 22.55)];
    [bezierPath addLineToPoint: CGPointMake(41.16, 22.65)];
    [bezierPath addCurveToPoint: CGPointMake(41.16, 22.75) controlPoint1: CGPointMake(41.14, 22.68) controlPoint2: CGPointMake(41.14, 22.72)];
    [bezierPath addLineToPoint: CGPointMake(41.17, 22.76)];
    [bezierPath addLineToPoint: CGPointMake(41.08, 22.85)];
    [bezierPath addCurveToPoint: CGPointMake(39.89, 21.35) controlPoint1: CGPointMake(40.83, 22.45) controlPoint2: CGPointMake(40.45, 21.91)];
    [bezierPath addCurveToPoint: CGPointMake(38.31, 20.11) controlPoint1: CGPointMake(39.29, 20.75) controlPoint2: CGPointMake(38.72, 20.35)];
    [bezierPath addCurveToPoint: CGPointMake(38, 20.42) controlPoint1: CGPointMake(38.11, 19.99) controlPoint2: CGPointMake(37.88, 20.22)];
    [bezierPath addCurveToPoint: CGPointMake(39.24, 22) controlPoint1: CGPointMake(38.25, 20.83) controlPoint2: CGPointMake(38.64, 21.4)];
    [bezierPath addCurveToPoint: CGPointMake(40.74, 23.19) controlPoint1: CGPointMake(39.8, 22.56) controlPoint2: CGPointMake(40.33, 22.94)];
    [bezierPath addLineToPoint: CGPointMake(40.64, 23.29)];
    [bezierPath addLineToPoint: CGPointMake(40.84, 23.49)];
    [bezierPath addLineToPoint: CGPointMake(40.57, 23.76)];
    [bezierPath addLineToPoint: CGPointMake(39.31, 22.49)];
    [bezierPath addLineToPoint: CGPointMake(39.12, 22.68)];
    [bezierPath addLineToPoint: CGPointMake(38.8, 22.37)];
    [bezierPath addLineToPoint: CGPointMake(38.14, 23.03)];
    [bezierPath addLineToPoint: CGPointMake(38.29, 23.18)];
    [bezierPath addLineToPoint: CGPointMake(37.25, 24.23)];
    [bezierPath addLineToPoint: CGPointMake(35.08, 19.93)];
    [bezierPath addLineToPoint: CGPointMake(32.07, 16.91)];
    [bezierPath addLineToPoint: CGPointMake(33.25, 15.73)];
    [bezierPath addCurveToPoint: CGPointMake(34.61, 9.9) controlPoint1: CGPointMake(35.57, 13.41) controlPoint2: CGPointMake(35.66, 10.96)];
    [bezierPath addCurveToPoint: CGPointMake(28.79, 11.27) controlPoint1: CGPointMake(33.55, 8.84) controlPoint2: CGPointMake(31.12, 8.94)];
    [bezierPath addLineToPoint: CGPointMake(27.62, 12.45)];
    [bezierPath addLineToPoint: CGPointMake(24.61, 9.43)];
    [bezierPath addLineToPoint: CGPointMake(20.33, 7.25)];
    [bezierPath addLineToPoint: CGPointMake(21.37, 6.21)];
    [bezierPath addLineToPoint: CGPointMake(21.52, 6.36)];
    [bezierPath addLineToPoint: CGPointMake(22.18, 5.7)];
    [bezierPath addLineToPoint: CGPointMake(21.87, 5.38)];
    [bezierPath addLineToPoint: CGPointMake(22.06, 5.19)];
    [bezierPath addLineToPoint: CGPointMake(20.79, 3.92)];
    [bezierPath addLineToPoint: CGPointMake(21.06, 3.65)];
    [bezierPath addLineToPoint: CGPointMake(21.26, 3.85)];
    [bezierPath addLineToPoint: CGPointMake(21.36, 3.76)];
    [bezierPath addCurveToPoint: CGPointMake(22.55, 5.26) controlPoint1: CGPointMake(21.61, 4.16) controlPoint2: CGPointMake(21.99, 4.7)];
    [bezierPath addCurveToPoint: CGPointMake(24.12, 6.5) controlPoint1: CGPointMake(23.14, 5.86) controlPoint2: CGPointMake(23.71, 6.25)];
    [bezierPath addCurveToPoint: CGPointMake(24.43, 6.19) controlPoint1: CGPointMake(24.32, 6.62) controlPoint2: CGPointMake(24.55, 6.39)];
    [bezierPath addCurveToPoint: CGPointMake(23.2, 4.61) controlPoint1: CGPointMake(24.19, 5.78) controlPoint2: CGPointMake(23.79, 5.2)];
    [bezierPath addCurveToPoint: CGPointMake(21.7, 3.42) controlPoint1: CGPointMake(22.64, 4.05) controlPoint2: CGPointMake(22.1, 3.66)];
    [bezierPath addLineToPoint: CGPointMake(21.79, 3.32)];
    [bezierPath addLineToPoint: CGPointMake(21.8, 3.33)];
    [bezierPath addCurveToPoint: CGPointMake(21.9, 3.33) controlPoint1: CGPointMake(21.83, 3.36) controlPoint2: CGPointMake(21.87, 3.36)];
    [bezierPath addLineToPoint: CGPointMake(21.98, 3.25)];
    [bezierPath addCurveToPoint: CGPointMake(21.98, 3.16) controlPoint1: CGPointMake(22, 3.23) controlPoint2: CGPointMake(22, 3.18)];
    [bezierPath addLineToPoint: CGPointMake(21.9, 3.08)];
    [bezierPath addCurveToPoint: CGPointMake(21.82, 2.65) controlPoint1: CGPointMake(21.97, 2.94) controlPoint2: CGPointMake(21.94, 2.77)];
    [bezierPath addCurveToPoint: CGPointMake(21.39, 2.57) controlPoint1: CGPointMake(21.71, 2.53) controlPoint2: CGPointMake(21.53, 2.51)];
    [bezierPath addLineToPoint: CGPointMake(21.32, 2.5)];
    [bezierPath addCurveToPoint: CGPointMake(21.22, 2.5) controlPoint1: CGPointMake(21.29, 2.47) controlPoint2: CGPointMake(21.25, 2.47)];
    [bezierPath addLineToPoint: CGPointMake(21.15, 2.57)];
    [bezierPath addCurveToPoint: CGPointMake(21.15, 2.67) controlPoint1: CGPointMake(21.12, 2.6) controlPoint2: CGPointMake(21.12, 2.64)];
    [bezierPath addLineToPoint: CGPointMake(21.16, 2.68)];
    [bezierPath addLineToPoint: CGPointMake(21.06, 2.78)];
    [bezierPath addCurveToPoint: CGPointMake(19.87, 1.27) controlPoint1: CGPointMake(20.81, 2.37) controlPoint2: CGPointMake(20.43, 1.83)];
    [bezierPath addCurveToPoint: CGPointMake(18.29, 0.03) controlPoint1: CGPointMake(19.28, 0.68) controlPoint2: CGPointMake(18.71, 0.28)];
    [bezierPath addCurveToPoint: CGPointMake(17.98, 0.34) controlPoint1: CGPointMake(18.09, -0.09) controlPoint2: CGPointMake(17.87, 0.14)];
    [bezierPath addCurveToPoint: CGPointMake(19.22, 1.93) controlPoint1: CGPointMake(18.23, 0.76) controlPoint2: CGPointMake(18.63, 1.33)];
    [bezierPath addCurveToPoint: CGPointMake(20.72, 3.12) controlPoint1: CGPointMake(19.78, 2.48) controlPoint2: CGPointMake(20.31, 2.87)];
    [bezierPath addLineToPoint: CGPointMake(20.62, 3.21)];
    [bezierPath addLineToPoint: CGPointMake(20.83, 3.42)];
    [bezierPath addLineToPoint: CGPointMake(20.56, 3.69)];
    [bezierPath addLineToPoint: CGPointMake(19.29, 2.41)];
    [bezierPath addLineToPoint: CGPointMake(19.1, 2.6)];
    [bezierPath addLineToPoint: CGPointMake(18.79, 2.29)];
    [bezierPath addLineToPoint: CGPointMake(18.12, 2.95)];
    [bezierPath addLineToPoint: CGPointMake(18.28, 3.11)];
    [bezierPath addLineToPoint: CGPointMake(16.22, 5.17)];
    [bezierPath addLineToPoint: CGPointMake(7.37, 0.67)];
    [bezierPath addCurveToPoint: CGPointMake(3.35, 1.31) controlPoint1: CGPointMake(6.03, -0.01) controlPoint2: CGPointMake(4.41, 0.25)];
    [bezierPath addLineToPoint: CGPointMake(3.35, 1.31)];
    [bezierPath addCurveToPoint: CGPointMake(3.35, 6.23) controlPoint1: CGPointMake(1.99, 2.67) controlPoint2: CGPointMake(1.99, 4.87)];
    [bezierPath addLineToPoint: CGPointMake(10.91, 13.82)];
    [bezierPath addCurveToPoint: CGPointMake(16.29, 24.31) controlPoint1: CGPointMake(13.77, 16.69) controlPoint2: CGPointMake(15.64, 20.36)];
    [bezierPath addCurveToPoint: CGPointMake(7.17, 35.34) controlPoint1: CGPointMake(12.52, 28.57) controlPoint2: CGPointMake(9.4, 32.45)];
    [bezierPath addLineToPoint: CGPointMake(3.82, 33.63)];
    [bezierPath addCurveToPoint: CGPointMake(0.77, 34.11) controlPoint1: CGPointMake(2.81, 33.11) controlPoint2: CGPointMake(1.58, 33.3)];
    [bezierPath addLineToPoint: CGPointMake(0.77, 34.11)];
    [bezierPath addCurveToPoint: CGPointMake(0.77, 37.84) controlPoint1: CGPointMake(-0.26, 35.14) controlPoint2: CGPointMake(-0.26, 36.81)];
    [bezierPath addLineToPoint: CGPointMake(3.38, 40.46)];
    [bezierPath addCurveToPoint: CGPointMake(2.84, 41.77) controlPoint1: CGPointMake(2.85, 41.27) controlPoint2: CGPointMake(2.84, 41.77)];
    [bezierPath addCurveToPoint: CGPointMake(4.14, 41.22) controlPoint1: CGPointMake(2.84, 41.77) controlPoint2: CGPointMake(3.33, 41.76)];
    [bezierPath addLineToPoint: CGPointMake(6.75, 43.84)];
    [bezierPath addCurveToPoint: CGPointMake(10.47, 43.84) controlPoint1: CGPointMake(7.78, 44.87) controlPoint2: CGPointMake(9.44, 44.87)];
    [bezierPath addLineToPoint: CGPointMake(10.47, 43.84)];
    [bezierPath addCurveToPoint: CGPointMake(10.95, 40.78) controlPoint1: CGPointMake(11.28, 43.03) controlPoint2: CGPointMake(11.47, 41.79)];
    [bezierPath addLineToPoint: CGPointMake(9.25, 37.42)];
    [bezierPath addCurveToPoint: CGPointMake(20.24, 28.28) controlPoint1: CGPointMake(12.13, 35.18) controlPoint2: CGPointMake(16, 32.05)];
    [bezierPath addCurveToPoint: CGPointMake(30.7, 33.67) controlPoint1: CGPointMake(24.18, 28.93) controlPoint2: CGPointMake(27.84, 30.8)];
    [bezierPath addLineToPoint: CGPointMake(38.27, 41.26)];
    [bezierPath addCurveToPoint: CGPointMake(43.18, 41.26) controlPoint1: CGPointMake(39.62, 42.61) controlPoint2: CGPointMake(41.82, 42.61)];
    [bezierPath addLineToPoint: CGPointMake(43.18, 41.26)];
    [bezierPath addCurveToPoint: CGPointMake(43.82, 37.22) controlPoint1: CGPointMake(44.24, 40.19) controlPoint2: CGPointMake(44.49, 38.56)];
    [bezierPath closePath];
    [color2 setFill];
    [bezierPath fill];
    [UIColor.blackColor setStroke];
    bezierPath.lineWidth = 0.5;
    bezierPath.miterLimit = 1;
    [bezierPath stroke];

    CGContextRestoreGState(context);

    
    UIImage *i = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return i;
    
}


@end
