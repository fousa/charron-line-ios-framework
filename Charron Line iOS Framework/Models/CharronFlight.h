//
//  CharronFlight.h
//  IGC Reader iOS
//
//  Created by Jelle Vandebeeck on 23/10/11.
//  Copyright (c) 2011 10to1. All rights reserved.
//

#import "CharronDay.h"

@interface CharronFlight : NSObject
@property (nonatomic, retain) CharronDay *day;
@property (nonatomic, retain) NSString *pilot;
@property (nonatomic, retain) NSString *club;
@property (nonatomic, retain) NSString *task;
@property (nonatomic, retain) NSString *glider;
@property (nonatomic, retain) NSString *start;
@property (nonatomic, retain) NSString *igcURLString;
@property (nonatomic, assign) int score;

+ (CharronFlight *)flightFor:(NSDictionary *)flightDictionary;
@end