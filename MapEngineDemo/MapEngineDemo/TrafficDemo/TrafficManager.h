//
//  TrafficManager.h
//  CLMMapKitLite
//
//  Created by Malcolm Toon on 12/25/23.
//

#import <Foundation/Foundation.h>
#import <CLMMapKit/CLMMapKitLite.h>

NS_ASSUME_NONNULL_BEGIN

@interface TrafficManager : NSObject

// Add the traffic manager to the map
-(id)initWithMapView:(CLMMapView *)mapView;

// Remove the traffic manager from the map
-(void)removeFromMap;

@end

NS_ASSUME_NONNULL_END
