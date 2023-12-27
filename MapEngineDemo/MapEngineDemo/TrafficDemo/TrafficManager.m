//
//  TrafficManager.m
//  CLMMapKitLite
//
//  Created by Malcolm Toon on 12/25/23.
//

#import "TrafficManager.h"
#import "TrafficItem.h"
#import <CoreLocation/CoreLocation.h>
#import "TrafficIcons.h"

@interface TrafficManager () {
    
}

@property NSMutableArray *trafficItems;

@property NSTimer *trafficUpdateTimer;

@property (weak) CLMMapView *mapView;

@property CLMBulkMarkerMapLayer *bulkMarkerLayer;

@property NSMutableDictionary *aircraftTypeToMarkerGroupLookup;

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
    
    self.aircraftTypeToMarkerGroupLookup = [NSMutableDictionary dictionary];
    
    
    self.bulkMarkerLayer = [[CLMBulkMarkerMapLayer alloc] init];
    self.bulkMarkerLayer.zOrder = 10000;
    
    // Add the fighter group
    CLMBulkMarkerGroup *fighterJetGroup = [[CLMBulkMarkerGroup alloc] init];
    fighterJetGroup.groupImage = [TrafficIcons fighterJet];
    [self.aircraftTypeToMarkerGroupLookup setObject:fighterJetGroup
                                             forKey:@"F18"];
    [self.bulkMarkerLayer addMarkerGroup:fighterJetGroup];

    // Add the commercial jet group
    CLMBulkMarkerGroup *commercialJetGroup = [[CLMBulkMarkerGroup alloc] init];
    commercialJetGroup.groupImage = [TrafficIcons commercialJet];
    [self.aircraftTypeToMarkerGroupLookup setObject:commercialJetGroup
                                             forKey:@"757"];
    [self.bulkMarkerLayer addMarkerGroup:commercialJetGroup];

    // Add the single engine group
    CLMBulkMarkerGroup *singleEngineGroup = [[CLMBulkMarkerGroup alloc] init];
    singleEngineGroup.groupImage = [TrafficIcons singleEngine];
    [self.aircraftTypeToMarkerGroupLookup setObject:singleEngineGroup
                                             forKey:@"C172"];
    [self.bulkMarkerLayer addMarkerGroup:singleEngineGroup];

    // Add the multi-radial engine group
    CLMBulkMarkerGroup *multiRadialGroup = [[CLMBulkMarkerGroup alloc] init];
    multiRadialGroup.groupImage = [TrafficIcons twinRadial];
    [self.aircraftTypeToMarkerGroupLookup setObject:multiRadialGroup
                                             forKey:@"DC3"];
    [self.bulkMarkerLayer addMarkerGroup:multiRadialGroup];

    
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
    
    for (int i=0; i < 6000; i++) {

        // Speed of the aircraft
        float speedKnots = 0;
        NSString *aircraftType = @"";

        // Figure out type of aircraft
        int acftType = i % 4;
        if (acftType == 0) {
            speedKnots = (arc4random() % 50) + 100;
            aircraftType = @"C172";
        } else if (acftType == 1) {
            speedKnots = (arc4random() % 300) + 300;
            aircraftType = @"F18";
        } else if (acftType == 2) {
            speedKnots = (arc4random() % 100) + 300;
            aircraftType = @"757";
        } else if (acftType == 3) {
            speedKnots = (arc4random() % 50) + 150;
            aircraftType = @"DC3";
        }
        
        // Speed up for demo
        speedKnots = speedKnots * 3.0;
        
        
        // Generate a fake tail number
        int trafficTailNum = (arc4random() * 10000) % 10000;
        NSString *trafficIdent = [NSString stringWithFormat:@"N%i", trafficTailNum];
        
        TrafficItem *item = [[TrafficItem alloc] init];
        item.targetItent = trafficIdent;
        
        // This is worldwide
        float lat = (((float)(arc4random() % 18000)) / 100.0) - 90;
        float lon = (((float)(arc4random() % 36000)) / 100.0) - 180;

        // This is mainly US
        lat = (((float)(arc4random() % 2000)) / 100.0) + 30;
        lon = (((float)(arc4random() % 6000)) / 100.0) - 125;

        float heading = ((float)(arc4random() % 360));
        
        CLLocationCoordinate2D trafficPosition = CLLocationCoordinate2DMake(lat, lon);
        
        item.targetMarker = [[CLMBulkMarker alloc] init];
        item.targetMarker.markerPosition = trafficPosition;
        item.speedKnots = speedKnots;
        item.heading = heading;
        [item.targetMarker setRotation:(heading * M_PI / 180.0)];
        

        // Figure out which marker group this target goes in
        CLMBulkMarkerGroup *group = [self.aircraftTypeToMarkerGroupLookup objectForKey:aircraftType];
        [group addMarker:item.targetMarker];

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
