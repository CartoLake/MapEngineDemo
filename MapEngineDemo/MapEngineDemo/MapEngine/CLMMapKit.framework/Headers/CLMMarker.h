//
//  CLMMarker.h
//  MapEngineSDK
//
//  Created by Malcolm Toon on 8/29/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CLMMapKit/CLMCachedImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLMMarker : NSObject

// The marker image
@property (nullable) UIImage *markerImage;

// The other option is to have a cached image (which will ultimately either be a single texture or part of a texture atlast)
@property (nullable) CLMCachedImage *cachedImage;

// The offset is how many points to translate the marker from
// the center.  Translated to pixels in the renderer
@property CGPoint markerOffset;

// Rotation around the anchor point in deg
@property CGFloat rotation;

// Position
@property CLLocationCoordinate2D markerPosition;

// Height in meters
@property double markerAltitudeMeters;

//! The metadata value
@property NSString *metadata;

// Animate
-(void)animateTo:(CLLocationCoordinate2D)newPosition
        duration:(CFTimeInterval)durationSeconds;

// If the marker is visible
@property BOOL visible;

@end

NS_ASSUME_NONNULL_END
