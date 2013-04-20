//
//  Utilities.h
//  Hue Are You
//
//  Created by Jeffrey Monte on 6/2/13.
//  Copyright (c) 2013 Potato Information Network. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Utilities : NSObject


+ (UIImage *) imageFromSampleBuffer:(CMSampleBufferRef) sampleBuffer;
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
+ (UIColor *) colorFromHexString:(NSString *)hexString;

@end
