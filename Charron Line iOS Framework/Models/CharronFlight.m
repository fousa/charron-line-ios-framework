//
//  CharronFlight.m
//  IGC Reader iOS
//
//  Created by Jelle Vandebeeck on 23/10/11.
//  Copyright (c) 2011 10to1. All rights reserved.
//

#import "CharronFlight.h"

#import "NSString+CharronLine.h"

@implementation CharronFlight
@synthesize day, pilot, glider, igcURLString, club, start, task, score;

#pragma mark - Memory

- (void)dealloc {
    self.day = nil;
    self.pilot = nil;
    self.glider = nil;
    self.igcURLString = nil;
    self.club = nil;
    self.start = nil;
    self.task = nil;
    
    [super dealloc];
}

#pragma mark - Parsing

+ (CharronFlight *)flightFor:(NSDictionary *)flightDictionary {
    CharronFlight *flight = [[CharronFlight new] autorelease];
    flight.pilot = [[flightDictionary objectForKey:@"pilot"] capitalizedString];
    flight.club = [flightDictionary objectForKey:@"club"];
    flight.task = [flightDictionary objectForKey:@"task"];
    if ([[flightDictionary objectForKey:@"glider"] class] != [NSNull class]) flight.glider = [[flightDictionary objectForKey:@"glider"] capitalizedString];
    flight.start = [flightDictionary objectForKey:@"start"];
    flight.score = [[flightDictionary objectForKey:@"score"] intValue];
    flight.igcURLString = [[flightDictionary objectForKey:@"igc"] stringByReplacingOccurrencesOfString:@"\\/" withString:@"/"];
    
    return flight;
}

@end