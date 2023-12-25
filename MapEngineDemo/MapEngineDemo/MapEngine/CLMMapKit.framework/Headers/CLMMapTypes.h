//
//  CLMapTypes.h
//  MapEngineSDK
//
//  Created by Malcolm Toon on 8/16/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef struct
{   double lat;    // latitude
    double lon;     // longitude
    double altitude; // Height from surface in meters
} CLMCoordinate3D;

static inline CLMCoordinate3D CLMCoordinate3DMake(double lat, double lon, double altitude) {
    CLMCoordinate3D tempResult;
    tempResult.lat = lat;
    tempResult.lon = lon;
    tempResult.altitude = altitude;
    return tempResult;
}

static inline BOOL CLMCoordinate3DEquals(const CLMCoordinate3D coord1,
                                         const CLMCoordinate3D coord2) {
    
    return ((coord1.lat == coord2.lat) &&
            (coord1.lon == coord2.lon) &&
            (coord1.altitude == coord2.altitude));
    
    
}

@interface CLMMapMath : NSObject

// Return the coordinate with a bearing a distance from a reference point
+(CLMCoordinate3D)coordinateWithBearingAndDistanceNM:(CLMCoordinate3D)startingPoint
                                          bearingDeg:(double)bearingDeg
                                          distanceNM:(double)distanceNN;

// Return the distance in nautical miles between two coordinates
+(double)distanceNMBetween:(CLMCoordinate3D)coordinate1
               coordinate2:(CLMCoordinate3D)coordinate2;

// Return the bearing between two points
+(double)bearingDegFrom:(CLMCoordinate3D)coordinate1
            coordinate2:(CLMCoordinate3D)coordinate2;

// Return the intersection of coordinate
+(CLMCoordinate3D)intersectionOfCoordinate1:(CLMCoordinate3D)coordinate1
                            initialBearing1:(double)initialBearing1
                                coordinate2:(CLMCoordinate3D)coordinate2
                            initialBearing2:(double)initialBearing2;

// Return the midpoint of a segment
+(CLMCoordinate3D)midpointBetween:(CLMCoordinate3D)coordinate1
                      coordinate2:(CLMCoordinate3D)coordinate2;


@end

NS_ASSUME_NONNULL_END
