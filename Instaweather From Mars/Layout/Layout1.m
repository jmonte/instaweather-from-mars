//
//  Layout1.m
//  Instaweather From Mars
//
//  Created by Jeffrey Monte on 30/3/13.
//  Copyright (c) 2013 Jeffrey Monte. All rights reserved.
//

#import "Layout1.h"


@class WeatherInfo;
@implementation Layout1

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor clearColor];

        
        // sunrise
        UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 225, 320, 155)];
        bg.backgroundColor = [UIColor blackColor];
        bg.alpha = 0.3;

        
        UIView *border = [[UIView alloc] initWithFrame:CGRectMake(20, 316, 280, 2)];
        border.backgroundColor = [UIColor whiteColor];
        border.alpha = 0.8;
        
        
        UIImageView *sunriseIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sunrise.png"]];
        sunriseIcon.backgroundColor = [UIColor clearColor];
        sunriseIcon.frame = CGRectMake(215, 328, 20, 20);
        
        self.sunrise = [[UILabel alloc] initWithFrame:CGRectMake(243, 328, 60, 20)];
        self.sunrise.font = [UIFont fontWithName:@"Avenir-Light" size:15.0f];
        self.sunrise.textColor = [UIColor whiteColor];
        self.sunrise.backgroundColor = [UIColor clearColor];
        self.sunrise.text = [WeatherInfo getSunrise];
        
        
        // sunset
        UIImageView *sunsetIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sunset.png"]];
        sunsetIcon.backgroundColor = [UIColor clearColor];
        sunsetIcon.frame = CGRectMake(215, 353, 20, 20);
        
        self.sunset = [[UILabel alloc] initWithFrame:CGRectMake(243, 353, 60, 20)];
        self.sunset.font = [UIFont fontWithName:@"Avenir-Light" size:15.0f];
        self.sunset.textColor = [UIColor whiteColor];
        self.sunset.backgroundColor = [UIColor clearColor];
        self.sunset.text = [WeatherInfo getSunset];
        
        
        // temperature Minimum
        UIImageView *temperatureMinIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"temperatureMin.png"]];
        temperatureMinIcon.backgroundColor = [UIColor clearColor];
        temperatureMinIcon.frame = CGRectMake(220, 260, 20, 20);
        
        self.temperatureMin = [[UILabel alloc] initWithFrame:CGRectMake(248, 260, 60, 20)];
        self.temperatureMin.font = [UIFont fontWithName:@"Avenir-Light" size:15.0f];
        self.temperatureMin.textColor = [UIColor whiteColor];
        self.temperatureMin.backgroundColor = [UIColor clearColor];
        self.temperatureMin.text = [WeatherInfo getMinTemp];
        
        
        // temperature Maximum
        UIImageView *temperatureMaxIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"temperatureMax.png"]];
        temperatureMaxIcon.backgroundColor = [UIColor clearColor];
        temperatureMaxIcon.frame = CGRectMake(220, 285, 20, 20);
        
        self.temperatureMax = [[UILabel alloc] initWithFrame:CGRectMake(248, 285, 60, 20)];
        self.temperatureMax.font = [UIFont fontWithName:@"Avenir-Light" size:15.0f];
        self.temperatureMax.textColor = [UIColor whiteColor];
        self.temperatureMax.backgroundColor = [UIColor clearColor];
        self.temperatureMax.text = [WeatherInfo getMaxTemp];

        
        
        
        self.weatherIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sunny.png"]];
        self.weatherIcon.backgroundColor = [UIColor clearColor];
        self.weatherIcon.frame = CGRectMake(25, 260, 40, 40);
        
        
        self.sol = [[UILabel alloc] initWithFrame:CGRectMake(80, 260, 110, 40)];
        self.sol.font = [UIFont fontWithName:@"Avenir-Heavy" size:30.0f];
        self.sol.textColor = [UIColor whiteColor];
        self.sol.backgroundColor = [UIColor clearColor];
        self.sol.text = [WeatherInfo getSol];
        
        self.weather = [[UILabel alloc] initWithFrame:CGRectMake(80, 280, 110, 40)];
        self.weather.font = [UIFont fontWithName:@"Avenir-Heavy" size:14.0f];
        self.weather.textColor = [UIColor whiteColor];
        self.weather.backgroundColor = [UIColor clearColor];
        self.weather.text = [WeatherInfo getAtmosphericOpacity];
        
        
        UIImageView *windIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wind.png"]];
        windIcon.backgroundColor = [UIColor clearColor];
        windIcon.frame = CGRectMake(25, 333, 40, 40);
        
        self.windDirection = [[UILabel alloc] initWithFrame:CGRectMake(80, 330, 60, 20)];
        self.windDirection.font = [UIFont fontWithName:@"Avenir-Heavy" size:18.0f];
        self.windDirection.textColor = [UIColor whiteColor];
        self.windDirection.backgroundColor = [UIColor clearColor];
        self.windDirection.text = [WeatherInfo getWindDirection];
        
        
        self.windSpeed = [[UILabel alloc] initWithFrame:CGRectMake(80, 350, 60, 20)];
        self.windSpeed.font = [UIFont fontWithName:@"Avenir-Heavy" size:18.0f];
        self.windSpeed.textColor = [UIColor whiteColor];
        self.windSpeed.backgroundColor = [UIColor clearColor];
        self.windSpeed.text = [WeatherInfo getWindSpeed];
        
        
        
        
        [self addSubview:bg];
        
        [self addSubview:border]; [border release];
        
        [self addSubview:self.weatherIcon];
        [self addSubview:self.sol];
        [self addSubview:self.weather];
        
        
        [self addSubview:windIcon]; [windIcon release];
        [self addSubview:self.windDirection];
        [self addSubview:self.windSpeed];
        
        
        [self addSubview:temperatureMinIcon]; [temperatureMinIcon release];
        [self addSubview:self.temperatureMin];
        
        [self addSubview:temperatureMaxIcon]; [temperatureMaxIcon release];
        [self addSubview:self.temperatureMax];
        
        [self addSubview:sunriseIcon]; [sunriseIcon release];
        [self addSubview:self.sunrise];
        
        [self addSubview:sunsetIcon]; [sunsetIcon release];
        [self addSubview:self.sunset];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
