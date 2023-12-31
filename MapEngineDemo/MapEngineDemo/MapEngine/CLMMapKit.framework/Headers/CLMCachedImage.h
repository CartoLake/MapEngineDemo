//
//  CLMCachedImage.h
//  MapEngineSDK
//
//  Created by Malcolm Toon on 9/12/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLMCachedImage : NSObject

//! The UIImage
@property UIImage *image;

//! Size of the image in pixels (adjusted when added to the map view)
@property CGSize size;

@end

NS_ASSUME_NONNULL_END
