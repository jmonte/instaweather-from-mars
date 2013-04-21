//
//  Layout2.m
//  Instaweather From Mars
//
//  Created by Jeffrey Monte on 1/4/13.
//  Copyright (c) 2013 Jeffrey Monte. All rights reserved.
//

#import "Layout2.h"
#import "WeatherInfo.h"


@implementation Layout2

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        
        UIImageView *layout2Icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"layout2BG.png"]];
        layout2Icon.backgroundColor = [UIColor clearColor];
        layout2Icon.frame = CGRectMake(19, 75, 76, 177);
        
        
        self.weatherIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sunny.png"]];
        self.weatherIcon.backgroundColor = [UIColor clearColor];
        self.weatherIcon.frame = CGRectMake(34, 90, 45, 45);

        
        
        UIImageView *down= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"down.png"]];
        down.backgroundColor = [UIColor clearColor];
        down.frame = CGRectMake(25, 144, 10, 10);
        
        self.temperature = [[UILabel alloc] initWithFrame:CGRectMake(19, 140, 76, 20)];
        self.temperature.font = [UIFont fontWithName:@"Avenir-Heavy" size:18.0f];
        self.temperature.textAlignment = NSTextAlignmentCenter;
        self.temperature.textColor = [UIColor whiteColor];
        self.temperature.backgroundColor = [UIColor clearColor];
        self.temperature.text = [WeatherInfo getMinIntTemp];
        
        
        
        self.windDirection = [[UILabel alloc] initWithFrame:CGRectMake(19, 185, 76, 30)];
        self.windDirection.font = [UIFont fontWithName:@"Avenir-Heavy" size:22.0f];
        self.windDirection.textColor = [UIColor blackColor];
        self.windDirection.textAlignment = NSTextAlignmentCenter;
        self.windDirection.backgroundColor = [UIColor clearColor];
        self.windDirection.text = [WeatherInfo getWindDirection];
        
        
        self.windSpeed = [[UILabel alloc] initWithFrame:CGRectMake(19, 210, 76, 30)];
        self.windSpeed.font = [UIFont fontWithName:@"Avenir-Heavy" size:22.0f];
        self.windSpeed.textColor = [UIColor blackColor];
        self.windSpeed.textAlignment = NSTextAlignmentCenter;
        self.windSpeed.backgroundColor = [UIColor clearColor];
        self.windSpeed.text = [WeatherInfo getWindSpeed];
        
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

        
        
        
        [self addSubview:layout2Icon]; [layout2Icon release];
        
        [self addSubview:self.weatherIcon];
        [self addSubview:self.temperature];
        [self addSubview:down];
        
        [self addSubview:self.windDirection];
        [self addSubview:self.windSpeed];
        
        
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
