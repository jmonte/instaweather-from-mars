//
//  Layout2.h
//  Instaweather From Mars
//
//  Created by Jeffrey Monte on 1/4/13.
//  Copyright (c) 2013 Jeffrey Monte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface Layout2 : UIView


@property (nonatomic , assign) UIImageView *weatherIcon;

@property (nonatomic , assign) UILabel *temperature;




@property (nonatomic , assign) UILabel *windDirection;
@property (nonatomic , assign) UILabel *windSpeed;


@property (nonatomic , assign) UILabel *sol;
@property (nonatomic , assign) UILabel *season;
@end
