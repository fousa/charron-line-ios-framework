//
//  CharronDay.m
//  IGC Reader iOS
//
//  Created by Jelle Vandebeeck on 23/10/11.
//  Copyright (c) 2011 10to1. All rights reserved.
//

#import "CharronDay.h"

#import "NSString+CharronLine.h"

@implementation CharronDay
@synthesize totalFlights, points, date, month, flights;

#pragma mark - Memory

- (void)dealloc {
    self.date = nil;
    self.month = nil;
    self.flights = nil;
    
    [super dealloc];
}

#pragma mark - Parsing

+ (CharronDay *)dayFor:(NSDictionary *)dayDictionary {
    CharronDay *day = [[CharronDay new] autorelease];
    day.date = [[dayDictionary objectForKey:@"date"] charronDate];
    day.totalFlights = [[dayDictionary objectForKey:@"flights"] intValue];
    day.points = [[dayDictionary objectForKey:@"points"] intValue];
    
    return day;
}

@end
