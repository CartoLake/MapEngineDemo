//
//  CLMapLayer.h
//  MapEngineSDK
//
//  Created by Malcolm Toon on 8/16/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// This is the base class for all layers

@interface CLMMapLayer : NSObject

//! This will set the layer's stencil outline
-(void)setMaskingShape:(nullable NSArray *)maskingShape;

//! The zOrder
@property int zOrder;

//! If the layer is hidden or not.  Default is NO
@property BOOL layerHidden;

//! Clear all caches
-(void)clearAllCaches;

//! Min/Max Lat/lon
@property double minLat;
@property double minLon;
@property double maxLat;
@property double maxLon;

@end

NS_ASSUME_NONNULL_END
