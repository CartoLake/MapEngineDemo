//
//  CLMShadedTerrainLayer.h
//  CLMMapKit
//
//  Created by Malcolm Toon on 3/29/22.
//

#import <CLMMapKit/CLMMapLayer.h>
#import <CLMMapKit/CLMGradient.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLMShadedTerrainLayer : CLMMapLayer

// Set the terrain gradient
@property CLMGradient *terrainGradient;

// The water gradient
@property CLMGradient *waterGradient;

// The ambient color
@property UIColor *ambientColor;

// Light position
@property CGPoint lightPosition;

// Shininess
@property CGFloat shininess;

// Alpha
@property CGFloat alpha;

// Terrain RGB URL
@property NSString *terrainRGBURLPattern;

@end

NS_ASSUME_NONNULL_END
