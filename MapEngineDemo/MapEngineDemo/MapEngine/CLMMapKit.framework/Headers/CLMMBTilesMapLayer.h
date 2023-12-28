//
//  CLMMBTilesMapLayer.h
//  MapEngineSDK
//
//  Created by Malcolm Toon on 8/30/21.
//

#import <CLMMapKit/CLMMapLayer.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLMMBTilesMapLayer : CLMMapLayer

// Constructor with file path
-(id)initWithMBTiles:(NSString *)filePath;

//! Set the MBTiles file.  If this has been set before, it will clear out the cache
//! and then load this new file
-(void)setMBTilesFile:(NSString *)filePath;

//! Set the opacity of the tiles.  Should be from 0..1
@property float opacity;

@end

NS_ASSUME_NONNULL_END
