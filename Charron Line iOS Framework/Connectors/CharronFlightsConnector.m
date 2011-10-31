//
//  CharronFlightsConnector.m
//  IGC Reader iOS
//
//  Created by Jelle Vandebeeck on 23/10/11.
//  Copyright (c) 2011 10to1. All rights reserved.
//

#import "CharronFlightsConnector.h"

#import "CharronFlight.h"

#import "NSDate+CharronLine.h"

// Remove Coby warnings
@interface NSArray (RemoveWarnings)
- (NSArray *)map: (id (^)(id obj))block;
@end

@implementation CharronFlightsConnector
@synthesize day;

#pragma mark URL Constructors

- (NSString *)command {
    return [NSString stringWithFormat:@"%@/flights.php?day=%@", self.day.month.year.year, [self.day.date charronURLFormat]];
}

#pragma mark - Parser

- (void)didReceiveJSON:(id)jsonObject {
    NSArray *flights = [((NSArray *)jsonObject) map:^id(NSDictionary *flightDictionary) {
        CharronFlight *flight = [CharronFlight flightFor:flightDictionary];
        flight.day = self.day;
        return flight;
    }];
    self.day.flights = flights;
    
    if ([self.delegate respondsToSelector:@selector(didReceiveDay:)]) {
        [self.delegate performSelector:@selector(didReceiveDay:) withObject:day];
    }
}

@end
