//
//  CLMMarkerLayer.h
//  MapEngineSDK
//
//  Created by Malcolm Toon on 8/29/21.
//

#import <CLMMapKit/CLMMapLayer.h>
#import <CLMMapKit/CLMMarker.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLMMarkerMapLayer : CLMMapLayer

//! Add marker layer
-(void)addMarker:(CLMMarker *)marker;

//! Remove marker
-(void)removeMarker:(CLMMarker *)marker;

//! Remove all markers
-(void)removeAllMarkers;

//! Set hit detection enabled
@property BOOL hitDetectionEnabled;

//! Return the marker at a specific point
-(CLMMarker *)markerAtPoint:(CGPoint)screenPoint;

@end

NS_ASSUME_NONNULL_END
