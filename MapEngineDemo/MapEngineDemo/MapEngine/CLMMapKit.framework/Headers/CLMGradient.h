//
//  CLMTerrainGradient.h
//  CLMAuthoringKit
//
//  Created by Malcolm Toon on 3/31/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLMGradientStop : NSObject

// The properties for the stop
@property float stopPercent;
@property UIColor *stopColor;
@property float blendPercent; // The percent where the blend is with next color

@end

@interface CLMGradient : NSObject

// Set the gradient stops
@property NSMutableArray *gradientStops;

// Default
+(CLMGradient *)defaultGradient;

// Returns the default water gradient
+(CLMGradient *)defaultWaterGradient;

//! Creates the gradient image of the size passed in
-(UIImage *)createGradientImage:(CGSize)imageSize;

//! Return the blend color for the stop
-(UIColor *)blendColorForStop:(CLMGradientStop *)stop;

@end

NS_ASSUME_NONNULL_END
