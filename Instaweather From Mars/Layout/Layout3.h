//
//  Layout3.h
//  Instaweather From Mars
//
//  Created by Jeffrey Monte on 1/4/13.
//  Copyright (c) 2013 Jeffrey Monte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface Layout3 : UIView


@property (nonatomic , assign) UILabel *dayName;
@property (nonatomic , assign) UILabel *date;


@property (nonatomic , assign) UIImageView *weatherIcon;
@property (nonatomic , assign) UILabel *temperature;
@property (nonatomic , assign) UILabel *today;



@property (nonatomic , assign) UILabel *sunrise;
@property (nonatomic , assign) UILabel *sunset;


@property (nonatomic , assign) UILabel *sol;
@property (nonatomic , assign) UILabel *season;

@end
