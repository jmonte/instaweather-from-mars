//
//  WeatherInfo.h
//  Instaweather From Mars
//
//  Created by Jeffrey Monte on 1/4/13.
//  Copyright (c) 2013 Jeffrey Monte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherInfo : NSObject

//
//@property (assign, nonatomic) NSString * minTemp;
//@property (assign, nonatomic) NSString *maxTemp;
//@property (assign, nonatomic) NSString *pressure;
//@property (assign, nonatomic) NSString *pressureText;
//@property (assign, nonatomic) NSString *absHumidity;
//@property (assign, nonatomic) NSString *windSpeed;
//@property (assign, nonatomic) NSString *windDirection;
//@property (assign, nonatomic) NSString *atmosphericOpacity;
//@property (assign, nonatomic) NSString *season;
//@property (assign, nonatomic) NSString *ls;
//@property (assign, nonatomic) NSString *sunrise;
//@property (assign, nonatomic) NSString *sunset;


+(NSString *) getSol;
+(void) setSol: (NSString *) press;

+(NSString *) getMinTemp;
+(void) setMinTemp: (NSString *) press;
+(NSString *) getMaxTemp;
+(void) setMaxTemp: (NSString *) press;


+(NSString *) getMinIntTemp;
+(void) setMinIntTemp: (NSString *) press;
+(NSString *) getMaxIntTemp;
+(void) setMaxIntTemp: (NSString *) press;

+(NSString *) getPressure;

+(void) setPressure: (NSString *) press;


+(NSString *) getPressureText;

+(void) setPressureText: (NSString *) pres;

+(NSString *) getAbsHumidity;

+(void) setAbsHumidity: (NSString *) press;


+(NSString *) getWindSpeed ;

+(void) setWindSpeed: (NSString *) press;


+(NSString *) getWindDirection;

+(void) setWindDirection: (NSString *) press;

+(NSString *) getAtmosphericOpacity;

+(void) setAtmosphericOpacity: (NSString *) press;

+(NSString *) getSeason;

+(void) setSeason: (NSString *) press;


+(NSString *) getLs;

+(void) setLs: (NSString *) press;


+(NSString *) getSunrise;

+(void) setSunrise: (NSString *) press;


+(NSString *) getSunset;

+(void) setSunset: (NSString *) press;


@end
