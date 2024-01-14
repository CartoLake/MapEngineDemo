//
//  ViewController.m
//  CLMMapKitLiteDemo
//
//  Created by Malcolm Toon on 12/20/23.
//

#import "ViewController.h"
#import <CLMMapKit/CLMMapKitLite.h>
#import "TrafficManager.h"
#import "CurrentLocationManager.h"
#import "CurrentLocationIcons.h"

@interface ViewController ()

@property CLMMapView *mapView;
@property UIButton *zoomInBtn;
@property UIButton *zoomOutBtn;

// Animated Markers demo
@property UIButton *showTrafficBtn;
@property TrafficManager *trafficManager;

// MBTiles example
@property UIButton *showMBTilesBtn;
@property CLMMBTilesMapLayer *mbtilesLayer;
@property UISlider *mbtilesOpacitySlider;

// PDF Example
@property UIButton *showPDFBtn;
@property CLMGeoPDFMapLayer *pdfMapLayer;
@property UISlider *pdfOpacitySlider;

// Shaded Terrain
@property UIButton *shadedTerrainBtn;
@property CLMShadedTerrainLayer *shadedTerrainLayer;

// Marker Layer
@property UIButton *markerLayerBtn;
@property CLMMarkerMapLayer *markerLayer;
@property CLMMarker *currentLocationMarker;
@property CurrentLocationManager *currentLocationManager;

// Diagnostic Layer
@property UIButton *diagnosticBtn;
@property CLMDiagnosticTileLayer *diagnosticLayer;

// Natural Atlas Layer
@property UIButton *naturalAtlasLayerBtn;
@property CLMShapeMapLayer *naLandLayer;
@property CLMShapeMapLayer *naLakesShapeLayer;
@property CLMShapeMapLayer *naAdminLinesShapeLayer;


@end

#define zOrderGrayBase              5
#define zOrderOSMRaster             100
#define zOrderShadedTerrain         110
#define zOrderATTrail               1000
#define zOrderGeoPDF                1500
#define zOrderMBTiles               1600
#define zOrderMarkerLayer           1700
#define zOrderDiagnosticLayer       1800
#define zOrderNaturalAtlasLayer     1900
#define zOrderEdgeEffect            3000

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createMapView];
    
}

-(void)createMapView {
    
    self.mapView = [[CLMMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.mapView];
    
    // Setup the map
    [self addStarmap];
    [self addGrayBaseLayer];
    [self addBaseMapTileLayer];
    [self addEdgeEffectLayer];
    [self addLongTrailLayer];
    [self addPlacesLabels];
    
    // Set the map's initial center
    [self setInitialCenter];
    
    // Create some controls for manipulating the map
    [self createUIControls];
    
}

-(void)addStarmap {

    // This will add the starmap skybox to the rendering
    UIImage *starmap = [UIImage imageNamed:@"starmap_2020_4k_4096.jpg"];
    [self.mapView setStarmapImage:starmap duration:0];
    
}

-(void)addGrayBaseLayer {
    
    // This adds the immediate gray base layer which is a placeholder when tiles are loading
    CLMTileMapLayer *baseLayer = [[CLMTileMapLayer alloc] init];
    baseLayer.universalImage = [self baseGray];
    baseLayer.zOrder = zOrderGrayBase;
    [self.mapView addMapLayer:baseLayer];
    
}

-(void)addBaseMapTileLayer {
    
    // This will add a common raster map layer using the URL pattern.  This
    // url can be anything as long as the X/Y/Zoom are put in using the curly
    // braces
    NSString *urlPattern = @"https://tile.openstreetmap.org/{z}/{x}/{y}.png";
    CLMWebTileMapLayer *tileLayer = [[CLMWebTileMapLayer alloc] initWithURLPattern:urlPattern
                                                                         cacheName:nil];
    tileLayer.zOrder = zOrderOSMRaster;
    tileLayer.maxTileZoom = 22;
    [self.mapView addMapLayer:tileLayer];
      
}

-(void)addEdgeEffectLayer {
    
    // This adds the darkened edge to help the sense of depth perception
    CLMEdgeEfffectMapLayer *edgeEffect = [[CLMEdgeEfffectMapLayer alloc] init];
    edgeEffect.zOrder = zOrderEdgeEffect;
    [self.mapView addMapLayer:edgeEffect];

}

-(void)addLongTrailLayer {
        
    NSString *geoJSON = [[NSBundle mainBundle] pathForResource:@"AT0-0005SinglePart" ofType:@"geojson"];
    CLMShapeMapLayer *ATShapeMapLayer = [[CLMShapeMapLayer alloc] init];
    ATShapeMapLayer.zOrder = zOrderATTrail;
    [self.mapView addMapLayer:ATShapeMapLayer];
    [ATShapeMapLayer setLayerShapeColor:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0];
    [ATShapeMapLayer loadGeoJSONFile:geoJSON];
}



-(void)addPlacesLabels {
    
        
    CLMTextMapLayer *geoRegionMarkers = [[CLMTextMapLayer alloc] init];
    geoRegionMarkers.markerLabelFont = [UIFont systemFontOfSize:23];
    
    geoRegionMarkers.zOrder = 5000;
    [self.mapView addMapLayer:geoRegionMarkers];
    [geoRegionMarkers loadGeoJSONFile:[[NSBundle mainBundle] pathForResource:@"ne_50m_geography_regions_points"
                                                                              ofType:@"geojson"]
                                      options:@{GEO_JSON_MARKER_LABEL_PROPERTY_NAME:@"name"
                                              }];
    
    
}



-(void)setInitialCenter {
    
    // Set the camera at the center of the United States
    CLMCoordinate3D centerOfTheUS = CLMCoordinate3DMake(39.8283, -98.5795, 10000000);
        
    [self.mapView setMapCenter:centerOfTheUS duration:0];
    
}

// -- Utility methods under here

-(UIImage *)baseGray {
    
    // Creates a UIImage that is a single pixel (for a solid color, the image
    // doesn't need to be more than that) to use for the placeholder base
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, 1), NO, 0.0);

    [[UIColor darkGrayColor] setFill];

    CGRect rectToFill = CGRectMake(0,0,1,1);
    CGContextFillRect(UIGraphicsGetCurrentContext(), rectToFill);
    
    // store the image
    UIImage *i = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return i;
    
}




-(void)createUIControls {
    
    self.zoomInBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.zoomInBtn setTitle:@"+" forState:UIControlStateNormal];
    [self.zoomInBtn setBackgroundColor:[UIColor blackColor]];
    [self.zoomInBtn setTintColor:[UIColor blackColor]];
    self.zoomInBtn.frame = CGRectMake(6,self.view.frame.size.height - 100,44,44);
    self.zoomInBtn.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    [self.zoomInBtn addTarget:self
                    action:@selector(zoomInTapped:)
          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.zoomInBtn];
    
    
    self.zoomOutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.zoomOutBtn setTitle:@"-" forState:UIControlStateNormal];
    [self.zoomOutBtn setBackgroundColor:[UIColor blackColor]];
    [self.zoomOutBtn setTintColor:[UIColor blackColor]];
    self.zoomOutBtn.frame = CGRectMake(6,self.view.frame.size.height - 50,44,44);
    self.zoomOutBtn.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    [self.zoomOutBtn addTarget:self
                    action:@selector(zoomOutTapped:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.zoomOutBtn];
    
    
    self.showTrafficBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.showTrafficBtn setTitle:@"Animated Markers" forState:UIControlStateNormal];
    [self.showTrafficBtn setBackgroundColor:[UIColor blackColor]];
    [self.showTrafficBtn setTintColor:[UIColor blackColor]];
    self.showTrafficBtn.frame = CGRectMake(56,self.view.frame.size.height - 50,180,44);
    self.showTrafficBtn.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    [self.showTrafficBtn addTarget:self
                    action:@selector(trafficTapped:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.showTrafficBtn];

    self.showMBTilesBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.showMBTilesBtn setTitle:@"MBTiles File" forState:UIControlStateNormal];
    [self.showMBTilesBtn setBackgroundColor:[UIColor blackColor]];
    [self.showMBTilesBtn setTintColor:[UIColor blackColor]];
    self.showMBTilesBtn.frame = CGRectMake(56+186,self.view.frame.size.height - 50,180,44);
    self.showMBTilesBtn.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    [self.showMBTilesBtn addTarget:self
                    action:@selector(mbTilesTapped:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.showMBTilesBtn];

    self.showPDFBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.showPDFBtn setTitle:@"GeoPDF File" forState:UIControlStateNormal];
    [self.showPDFBtn setBackgroundColor:[UIColor blackColor]];
    [self.showPDFBtn setTintColor:[UIColor blackColor]];
    self.showPDFBtn.frame = CGRectMake(56+186+186,self.view.frame.size.height - 50,180,44);
    self.showPDFBtn.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    [self.showPDFBtn addTarget:self
                    action:@selector(pdfTapped:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.showPDFBtn];

    self.shadedTerrainBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.shadedTerrainBtn setTitle:@"Shaded Terrain" forState:UIControlStateNormal];
    [self.shadedTerrainBtn setBackgroundColor:[UIColor blackColor]];
    [self.shadedTerrainBtn setTintColor:[UIColor blackColor]];
    self.shadedTerrainBtn.frame = CGRectMake(56+186+186+186,self.view.frame.size.height - 50,180,44);
    self.shadedTerrainBtn.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    [self.shadedTerrainBtn addTarget:self
                    action:@selector(shadedTerrainTapped:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.shadedTerrainBtn];

    
    self.markerLayerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.markerLayerBtn setTitle:@"Current Location" forState:UIControlStateNormal];
    [self.markerLayerBtn setBackgroundColor:[UIColor blackColor]];
    [self.markerLayerBtn setTintColor:[UIColor blackColor]];
    self.markerLayerBtn.frame = CGRectMake(56+186+186+186+186,
                                          self.view.frame.size.height - 50,
                                          180,44);
    self.markerLayerBtn.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    [self.markerLayerBtn addTarget:self
                           action:@selector(markerLayerTapped:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.markerLayerBtn];

    
    
    
    self.diagnosticBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.diagnosticBtn setTitle:@"Diagnostic Layer" forState:UIControlStateNormal];
    [self.diagnosticBtn setBackgroundColor:[UIColor blackColor]];
    [self.diagnosticBtn setTintColor:[UIColor blackColor]];
    self.diagnosticBtn.frame = CGRectMake(56,
                                          self.view.frame.size.height - 50 - 56,
                                          180,44);
    self.diagnosticBtn.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    [self.diagnosticBtn addTarget:self
                           action:@selector(diagnosticLayerTapped:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.diagnosticBtn];

    
    self.naturalAtlasLayerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.naturalAtlasLayerBtn setTitle:@"Natural Atlas" forState:UIControlStateNormal];
    [self.naturalAtlasLayerBtn setBackgroundColor:[UIColor blackColor]];
    [self.naturalAtlasLayerBtn setTintColor:[UIColor blackColor]];
    self.naturalAtlasLayerBtn.frame = CGRectMake(56,
                                          self.view.frame.size.height - 50 - 56 - 56,
                                          180,44);
    self.naturalAtlasLayerBtn.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    [self.naturalAtlasLayerBtn addTarget:self
                           action:@selector(naturalAtlasLayerTapped:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.naturalAtlasLayerBtn];

    
    
    
}

-(void)zoomInTapped:(id)sender {
    [self.mapView zoomIn];
}

-(void)zoomOutTapped:(id)sender {
    [self.mapView zoomOut];
}


// -- ------- ------- ----------------------------------------
// -- Traffic Example ----------------------------------------
// -- ------- ------- ----------------------------------------

-(void)trafficTapped:(id)sender {
    
    if (self.showTrafficBtn.selected) {
        [self hideTraffic];
        self.showTrafficBtn.selected = NO;
        [self.showTrafficBtn setBackgroundColor:[UIColor blackColor]];
    } else {
        [self showTraffic];
        self.showTrafficBtn.selected = YES;
        [self.showTrafficBtn setBackgroundColor:[UIColor darkGrayColor]];
    }
    
}

-(void)hideTraffic {
    
    [self.trafficManager removeFromMap];
    self.trafficManager = nil;
    
}

-(void)showTraffic {
    
    self.trafficManager = [[TrafficManager alloc] initWithMapView:self.mapView];

}

// -- ------- ------- ----------------------------------------
// -- MBTiles Example ----------------------------------------
// -- ------- ------- ----------------------------------------
-(void)mbTilesTapped:(id)sender {
    
    if (self.showMBTilesBtn.selected) {
        [self hideMBTilesLayer];
        self.showMBTilesBtn.selected = NO;
        [self.showMBTilesBtn setBackgroundColor:[UIColor blackColor]];
    } else {
        [self showMBTilesLayer];
        self.showMBTilesBtn.selected = YES;
        [self.showMBTilesBtn setBackgroundColor:[UIColor darkGrayColor]];
    }
    
}

-(void)showMBTilesLayer {
    
    // Retrieve the path for the embedded MBTiles NOAA RNC file
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"13003" ofType:@"mbtiles"];
    
    // Create the layer with the file and add to the map view
    self.mbtilesLayer = [[CLMMBTilesMapLayer alloc] initWithMBTiles:filePath];
    self.mbtilesLayer.zOrder = zOrderMBTiles;
    self.mbtilesLayer.opacity = 1.0;
    [self.mapView addMapLayer:self.mbtilesLayer];
    
    // Add the opacity slider to change the transparency of the MBTiles file
    self.mbtilesOpacitySlider = [[UISlider alloc] initWithFrame:CGRectMake(self.showMBTilesBtn.frame.origin.x,
                                                                           self.showMBTilesBtn.frame.origin.y - 50,
                                                                           self.showMBTilesBtn.frame.size.width,
                                                                           self.showMBTilesBtn.frame.size.height)];
    self.mbtilesOpacitySlider.value = 1.0;
    [self.mbtilesOpacitySlider addTarget:self
                                  action:@selector(mbtilesOpacitySliderChanged:)
                        forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.mbtilesOpacitySlider];
    
}

-(void)hideMBTilesLayer {
    
    [self.mapView removeMapLayer:self.mbtilesLayer];
    self.mbtilesLayer = nil;
    
    [self.mbtilesOpacitySlider removeFromSuperview];
    self.mbtilesOpacitySlider = nil;

}

-(void)mbtilesOpacitySliderChanged:(id)sender {
    
    self.mbtilesLayer.opacity = self.mbtilesOpacitySlider.value;
    
}

// -- --- ------- ----------------------------------------
// -- PDF Example ----------------------------------------
// -- --- ------- ----------------------------------------
-(void)pdfTapped:(id)sender {
    
    if (self.showPDFBtn.selected) {
        [self hidePDFLayer];
        self.showPDFBtn.selected = NO;
        [self.showPDFBtn setBackgroundColor:[UIColor blackColor]];
    } else {
        [self showPDFLayer];
        self.showPDFBtn.selected = YES;
        [self.showPDFBtn setBackgroundColor:[UIColor darkGrayColor]];
    }
    
    
}

-(void)showPDFLayer {
    
    self.pdfMapLayer = [[CLMGeoPDFMapLayer alloc] init];
    [self.mapView addMapLayer:self.pdfMapLayer];
    self.pdfMapLayer.zOrder = zOrderGeoPDF;
    NSString *approachPlatePDF = [[NSBundle mainBundle] pathForResource:@"00329IL29" ofType:@"PDF"];
    approachPlatePDF = [[NSBundle mainBundle] pathForResource:@"NH_Mount_Washington_20210410_TM_geo"
                                                       ofType:@"pdf"];
    [self.pdfMapLayer addPDFFile:approachPlatePDF];
    
    
    // Add the opacity slider to change the transparency of the MBTiles file
    self.pdfOpacitySlider = [[UISlider alloc] initWithFrame:CGRectMake(self.showPDFBtn.frame.origin.x,
                                                                           self.showPDFBtn.frame.origin.y - 50,
                                                                           self.showPDFBtn.frame.size.width,
                                                                           self.showPDFBtn.frame.size.height)];
    self.pdfOpacitySlider.value = 1.0;
    [self.pdfOpacitySlider addTarget:self
                                  action:@selector(pdfOpacitySliderChanged:)
                        forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.pdfOpacitySlider];


}

-(void)hidePDFLayer {
    
    [self.mapView removeMapLayer:self.pdfMapLayer];
    self.pdfMapLayer = nil;
    
    [self.pdfOpacitySlider removeFromSuperview];
    self.pdfOpacitySlider = nil;

}

-(void)pdfOpacitySliderChanged:(id)sender {
    
    self.pdfMapLayer.alpha = self.pdfOpacitySlider.value;

}

// -- ------ ------- ------- ----------------------------------------
// -- Shaded Terrain Example ----------------------------------------
// -- ------ ------- ------- ----------------------------------------
-(void)shadedTerrainTapped:(id)sender {
    
    if (self.shadedTerrainBtn.selected) {
        [self hideShadedTerrainLayer];
        self.shadedTerrainBtn.selected = NO;
        [self.shadedTerrainBtn setBackgroundColor:[UIColor blackColor]];
    } else {
        [self showShadedTerrainLayer];
        self.shadedTerrainBtn.selected = YES;
        [self.shadedTerrainBtn setBackgroundColor:[UIColor darkGrayColor]];
    }
    
    
}

-(void)showShadedTerrainLayer {
    
    self.shadedTerrainLayer = [[CLMShadedTerrainLayer alloc] init];
    self.shadedTerrainLayer.zOrder = zOrderShadedTerrain;
    self.shadedTerrainLayer.terrainRGBURLPattern = @"https://s3.amazonaws.com/elevation-tiles-prod/terrarium/{z}/{x}/{y}.png";
    [self.mapView addMapLayer:self.shadedTerrainLayer];

}

-(void)hideShadedTerrainLayer {
    
    [self.mapView removeMapLayer:self.shadedTerrainLayer];
    self.shadedTerrainLayer = nil;
    
}

// -- ------ ------- ----------------------------------------
// -- Marker Example ----------------------------------------
// -- ------ ------- ----------------------------------------
-(void)markerLayerTapped:(id)sender {
    
    if (self.markerLayerBtn.selected) {
        [self hideMarkerLayer];
        self.markerLayerBtn.selected = NO;
        [self.markerLayerBtn setBackgroundColor:[UIColor blackColor]];
    } else {
        [self showMarkerLayer];
        self.markerLayerBtn.selected = YES;
        [self.markerLayerBtn setBackgroundColor:[UIColor darkGrayColor]];
    }
    
    
}

-(void)showMarkerLayer {

    // Create the current location marker layer
    self.markerLayer = [[CLMMarkerMapLayer alloc] init];
    self.markerLayer.zOrder = zOrderMarkerLayer;
    [self.mapView addMapLayer:self.markerLayer];
    
    // Create the current location marker
    self.currentLocationMarker = [[CLMMarker alloc] init];
    self.currentLocationMarker.markerImage = [CurrentLocationIcons currentLocationDot];
    [self.markerLayer addMarker:self.currentLocationMarker];
    
    // Spin up the current location listener
    self.currentLocationManager = [[CurrentLocationManager alloc] initWithLocationMarker:self.currentLocationMarker];
    
}

-(void)hideMarkerLayer {
    
    // Shut down the current location listener
    [self.currentLocationManager removeFromMap];
    self.currentLocationManager = nil;
    
    // Remove the marker
    [self.markerLayer removeMarker:self.currentLocationMarker];
    
    // Remove the map layer
    [self.mapView removeMapLayer:self.markerLayer];
    self.markerLayer = nil;
    
}


// -- ---------- ----- ------- ----------------------------------------
// -- Diagnostic Layer Example ----------------------------------------
// -- ---------- ----- ------- ----------------------------------------

-(void)diagnosticLayerTapped:(id)sender {
    
    if (self.diagnosticBtn.selected) {
        [self hideDiagnosticLayer];
        self.diagnosticBtn.selected = NO;
        [self.diagnosticBtn setBackgroundColor:[UIColor blackColor]];
    } else {
        [self showDiagnosticLayer];
        self.diagnosticBtn.selected = YES;
        [self.diagnosticBtn setBackgroundColor:[UIColor darkGrayColor]];
    }
}

-(void)showDiagnosticLayer {

    // Create the current location marker layer
    self.diagnosticLayer = [[CLMDiagnosticTileLayer alloc] init];
    self.diagnosticLayer.zOrder = zOrderDiagnosticLayer;
    [self.mapView addMapLayer:self.diagnosticLayer];
    
}

-(void)hideDiagnosticLayer {
   
    // Remove the map layer
    [self.mapView removeMapLayer:self.diagnosticLayer];
    self.diagnosticLayer = nil;
    
}

// -- ------- ----- ----- ------- ----------------------------------------
// -- Natural Atlas Layer Example ----------------------------------------
// -- ------- ----- ----- ------- ----------------------------------------

-(void)naturalAtlasLayerTapped:(id)sender {
    
    if (self.naturalAtlasLayerBtn.selected) {
        [self hideNaturalAtlasLayer];
        self.naturalAtlasLayerBtn.selected = NO;
        [self.naturalAtlasLayerBtn setBackgroundColor:[UIColor blackColor]];
    } else {
        [self showNaturalAtlasLayer];
        self.naturalAtlasLayerBtn.selected = YES;
        [self.naturalAtlasLayerBtn setBackgroundColor:[UIColor darkGrayColor]];
    }
}

-(void)showNaturalAtlasLayer {
    
    // These variables change the look and feel of the layer
    bool darkTheme = true;
    bool lowResShapes = false;

    // When shape files are imported, the resulting metadata can be cached for faster
    // loading in the future.  This will add a mapcache folder to the documents directory
    // of the app and that's used below to set the cache path for each import.
    // The first time the file is imported, it will take a bit of time, the second time
    // the layer is added, it will be faster
    NSString *cachePath = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject] path];
    cachePath = [cachePath stringByAppendingPathComponent:@"mapcache"];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSError *error = nil;
    [fm createDirectoryAtPath:cachePath
  withIntermediateDirectories:YES
                   attributes:nil
                        error:&error];


    NSString *admin0Path = [[NSBundle mainBundle] pathForResource:@"ne_50m_admin_0_boundary_lines_land"
                                                           ofType:@"shp"];
    NSString *admin1Path =  [[NSBundle mainBundle] pathForResource:@"ne_50m_admin_1_states_provinces"
                                                          ofType:@"shp"];
    NSString *landPath = [[NSBundle mainBundle] pathForResource:@"ne_50m_land"
                                                         ofType:@"shp"];

    // Import the land shape file
    if (lowResShapes) {
        landPath = [[NSBundle mainBundle] pathForResource:@"ne_110m_land"
                                                        ofType:@"shp"];
        admin0Path = [[NSBundle mainBundle] pathForResource:@"ne_110m_admin_0_boundary_lines_land"
                                                               ofType:@"shp"];
        admin1Path =  [[NSBundle mainBundle] pathForResource:@"ne_110m_admin_1_states_provinces"
                                                              ofType:@"shp"];

    }

    
    // Add the land layer
    self.naLandLayer = [[CLMShapeMapLayer alloc] init];
    self.naLandLayer.zOrder = zOrderNaturalAtlasLayer;
    [self.mapView addMapLayer:self.naLandLayer];
    [self.naLandLayer setLayerShapeColor:102.0/255.0 green:146.0/255.0 blue:159.0/255.0 alpha:1.0];
    if (darkTheme) {
        [self.naLandLayer setLayerShapeColor:55.0/255.0 green:55.0/255.0 blue:57.0/255.0 alpha:1.0];
    }

    
    // Configure the cache file for the land import
    NSString *landCacheFile = [[[landPath lastPathComponent] stringByDeletingPathExtension] stringByAppendingPathExtension:@"cache"];
    landCacheFile = [cachePath stringByAppendingPathComponent:landCacheFile];
    
    [self.naLandLayer loadShapeFile:landPath
                 polygonsAsLines:NO
                          cacheFile:landCacheFile
                            options:@{SHAPE_FILE_IMPORT_USE_SPHERICAL_EARCUT:@(YES)}];

        
    // Add the lakes layer
    self.naLakesShapeLayer = [[CLMShapeMapLayer alloc] init];
    self.naLakesShapeLayer.zOrder = zOrderNaturalAtlasLayer + 1;
    [self.mapView addMapLayer:self.naLakesShapeLayer];
    [self.naLakesShapeLayer setLayerShapeColor:48.0/255.0 green:77.0/255.0 blue:102.0/255.0 alpha:1.0];
    if (darkTheme) {
        [self.naLakesShapeLayer setLayerShapeColor:27.0/255.0 green:25.0/255.0 blue:30.0/255.0 alpha:1.0];
    }
    
    [self.naLakesShapeLayer loadShapeFile:[[NSBundle mainBundle] pathForResource:@"ne_50m_lakes"
                                                                      ofType:@"shp"]
                      polygonsAsLines:NO];
    
    // Add the outline layer
    // This demo shows how multiple shape files can be imported into a single
    // shape layer
    self.naAdminLinesShapeLayer = [[CLMShapeMapLayer alloc] init];
    self.naAdminLinesShapeLayer.zOrder = zOrderNaturalAtlasLayer+2;
    [self.mapView addMapLayer:self.naAdminLinesShapeLayer ];
    [self.naAdminLinesShapeLayer setLayerShapeColor:200.0/255.0
                                              green:200.0/255.0
                                               blue:200.0/255.0
                                              alpha:1.0];
    [self.naAdminLinesShapeLayer loadShapeFile:admin0Path
                               polygonsAsLines:NO];
    [self.naAdminLinesShapeLayer loadShapeFile:admin1Path
                               polygonsAsLines:YES];
    [self.naAdminLinesShapeLayer loadShapeFile:landPath
                               polygonsAsLines:YES];

    
    
}

-(void)hideNaturalAtlasLayer {
   
    // Remove the map layer
    [self.mapView removeMapLayer:self.naLandLayer];
    [self.mapView removeMapLayer:self.naLakesShapeLayer];
    [self.mapView removeMapLayer:self.naAdminLinesShapeLayer];
    self.naLandLayer = nil;
    self.naLakesShapeLayer = nil;
    self.naAdminLinesShapeLayer = nil;

}


@end
