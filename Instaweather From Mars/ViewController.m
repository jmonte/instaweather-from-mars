//
//  ViewController.m
//  Instaweather From Mars
//
//  Created by Jeffrey Monte on 29/3/13.
//  Copyright (c) 2013 Jeffrey Monte. All rights reserved.
//

#import "ViewController.h"

#import "Layout1.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Layout1 *lay1 = [[Layout1 alloc] initWithFrame:CGRectMake(0, 0, 320, 380)];
    
    [self.view addSubview:lay1];
    
    [self startCamera];
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)startCamera {
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    session.sessionPreset = AVCaptureSessionPresetMedium;
    AVCaptureDevice *device =
    [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    AVCaptureDeviceInput *input =
    [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (!input) {
        
    }
    [session addInput:input];
    AVCaptureVideoDataOutput *output = [[AVCaptureVideoDataOutput alloc] init];
    output.alwaysDiscardsLateVideoFrames = YES;
    [session addOutput:output];
    output.videoSettings =@{ (NSString *)kCVPixelBufferPixelFormatTypeKey : @(kCVPixelFormatType_32BGRA) };
    dispatch_queue_t queue = dispatch_queue_create("MyQueue", NULL);
    [output setSampleBufferDelegate:self queue:queue];
    dispatch_release(queue);
    [session startRunning];
}


- (void)captureOutput:(AVCaptureOutput *)captureOutput
didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer
       fromConnection:(AVCaptureConnection *)connection {
    
    UIImage *image = [Utilities imageFromSampleBuffer:sampleBuffer];
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        
        [self.cameraImage setImage:image];
        
    });
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_cameraImage release];
    [_filterScroll release];
    [super dealloc];
}

@end