//
//  CharronYear.m
//  IGC Reader iOS
//
//  Created by Jelle Vandebeeck on 23/10/11.
//  Copyright (c) 2011 10to1. All rights reserved.
//

#import "CharronYear.h"

@implementation CharronYear
@synthesize year, months;

#pragma mark - Memory

- (void)dealloc {
    self.year = nil;
    self.months = nil;
    
    [super dealloc];
}

#pragma mark - Parsing

+ (CharronYear *)yearFor:(NSString *)yearString {
    CharronYear *year = [[CharronYear new] autorelease];
    year.year = yearString;
    
    return year;
}

@end
