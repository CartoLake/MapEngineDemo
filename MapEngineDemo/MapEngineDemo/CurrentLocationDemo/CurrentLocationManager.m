//
//  CurrentLocationManager.m
//  CLMMapKitLiteDemo
//
//  Created by Malcolm Toon on 12/30/23.
//

#import "CurrentLocationManager.h"
#import <CoreLocation/CoreLocation.h>

@interface CurrentLocationManager () <CLLocationManagerDelegate> {
    
}

@property CLMMarker *locationMarker;

@property CLLocationManager *locationManger;

@property CLLocation *lastLocation;

@end


@implementation CurrentLocationManager

-(id)initWithLocationMarker:(CLMMarker *)locationMarker {
    
    if (self = [self init]) {
        self.locationMarker = locationMarker;
        [self startLocationUpdates];
    }
    return self;
    
}

-(void)removeFromMap {
    
    [self stopLocationManager];
    
}

-(void)startLocationUpdates {
        
    self.locationManger = [[CLLocationManager alloc] init];
    self.locationManger.delegate = self;
    if (self.locationManger.authorizationStatus != kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationManger requestWhenInUseAuthorization];
    } else {
        [self startUpdates];
    }
    
}

-(void)startUpdates {
    [self.locationManger startUpdatingLocation];
    [self.locationManger startUpdatingHeading];
}

-(void)stopLocationManager {
    
    [self.locationManger stopUpdatingHeading];
    [self.locationManger stopUpdatingLocation];
    self.locationManger.delegate = nil;
    self.locationManger = nil;
    
}

// -------------------------------------------
// CLLocationManagerDelegate
// -------------------------------------------
-(void)locationManagerDidChangeAuthorization:(CLLocationManager *)manager {
    if (manager.authorizationStatus != kCLAuthorizationStatusAuthorizedWhenInUse) {
        return;
    }
    [self startUpdates];
}

-(void)locationManager:(CLLocationManager *)manager
      didFailWithError:(NSError *)error {
    NSLog(@"Location Manager Error: %@", [error description]);
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    CLLocation *lastLocation = [locations lastObject];
    if (self.lastLocation) {
        [self.locationMarker animateTo:lastLocation.coordinate
                              duration:1.0];
    } else {
        [self.locationMarker animateTo:lastLocation.coordinate
                              duration:0.0];
    }
    self.lastLocation = lastLocation;
    
}

-(void)locationManager:(CLLocationManager *)manager
      didUpdateHeading:(CLHeading *)newHeading {
    
    [self.locationMarker setRotation:newHeading.trueHeading];
    
}



@end
