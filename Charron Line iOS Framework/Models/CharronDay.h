//
//  CharronDay.h
//  IGC Reader iOS
//
//  Created by Jelle Vandebeeck on 23/10/11.
//  Copyright (c) 2011 10to1. All rights reserved.
//

#import "CharronMonth.h"

@interface CharronDay : NSObject
@property (nonatomic, retain) CharronMonth *month;
@property (nonatomic, retain) NSDate *date;
@property (nonatomic, assign) int totalFlights;
@property (nonatomic, assign) int points;
@property (nonatomic, retain) NSArray *flights;

+ (CharronDay *)dayFor:(NSDictionary *)dayDictionary;
@end
