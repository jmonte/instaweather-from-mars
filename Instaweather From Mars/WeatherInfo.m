//
//  WeatherInfo.m
//  Instaweather From Mars
//
//  Created by Jeffrey Monte on 1/4/13.
//  Copyright (c) 2013 Jeffrey Monte. All rights reserved.
//

#import "WeatherInfo.h"

@implementation WeatherInfo

+(NSString *) getSol{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    return [settings stringForKey:@"sol"];
}

+(void) setSol: (NSString *) press {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setValue:press forKey:@"sol"];
    [settings synchronize];
}

+(NSString *) getMinTemp {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    return [settings stringForKey:@"minTemp"];
}

+(void) setMinTemp: (NSString *) press {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setValue:press forKey:@"minTemp"];
    [settings synchronize];
}

+(NSString *) getMaxTemp {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    return [settings stringForKey:@"maxTemp"];
}

+(void) setMaxTemp: (NSString *) press {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setValue:press forKey:@"maxTemp"];
    [settings synchronize];
}

+(NSString *) getMinIntTemp {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    return [settings stringForKey:@"minIntTemp"];
}

+(void) setMinIntTemp: (NSString *) press {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setValue:press forKey:@"minIntTemp"];
    [settings synchronize];
}

+(NSString *) getMaxIntTemp {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    return [settings stringForKey:@"maxIntTemp"];
}

+(void) setMaxIntTemp: (NSString *) press {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setValue:press forKey:@"maxIntTemp"];
    [settings synchronize];
}


+(NSString *) getPressure {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    return [settings stringForKey:@"pressure"];
}

+(void) setPressure: (NSString *) press {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setValue:press forKey:@"pressure"];
    [settings synchronize];
}


+(NSString *) getPressureText {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    return [settings stringForKey:@"pressureText"];
}

+(void) setPressureText: (NSString *) press {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setValue:press forKey:@"pressureText"];
    [settings synchronize];
}


+(NSString *) getAbsHumidity {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    return [settings stringForKey:@"absHumidity"];
}

+(void) setAbsHumidity: (NSString *) press {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setValue:press forKey:@"absHumidity"];
    [settings synchronize];
}


+(NSString *) getWindSpeed {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    return [settings stringForKey:@"windSpeed"];
}

+(void) setWindSpeed: (NSString *) press {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setValue:press forKey:@"windSpeed"];
    [settings synchronize];
}


+(NSString *) getWindDirection {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    return [settings stringForKey:@"windDirection"];
}

+(void) setWindDirection: (NSString *) press {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setValue:press forKey:@"windDirection"];
    [settings synchronize];
}

+(NSString *) getAtmosphericOpacity {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    return [settings stringForKey:@"atmosphericOpacity"];
}

+(void) setAtmosphericOpacity: (NSString *) press {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setValue:press forKey:@"atmosphericOpacity"];
    [settings synchronize];
}


+(NSString *) getSeason {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    return [settings stringForKey:@"season"];
}

+(void) setSeason: (NSString *) press {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setValue:press forKey:@"season"];
    [settings synchronize];
}


+(NSString *) getLs{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    return [settings stringForKey:@"ls"];
}

+(void) setLs: (NSString *) press {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setValue:press forKey:@"ls"];
    [settings synchronize];
}




+(NSString *) getSunrise{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    return [settings stringForKey:@"sunrise"];
}

+(void) setSunrise: (NSString *) press {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setValue:press forKey:@"sunrise"];
    [settings synchronize];
}


+(NSString *) getSunset{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    return [settings stringForKey:@"sunset"];
}

+(void) setSunset: (NSString *) press {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setValue:press forKey:@"sunset"];
    [settings synchronize];
}


@end
