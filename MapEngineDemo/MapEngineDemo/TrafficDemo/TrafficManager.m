//
//  TrafficManager.m
//  CLMMapKitLite
//
//  Created by Malcolm Toon on 12/25/23.
//

#import "TrafficManager.h"
#import "TrafficItem.h"
#import <CoreLocation/CoreLocation.h>

@interface TrafficManager () {
    
}

@property NSMutableArray *trafficItems;

@property NSTimer *trafficUpdateTimer;

@property (weak) CLMMapView *mapView;

@property CLMBulkMarkerMapLayer *bulkMarkerLayer;

@property CLMBulkMarkerGroup *markerGroup;

@end

@implementation TrafficManager

-(id)initWithMapView:(CLMMapView *)mapView {
    if (self = [self init]) {
        self.mapView = mapView;
        [self startTimer];
    }
    return self;
}

-(void)startTimer {
    
    self.bulkMarkerLayer = [[CLMBulkMarkerMapLayer alloc] init];
    self.bulkMarkerLayer.zOrder = 10000;
    
    self.markerGroup = [[CLMBulkMarkerGroup alloc] init];
    self.markerGroup.groupImage = [UIImage imageNamed:@"Airplane.png"];
    [self.bulkMarkerLayer addMarkerGroup:self.markerGroup];
    
    [self.mapView addMapLayer:self.bulkMarkerLayer];
    
    [self createTrafficItems];
    
    self.trafficUpdateTimer = [NSTimer scheduledTimerWithTimeInterval:20.0
                                                               target:self
                                                             selector:@selector(trafficUpdate:)
                                                             userInfo:nil
                                                              repeats:YES];
}

-(void)createTrafficItems {
    
    self.trafficItems = [NSMutableArray array];
    
    for (int i=0; i < 1000; i++) {
        
        // Generate a fake tail number
        int trafficTailNum = (arc4random() * 10000) % 10000;
        NSString *trafficIdent = [NSString stringWithFormat:@"N%i", trafficTailNum];
        
        TrafficItem *item = [[TrafficItem alloc] init];
        item.targetItent = trafficIdent;
        
        float lat = (((float)(arc4random() % 18000)) / 100.0) - 90;
        float lon = (((float)(arc4random() % 36000)) / 100.0) - 180;
        float heading = ((float)(arc4random() % 360));
        float speedKnots = (arc4random() % 300) + 150;
        
        CLLocationCoordinate2D trafficPosition = CLLocationCoordinate2DMake(lat, lon);
        
        item.targetMarker = [[CLMBulkMarker alloc] init];
        item.targetMarker.markerPosition = trafficPosition;
        item.speedKnots = speedKnots;
        item.heading = heading;
        [item.targetMarker setRotation:(heading * M_PI / 180.0)];
        

        [self.markerGroup addMarker:item.targetMarker];

        [self.trafficItems addObject:item];

        [self updateItem:item];
        

        
    }
}

-(void)trafficUpdate:(id)sender {
    
    
    for (TrafficItem *item in self.trafficItems) {
        
        float deltaHeading = ((float)(arc4random() % 20)) - 10;
        float newHeading = item.heading + deltaHeading;
        if (newHeading < 0) {
            newHeading = newHeading + 360;
        }
        if (newHeading > 360) {
            newHeading = newHeading - 360;
        }
        item.heading = newHeading;
        
        [self updateItem:item];
        
    }
    
    
    
}

-(void)updateItem:(TrafficItem *)item {
    
    // Figure out future position
    float time = 60; // seconds
    float distanceNMOverTime = (time / 3600.0) * item.speedKnots;
    CLLocationCoordinate2D currentPosition = item.targetMarker.markerPosition;
    CLMCoordinate3D futurePosition = [CLMMapMath coordinateWithBearingAndDistanceNM:CLMCoordinate3DMake(currentPosition.latitude,
                                                                                                        currentPosition.longitude, 0)
                                                                         bearingDeg:item.heading distanceNM:distanceNMOverTime];

    [item.targetMarker animateTo:CLLocationCoordinate2DMake(futurePosition.lat,
                                                            futurePosition.lon)
                           duration:time];
    item.targetMarker.rotation = item.heading * M_PI / 180.0;
    
}

@end
