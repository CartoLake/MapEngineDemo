//
//  CLMTextMapLayer.h
//  CLMAuthoringKit
//
//  Created by Malcolm Toon on 9/30/21.
//

#import <CLMMapKit/CLMMapLayer.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

//! Callback for getting the image for a specific character.  Used to generate the text char texture
typedef UIImage * __nullable(^GenerateCharGlyph)(NSString * __nullable);


@interface CLMTextMapLayer : CLMMapLayer

/*
 This is the layer that can render tons of text markers
 */

-(void)setCharCallback:(GenerateCharGlyph)callback;

// The font to use when creating the labels
@property UIFont *markerLabelFont;

// Add a marker
-(void)addTextMarker:(NSString *)text
            location:(CLLocationCoordinate2D)coordinate;

//! Load from a GeoJSON file
-(void)loadGeoJSONFile:(NSString *)geoJsonFilePath
               options:(nullable NSDictionary *)loadingOptions;

//! Load markers from the cartolake text file format
-(void)loadCLPlacesTextFile:(NSString *)filePath
                    options:(nullable NSDictionary *)loadingOptions;

//! Notify the layer that a bunch of markers are about to be added
-(void)startBulkLoad;

//! Notify the layer that all markers have been added
-(void)commitBulkLoad;

//! Remove all the markers
-(void)removeAllMarkers;




@end

NS_ASSUME_NONNULL_END
