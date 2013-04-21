//
//  ViewController.m
//  Instaweather From Mars
//
//  Created by Jeffrey Monte on 29/3/13.
//  Copyright (c) 2013 Jeffrey Monte. All rights reserved.
//

#import "ViewController.h"

#import "Layout1.h"
#import "Layout2.h"
#import "Layout3.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIAccelerometer sharedAccelerometer] setUpdateInterval:1.0/30.0];
    [[UIAccelerometer sharedAccelerometer] setDelegate:self]; [super viewDidLoad];
    
    [WeatherInfo setAbsHumidity:@"--"];
    [WeatherInfo setAtmosphericOpacity:@"Sunny"];
    [WeatherInfo setLs:@"293.8"];
    [WeatherInfo setMaxTemp:@"3.05°C"];
    [WeatherInfo setMaxIntTemp:@"3°C"];
    [WeatherInfo setMinTemp:@"-69.47°C"];
    [WeatherInfo setMinIntTemp:@"-69°C"];
    [WeatherInfo setPressure:@"889.18"];
    [WeatherInfo setPressureText:@"Higher"];
    [WeatherInfo setSeason:@"Month 10"];
    [WeatherInfo setSol:@"Sol 231"];
    [WeatherInfo setSunrise:@"6:00a.m."];
    [WeatherInfo setSunset:@"5:00p.m."];
    [WeatherInfo setWindDirection:@"EAST"];
    [WeatherInfo setWindSpeed:@"2m/s"];
    
    
    self.marsOverlayImage.hidden = YES;
    self.marsSky.alpha = 0;
    
    self.filterScroll.contentSize = CGSizeMake(320 *3, 380);

    self.filterScroll.pagingEnabled = YES;
    
    Layout1 *lay1 = [[Layout1 alloc] initWithFrame:CGRectMake(320*0, 0, 320, 380)];
    [self.filterScroll addSubview:lay1];
    
    Layout2 *lay2 = [[Layout2 alloc] initWithFrame:CGRectMake(320*1, 0, 320, 380)];
    [self.filterScroll addSubview:lay2];
    
    
    
    Layout3 *lay3 = [[Layout3 alloc] initWithFrame:CGRectMake(320*2, 0, 320, 380)];
    [self.filterScroll addSubview:lay3];
    
    
    [self startCamera];
    
    
   	// Do any additional setup after loading the view, typically from a nib.
}

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    

    if( acceleration.z > 0.20 ) {
       
        [UIView animateWithDuration:0.5
                              delay:0.00
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                              self.marsSky.alpha = 0.8;
                         }
                         completion:^(BOOL finished){
                             
                         }];
    } else {
        [UIView animateWithDuration:0.5
                              delay:0.00
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             self.marsSky.alpha = 0.0;
                         }
                         completion:^(BOOL finished){
                             
                         }];
    }
    
}

- (IBAction)overlay1:(id)sender {
    self.marsOverlayImage.hidden = NO;
    self.marsOverlayImage.image = [UIImage imageNamed:@"marsOverlay1.png"];
    [self.marsOverlayImage setNeedsDisplay];
}

- (IBAction)overlay2:(id)sender {
    self.marsOverlayImage.hidden = NO;
    self.marsOverlayImage.image = [UIImage imageNamed:@"marsOverlay2.png"];
    [self.marsOverlayImage setNeedsDisplay];
}

- (IBAction)overlay3:(id)sender {
    self.marsOverlayImage.hidden = NO;
    self.marsOverlayImage.image = [UIImage imageNamed:@"marsOverlay3.png"];
    [self.marsOverlayImage setNeedsDisplay];
}
- (IBAction)overlay4:(id)sender {
    self.marsOverlayImage.hidden = NO;
    self.marsOverlayImage.image = [UIImage imageNamed:@"marsOverlay4.png"];
    [self.marsOverlayImage setNeedsDisplay];
}

- (IBAction)overlay0:(id)sender {
    self.marsOverlayImage.hidden = YES;
}



-(void)startCamera {
    self.session = [[AVCaptureSession alloc] init];
    self.session.sessionPreset = AVCaptureSessionPresetMedium;
    AVCaptureDevice *device =
    [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    AVCaptureDeviceInput *input =
    [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (!input) {
        
    }
    [self.session addInput:input];
    AVCaptureVideoDataOutput *output = [[AVCaptureVideoDataOutput alloc] init];
    output.alwaysDiscardsLateVideoFrames = YES;
    [self.session addOutput:output];
    output.videoSettings =@{ (NSString *)kCVPixelBufferPixelFormatTypeKey : @(kCVPixelFormatType_32BGRA) };
    dispatch_queue_t queue = dispatch_queue_create("MyQueue", NULL);
    [output setSampleBufferDelegate:self queue:queue];
    dispatch_release(queue);
    [self.session startRunning];
}
- (IBAction)openGallery:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
    [picker release];
}

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info
{
	NSData *dataImage = UIImageJPEGRepresentation([info objectForKey:@"UIImagePickerControllerOriginalImage"],1);
    [self stopCamera];
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        [self.cameraImage setImage:[[UIImage alloc] initWithData:dataImage]];
        [self takePicture:nil];
    });
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	if(![self.session isRunning]) [self.session startRunning];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void) stopCamera {
    [self.session stopRunning];
}

- (IBAction)takePicture:(id)sender {
    
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        [self stopCamera];
        
        UIImageOrientation originalOrientation =self.cameraImage.image.imageOrientation;
        CGFloat originalScale = self.cameraImage.image.scale;
        CIImage *cimage = [CIImage imageWithCGImage:self.cameraImage.image.CGImage];
        
        
        
        CIFilter *myFilter2 = [CIFilter filterWithName:@"CIColorControls"];
        [myFilter2 setDefaults];
        [myFilter2 setValue:cimage forKey:@"inputImage"];
        [myFilter2 setValue:[NSNumber numberWithFloat:-0.02]  forKey:@"inputBrightness"];
        [myFilter2 setValue:[NSNumber numberWithFloat:1.0] forKey:@"inputContrast"];
        
        
        CIFilter *myFilter = [CIFilter filterWithName:@"CISepiaTone"];
        
        [myFilter setDefaults];
        [myFilter setValue:[myFilter2 outputImage] forKey:@"inputImage"];
        [myFilter setValue:[NSNumber numberWithFloat:0.8f] forKey:@"inputIntensity"];
        
       

        CIImage *image = [myFilter outputImage];
        CIContext *context = [CIContext contextWithOptions:nil];
        CGImageRef cgImage = [context createCGImage:image fromRect:image.extent];
        UIImage *resultUIImage = [UIImage imageWithCGImage:cgImage scale:originalScale orientation:originalOrientation];
        
        [self.cameraImage setImage:resultUIImage];
        
        [self.cameraImage setNeedsDisplay];
    });

}


- (IBAction)showShare:(id)sender {
    UIActionSheet *popupQuery = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Email", @"Facebook",@"Twitter",@"Save", nil];
    
	popupQuery.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
	[popupQuery showInView:self.view];
	[popupQuery release];
}


- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
//    [self dismissModalViewControllerAnimated:YES];
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	/**
	 * OR use the following switch statement
	 * Suggested by Colin =)
	 */
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    UIView *view = self.photoView;
    
    UIGraphicsBeginImageContextWithOptions(view.frame.size, YES, 8.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    
    switch (buttonIndex) {
        case 0:{
            if ([MFMailComposeViewController canSendMail]) {
                MFMailComposeViewController * emailController = [[MFMailComposeViewController alloc] init];
                emailController.mailComposeDelegate = self;
                
                NSString *subject = @"Check Out Me on Mars";
                NSString *mailBody = @"What can you say?";
                
//                [view.layer setBorderWidth:0];
                
                
                [emailController addAttachmentData:UIImageJPEGRepresentation(viewImage, 1) mimeType:@"image/jpeg" fileName:@"MyFile.jpeg"];
                
                [emailController setSubject:subject];
                [emailController setMessageBody:mailBody isHTML:YES];
                
                [self presentViewController:emailController animated:YES completion:nil];
//                [self presentModalViewController:emailController animated:YES];
                
                [emailController release];
            }
            // Show error if no mail account is active
            else {
                UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"You must have a mail account in order to send an email" delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", @"OK") otherButtonTitles:nil];
                [alertView show];
                [alertView release];
            }
            
            
        }
            break;
        case 1: {
            if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
                // Initialize Compose View Controller
                SLComposeViewController *vc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
                // Configure Compose View Controller
                [vc setInitialText:@"Me on Mars"];
                [vc addImage:viewImage];
                // Present Compose View Controller
                [self presentViewController:vc animated:YES completion:nil];
            } else {
                NSString *message = @"It seems that we cannot talk to Facebook at the moment or you have not yet added your Facebook account to this device. Go to the Settings application to add your Facebook account to this device.";
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            }
            
        }
            break;
        case 2: {
            if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
                // Initialize Compose View Controller
                SLComposeViewController *vc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
                // Configure Compose View Controller
                [vc setInitialText:@"Me on Mars"];
                [vc addImage:viewImage];
                // Present Compose View Controller
                [self presentViewController:vc animated:YES completion:nil];
            } else {
                NSString *message = @"It seems that we cannot talk to Twitter at the moment or you have not yet added your Twitter account to this device. Go to the Settings application to add your Twitter account to this device.";
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            }

        }
            break;
        case 3:{
            // Save Picture

            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops" message:@"Photo Saved in Gallery" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
        }
            break;
    }
    
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
    [_marsOverlayImage release];
    [_overlay1 release];
    [_marsSky release];
    [_photoView release];
    [super dealloc];
}

@end