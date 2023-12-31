//
//  CurrentLocationManager.h
//  CLMMapKitLiteDemo
//
//  Created by Malcolm Toon on 12/30/23.
//

#import <Foundation/Foundation.h>
#import <CLMMapKit/CLMMapKitLite.h>

NS_ASSUME_NONNULL_BEGIN

@interface CurrentLocationManager : NSObject

-(id)initWithLocationMarker:(CLMMarker *)locationMarker;

-(void)removeFromMap;

@end

NS_ASSUME_NONNULL_END
