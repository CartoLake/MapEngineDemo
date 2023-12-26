//
//  CLMBulkMarker.h
//  MapEngineSDK
//
//  Created by Malcolm Toon on 9/15/21.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

/*
 The bulk marker system is different from the standard marker system in that
 the marker object really just represents the position, orientation and visibility
 of the marker and the MarkerImage object represents the actual image (and its metadata).
 */

@interface CLMBulkMarker : NSObject

// Rotation around the anchor point
@property CGFloat rotation;

// Position
@property CLLocationCoordinate2D markerPosition;

// Animate
-(void)animateTo:(CLLocationCoordinate2D)newPosition
        duration:(CFTimeInterval)durationSeconds;

@end

NS_ASSUME_NONNULL_END
