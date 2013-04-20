//
//  ViewController.h
//  Instaweather From Mars
//
//  Created by Jeffrey Monte on 29/3/13.
//  Copyright (c) 2013 Jeffrey Monte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Utilities.h"

@interface ViewController : UIViewController<AVCaptureVideoDataOutputSampleBufferDelegate> {
    
}
@property (retain, nonatomic) IBOutlet UIImageView *cameraImage;
@property (retain, nonatomic) IBOutlet UIScrollView *filterScroll;

@end
