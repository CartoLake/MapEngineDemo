//
//  CLMapView.h
//  MapEngineSDK
//
//  Created by Malcolm Toon on 8/16/21.
//

#import <UIKit/UIKit.h>
#import <CLMMapKit/CLMMapTypes.h>


NS_ASSUME_NONNULL_BEGIN

typedef void (^MapImageCaptureCompleted)(UIImage * __nullable, BOOL);

@class CLMMapView;
@class CLMMarker;

@class CLMHitResult;
@class CLMMapLayer;
@class CLMCachedImage;
@class CLMTileDiskCacheManager;
@class CLMMapViewSceneMetadata;

@protocol CLMMapViewDelegate

//! Called when the camera changes
-(void)mapView:(CLMMapView *)mapView
cameraDidChange:(CLMCoordinate3D)cameraCoordinate;

//! Called when a hit result is returned
-(void)mapView:(CLMMapView *)mapView
     hitResult:(CLMHitResult * __nullable)hitResult;

@end

typedef enum {
    CLMMapViewProjectionSpherical,
    CLMMapViewProjectionSphericalMercator
} CLMMapViewProjection;

@interface CLMMapView : UIView

//! This sets a global variable for preferred FPS of all instances of the map view
+(void)setPreferredFPS:(int)framesPerSecond;

//! Initialize with a projection: opaque = YES, forced scale factor = -1
-(id)initWithFrame:(CGRect)frame
        projection:(CLMMapViewProjection)projection;

//! Initialize with a projection and opacity option and scale factor is native
-(id)initWithFrame:(CGRect)frame
        projection:(CLMMapViewProjection)projection
            opaque:(BOOL)opaque;

//! Initialize with a projection
-(id)initWithFrame:(CGRect)frame
        projection:(CLMMapViewProjection)projection
            opaque:(BOOL)opaque
 forcedScaleFactor:(float)forcedScaleFactor;

//! Min altitude of the camera in meters when zooming out
-(void)setMinCameraAltitude:(NSUInteger)minCameraAltitude;

//! Max altitude of the camera in meters when zooming out
-(void)setMaxCameraAltitude:(NSUInteger)maxCameraAltitude;

//! Returns the current camera (lat,lon,altitude
-(CLMCoordinate3D)getCurrentCamera;

//! Sets the camera center
//! If the animation duration if nagative, it will be reaplaced with the default animation time.
-(void)setMapCenter:(CLMCoordinate3D)center
           duration:(float)animationDuration;

//! Adds a map layer
-(void)addMapLayer:(CLMMapLayer *)mapLayer;

//! Removes the map laer
-(void)removeMapLayer:(CLMMapLayer *)mapLayer;

//! Adds a cached image
-(void)addCachedImage:(CLMCachedImage *)cachedImage;

//! Remove a cached image
-(void)removeCachedImage:(CLMCachedImage *)cachedImage;

//! Zoom in
-(void)zoomIn;

//! Zoom out
-(void)zoomOut;

//! Returns the coordinate at the point
-(CLMCoordinate3D)coordinateAtPoint:(CGPoint)point;

//! Starts rendering again
-(void)startRendering;

//! Pauses rendering
-(void)pauseRendering;

// Zoom to fit: Array of NSValues wrapping CLLocationCoordinate2Ds
-(void)zoomToFit:(NSArray *)arrayOfLocations;

// Zoom to fit over the time
-(void)zoomToFit:(NSArray *)arrayOfLocations
        duration:(NSTimeInterval)animationDuration;

//! Enables/disables gestures
-(void)enableGestures:(BOOL)enabled;

//! The delegate
@property (weak) id<CLMMapViewDelegate> delegate;

//! Set the starmap image.  Passing nil will remove the starmap
-(void)setStarmapImage:(UIImage * __nullable)starmapImage
              duration:(float)animationDuration;

//! Sets if the hit detection is enabled for single tap
@property BOOL hitDetectionEnabled;

//! Sets if hit detection will call back with a nil if nothing was hit: Default NO
@property BOOL nilHitDetectionEnabled;

//! Returns the point to pixel scale
-(CGFloat)pointToPixelScale;

//! Save the next frame buffer
-(void)saveNextFrameBuffer:(MapImageCaptureCompleted)completionHandler;

//! Render this view to an image
-(UIImage *)renderToImage;

//! The tile cache
@property CLMTileDiskCacheManager *tileCacheManager;

//! Clear all memory caches
-(void)clearAllCaches;

// Center on a marker.  Nil to stop
-(void)centerOnMarker:(CLMMarker * __nullable)centerMarker
             duration:(NSTimeInterval)duration
      includeRotation:(BOOL)includeRotation;

// Get current scene metadata
-(CLMMapViewSceneMetadata *)getCurrentSceneMetadata;

@end

NS_ASSUME_NONNULL_END
