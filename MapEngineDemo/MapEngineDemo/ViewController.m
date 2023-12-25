//
//  ViewController.m
//  CLMMapKitLiteDemo
//
//  Created by Malcolm Toon on 12/20/23.
//

#import "ViewController.h"
#import <CLMMapKit/CLMMapKitLite.h>

@interface ViewController ()

@property CLMMapView *mapView;
@property UIButton *zoomInBtn;
@property UIButton *zoomOutBtn;

@end

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
    baseLayer.zOrder = 0;
    [self.mapView addMapLayer:baseLayer];
    
}

-(void)addBaseMapTileLayer {
    
    // This will add a common raster map layer using the URL pattern.  This
    // url can be anything as long as the X/Y/Zoom are put in using the curly
    // braces
    NSString *urlPattern = @"https://tile.openstreetmap.org/{z}/{x}/{y}.png";
    CLMWebTileMapLayer *tileLayer = [[CLMWebTileMapLayer alloc] initWithURLPattern:urlPattern
                                                                         cacheName:nil];
    tileLayer.zOrder = 1000;
    [self.mapView addMapLayer:tileLayer];
      
}

-(void)addEdgeEffectLayer {
    
    // This adds the darkened edge to help the sense of depth perception
    CLMEdgeEfffectMapLayer *edgeEffect = [[CLMEdgeEfffectMapLayer alloc] init];
    edgeEffect.zOrder = 2000;
    [self.mapView addMapLayer:edgeEffect];

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
    [self.zoomInBtn addTarget:self
                    action:@selector(zoomInTapped:)
          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.zoomInBtn];
    
    self.zoomOutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.zoomOutBtn setTitle:@"-" forState:UIControlStateNormal];
    [self.zoomOutBtn setBackgroundColor:[UIColor blackColor]];
    [self.zoomOutBtn setTintColor:[UIColor blackColor]];
    self.zoomOutBtn.frame = CGRectMake(6,self.view.frame.size.height - 50,44,44);
    [self.zoomOutBtn addTarget:self
                    action:@selector(zoomOutTapped:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.zoomOutBtn];
    
    
}

-(void)zoomInTapped:(id)sender {
    [self.mapView zoomIn];
}

-(void)zoomOutTapped:(id)sender {
    [self.mapView zoomOut];
}


@end
