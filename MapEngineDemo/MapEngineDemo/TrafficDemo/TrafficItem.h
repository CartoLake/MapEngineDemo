//
//  TrafficItem.h
//  CLMMapKitLite
//
//  Created by Malcolm Toon on 12/25/23.
//

#import <Foundation/Foundation.h>
#import <CLMMapKit/CLMMapKitLite.h>

NS_ASSUME_NONNULL_BEGIN

@interface TrafficItem : NSObject

@property NSString *targetItent;

@property CLMBulkMarker *targetMarker;

@property float speedKnots;

@property float heading;

@end

NS_ASSUME_NONNULL_END
