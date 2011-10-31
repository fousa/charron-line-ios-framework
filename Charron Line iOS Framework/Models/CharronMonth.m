//
//  CharronMonth.m
//  IGC Reader iOS
//
//  Created by Jelle Vandebeeck on 23/10/11.
//  Copyright (c) 2011 10to1. All rights reserved.
//

#import "CharronMonth.h"

@implementation CharronMonth
@synthesize year, days, month;

#pragma mark - Memory

- (void)dealloc {
    self.year = nil;
    self.days = nil;
    self.month = nil;
    
    [super dealloc];
}

#pragma mark - Parsing

+ (CharronMonth *)monthFor:(NSString *)monthString {
    CharronMonth *month = [[CharronMonth new] autorelease];
    month.month = monthString;
    
    return month;
}

@end
