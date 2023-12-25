//
//  CLMWebTileMapLayer.h
//  MapEngineSDK
//
//  Created by Malcolm Toon on 10/29/21.
//

//#import "CLMMapKitMetadata.h"
//#import CLMMapKitFramework
#import <CLMMapKit/CLMMapLayer.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLMWebTileMapLayer : CLMMapLayer

// Initialize with the URL pattern
-(id)initWithURLPattern:(NSString *)urlPattern
              cacheName:(NSString * __nullable)cacheName;

// The URL pattern of the layer
@property NSString *urlPattern;

//! The tile zoom bias.  This allows hinting to the tile layer that it can request tiles at a higher zoom level for providers that support larger tils
@property NSInteger tileZoomBias;

// The min zoom
@property NSInteger minTileZoom;

// The max zoom
@property NSInteger maxTileZoom;

// The curve adjustment
@property float curveAdjustment;

// Use the TMS Y
@property BOOL useTMSAddresses;

// The lighness factor.  1 = fully lit, less than that and it starts to applies a darkness
// factor to the tiles
@property float lightness;

// If the layer should load the tiles synchronously (used in background map processing)
@property BOOL synchronousTileLoading;


@end

NS_ASSUME_NONNULL_END
