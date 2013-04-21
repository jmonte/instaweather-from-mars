//
//  ViewController.h
//  Instaweather From Mars
//
//  Created by Jeffrey Monte on 29/3/13.
//  Copyright (c) 2013 Jeffrey Monte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <AVFoundation/AVFoundation.h>

#import <CoreImage/CoreImage.h>
#import <MessageUI/MessageUI.h>
#import <QuartzCore/QuartzCore.h>
#import "Utilities.h"
#import "WeatherInfo.h"
#import "UIImage+ColouredButton.h"

@interface ViewController : UIViewController<AVCaptureVideoDataOutputSampleBufferDelegate,UIAccelerometerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,MFMailComposeViewControllerDelegate> {
    
}
@property (retain, nonatomic) IBOutlet UIView *photoView;
@property (retain, nonatomic) AVCaptureSession *session;
@property (retain, nonatomic) IBOutlet UIImageView *cameraImage;
@property (retain, nonatomic) IBOutlet UIScrollView *filterScroll;

@property (retain, nonatomic) IBOutlet UIImageView *marsSky;
@property (retain, nonatomic) IBOutlet UIButton *overlay1;
@property (retain, nonatomic) IBOutlet UIImageView *marsOverlayImage;
@end
