//
//  CLMShapeMapLayer.h
//  MapEngineSDK
//
//  Created by Malcolm Toon on 8/25/21.
//

#import <CLMMapKit/CLMMapLayer.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//! Sets what GeoJSON property name is used for the label property.  Optional.  Defaults to "name"
#define GEO_JSON_MARKER_LABEL_PROPERTY_NAME @"GEO_JSON_MARKER_LABEL_PROPERTY_NAME"

//! Sets what GeoJSON property name is used for the min zoom of the marker.  Optional.  Defaults to all markers being shown at all zoom levels
#define GEO_JSON_MARKER_MINZOOM_PROPERTY_NAME @"GEO_JSON_MARKER_MINZOOM_PROPERTY_NAME"

//! Will load any polygons in the file as lines
#define GEO_JSON_LOAD_POLYGONS_AS_POLYLINES @"GEO_JSON_LOAD_POLYGONS_AS_POLYLINES"

#define GEO_JSON_MIN_LAT_FILTER @"GEO_JSON_MIN_LAT_FILTER"
#define GEO_JSON_MIN_LON_FILTER @"GEO_JSON_MIN_LON_FILTER"
#define GEO_JSON_MAX_LAT_FILTER @"GEO_JSON_MAX_LAT_FILTER"
#define GEO_JSON_MAX_LON_FILTER @"GEO_JSON_MAX_LON_FILTER"

// Remove intermediate data structures
#define IMPORT_REMOVE_INTERMEDIATE_STRUCTURES @"IMPORT_REMOVE_INTERMEDIATE_STRUCTURES"
#define IMPORT_MERGE_SHAPES @"IMPORT_MERGE_SHAPES"

// Shape file import
#define SHAPE_FILE_IMPORT_USE_SPHERICAL_EARCUT @"SHAPE_FILE_IMPORT_USE_SPHERICAL_EARCUT"

// Forwards
@class CLMShape;
@class CLMMarker;
@class CLMHitResult;

@interface CLMShapeMapLayer : CLMMapLayer

//! Load a shape file with options
-(void)loadShapeFile:(NSString *)shapeFilePath
     polygonsAsLines:(BOOL)polygonsAsLines
           cacheFile:(nullable NSString *)cacheFile
             options:(nullable NSDictionary *)options;


//! Load a shape file
//! The cacheFile is optional.  If provided, the file will be saved as the cache file after
//! being created
-(void)loadShapeFile:(NSString *)shapeFilePath
     polygonsAsLines:(BOOL)polygonsAsLines
           cacheFile:(nullable NSString *)cacheFile;

//! Same as above, but doens't cache the shapes
-(void)loadShapeFile:(NSString *)shapeFilePath
     polygonsAsLines:(BOOL)polygonsAsLines;

//! Load a GeoJSON file
-(void)loadGeoJSONFile:(NSString *)geoJsonFilePath;

//! Load a GeoJSON file with options
-(void)loadGeoJSONFile:(NSString *)geoJsonFilePath
               options:(nullable NSDictionary *)loadingOptions;

//! Set the layer shape color
-(void)setLayerShapeColor:(CGFloat)red
                    green:(CGFloat)green
                     blue:(CGFloat)blue
                    alpha:(CGFloat)alpha;

//! Set the layer shape color
-(void)setLayerShapeColor:(UIColor *)shapeColor;

//! Set the layer shape color, but with a passed in alpha
-(void)setLayerShapeColor:(UIColor *)shapeColor
                    alpha:(CGFloat)alpha;

//! Add a shape
-(void)addShape:(CLMShape *)shape;

//! Removes a shape
-(void)removeShape:(CLMShape *)shape;

//! Remove all shapes
-(void)removeAllShapes;

//! Add a marker to the layer
-(void)addMarker:(CLMMarker *)marker;

//! Remove a marker from the layer
-(void)removeMarker:(CLMMarker *)marker;

//! Sets of the layer should automatically merge shapes into single vertex buffers when possible
@property BOOL autoMergeShapes;

//! Set hit detection enabled
@property BOOL hitDetectionEnabled;

//! Manually search for a hit
-(CLMHitResult *)hitResultAtScreenPoint:(CGPoint)screenPoint;

@end

NS_ASSUME_NONNULL_END
