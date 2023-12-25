//
//  CLMGeoPDFMapLayer.h
//  MapEngineSDK
//
//  Created by Malcolm Toon on 9/20/21.
//

#import <CLMMapKit/CLMMapLayer.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLMGeoPDFMapLayer : CLMMapLayer

//! Adds the PDF file to the map layer
-(void)addPDFFile:(NSString *)pdfFilePath;

//! Set the cache filename
-(void)setCacheFilename:(NSString *)cacheFilename;

//! Use the standard caching paradigm (the pdf file with _cache.sqlite) added
-(void)initStandardCache;

//! Sets the alpha of the layer
@property CGFloat alpha;

// Initializes the cache level.  This is called
// during install to create a few levels deep before showing to the user
-(void)initializeCacheLevel:(int)patchLevel;

@end

NS_ASSUME_NONNULL_END
