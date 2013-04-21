//
//  Layout3.m
//  Instaweather From Mars
//
//  Created by Jeffrey Monte on 1/4/13.
//  Copyright (c) 2013 Jeffrey Monte. All rights reserved.
//

#import "Layout3.h"
#import "WeatherInfo.h"

@implementation Layout3

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 380)];
        bg.backgroundColor = [UIColor blackColor];
        bg.alpha = 0.1;
        
        
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"EEEE"];
        
        self.dayName = [[UILabel alloc] initWithFrame:CGRectMake(19, 23, 120, 20)];
        self.dayName.font = [UIFont fontWithName:@"AvenirNextCondensed-Bold" size:18.0f];
        self.dayName.textColor = [UIColor whiteColor];
        self.dayName.backgroundColor = [UIColor clearColor];
        self.dayName.text = [[dateFormatter stringFromDate:[NSDate date]] uppercaseString];
        [dateFormatter setDateFormat:@"MMMM d"];
        NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
        [dateFormatter release];  // delete this line if your project uses ARC
        self.date = [[UILabel alloc] initWithFrame:CGRectMake(19, 40, 1210, 20)];
        self.date.font = [UIFont fontWithName:@"AvenirNextCondensed-Medium" size:15.0f];
        self.date.textColor = [UIColor whiteColor];
        self.date.backgroundColor = [UIColor clearColor];
        self.date.text = [dateString uppercaseString];

        
        
        self.weatherIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sunny.png"]];
        self.weatherIcon.backgroundColor = [UIColor clearColor];
        self.weatherIcon.frame = CGRectMake(25, 85, 60, 60);
        
        
        UIImageView *down= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"down.png"]];
        down.backgroundColor = [UIColor clearColor];
        down.frame = CGRectMake(5, 152, 20, 20);
        
        self.temperature = [[UILabel alloc] initWithFrame:CGRectMake(25, 145, 150, 35)];
        self.temperature.font = [UIFont fontWithName:@"Avenir-Heavy" size:30.0f];
        self.temperature.textColor = [UIColor whiteColor];
        self.temperature.backgroundColor = [UIColor clearColor];
        self.temperature.text = [WeatherInfo getMinIntTemp];
        
        

        
        
        self.today = [[UILabel alloc] initWithFrame:CGRectMake(5, 182, 110, 20)];
        self.today.font = [UIFont fontWithName:@"AvenirNextCondensed-Bold" size:18.0f];
        self.today.textColor = [UIColor whiteColor];
        self.today.textAlignment = NSTextAlignmentCenter;
        self.today.backgroundColor = [UIColor blackColor];
        self.today.layer.cornerRadius = 5.0f;
        self.today.text = @"TODAY";
        
        UIImageView *sunriseIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sunrise.png"]];
        sunriseIcon.backgroundColor = [UIColor clearColor];
        sunriseIcon.frame = CGRectMake(19, 210, 20, 20);
        
        self.sunrise = [[UILabel alloc] initWithFrame:CGRectMake(43, 210,80, 20)];
        self.sunrise.font = [UIFont fontWithName:@"Avenir-Light" size:17.0f];
        self.sunrise.textColor = [UIColor whiteColor];
        self.sunrise.backgroundColor = [UIColor clearColor];
        self.sunrise.text = [WeatherInfo getSunrise];
        
        
        // sunset
        UIImageView *sunsetIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sunset.png"]];
        sunsetIcon.backgroundColor = [UIColor clearColor];
        sunsetIcon.frame = CGRectMake(19, 235, 20, 20);
        
        self.sunset = [[UILabel alloc] initWithFrame:CGRectMake(43, 235, 80, 20)];
        self.sunset.font = [UIFont fontWithName:@"Avenir-Light" size:17.0f];
        self.sunset.textColor = [UIColor whiteColor];
        self.sunset.backgroundColor = [UIColor clearColor];
        self.sunset.text = [WeatherInfo getSunset];
        
        
        
        
        self.sol = [[UILabel alloc] initWithFrame:CGRectMake(19, 310, 80, 20)];
        self.sol .font = [UIFont fontWithName:@"Avenir-Heavy" size:12.0f];
        self.sol .textColor = [UIColor whiteColor];
        self.sol.textAlignment = NSTextAlignmentCenter;
        self.sol .backgroundColor = [UIColor clearColor];
        self.sol .text = [[WeatherInfo getSol] uppercaseString];
        
        
        self.season = [[UILabel alloc] initWithFrame:CGRectMake(19, 325, 80, 20)];
        self.season.font = [UIFont fontWithName:@"Avenir-Heavy" size:12.0f];
        self.season.textColor = [UIColor whiteColor];
        self.season.textAlignment = NSTextAlignmentCenter;
        self.season.backgroundColor = [UIColor clearColor];
        self.season.text = [[WeatherInfo getSeason] uppercaseString];
        
        
        [self addSubview:bg]; [bg release];
        
        [self addSubview:self.dayName];
        [self addSubview:self.date];
        
        
        [self addSubview:self.weatherIcon];
        [self addSubview:down];  [down release];
        [self addSubview:self.temperature];
        
        [self addSubview:self.today];
        
        [self addSubview:sunriseIcon]; [sunriseIcon release];
        [self addSubview:self.sunrise];
        
        [self addSubview:sunsetIcon]; [sunsetIcon release];
        [self addSubview:self.sunset];
        
        
        [self addSubview:self.sol];
        [self addSubview:self.season];
        
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
