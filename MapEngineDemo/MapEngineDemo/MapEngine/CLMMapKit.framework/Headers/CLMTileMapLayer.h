//
//  CLTileMapLayer.h
//  MapEngineSDK
//
//  Created by Malcolm Toon on 8/16/21.
//

#import <CLMMapKit/CLMMapLayer.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// Forward
@class CLMTileMapLayer;
@class CLMTileResult;

@protocol CLMTileMapLayerDelegate

// Load the image
-(CLMTileResult *)tileMapLayer:(CLMTileMapLayer *)mapLayer
                 imageForTileX:(int)tileX
                         tileY:(int)tileY
                      tileZoom:(int)tileZoom;

@end

@interface CLMTileMapLayer : CLMMapLayer

// The delegate
@property id<CLMTileMapLayerDelegate> delegate;

// The universal
@property UIImage *universalImage;

@end

NS_ASSUME_NONNULL_END
