//
//  CLMBulkMarkerLayer.h
//  CLMMapKit
//
//  Created by Malcolm Toon on 9/14/21.
//

#import <CLMMapKit/CLMMapLayer.h>
#import <CLMMapKit/CLMBulkMarkerGroup.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLMBulkMarkerMapLayer : CLMMapLayer

//! Add marker group
-(void)addMarkerGroup:(CLMBulkMarkerGroup *)markerGroup;

//! Remove marker group
-(void)removeMarkerGroup:(CLMBulkMarkerGroup *)markerGroup;

@end

NS_ASSUME_NONNULL_END
