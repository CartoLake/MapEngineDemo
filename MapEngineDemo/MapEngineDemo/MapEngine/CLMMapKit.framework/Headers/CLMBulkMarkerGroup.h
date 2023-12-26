//
//  CLMMarkerGroup.h
//  MapEngineSDK
//
//  Created by Malcolm Toon on 9/15/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CLMMapKit/CLMBulkMarker.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLMBulkMarkerGroup : NSObject

// Anchor point
@property CGPoint anchorPoint;

// The image for this group
@property UIImage *groupImage;

// Adds a marker
-(void)addMarker:(CLMBulkMarker *)marker;

// Removes a marker
-(void)removeMarker:(CLMBulkMarker *)marker;

@end

NS_ASSUME_NONNULL_END
