//
//  NSString+CharronLine.m
//  igcreader
//
//  Created by Jelle Vandebeeck on 22/07/11.
//  Copyright 2011 10to1. All rights reserved.
//

#import "NSString+CharronLine.h"

@implementation NSString (CharronLine)

- (NSDate *)charronDate {
    static NSDateFormatter *charronDateParser = nil;
    if (charronDateParser == nil) {
        charronDateParser = [[NSDateFormatter alloc] init];
        [charronDateParser setDateFormat:@"dd-MM-yy"];
	}
    
	return [charronDateParser dateFromString:self];
}

@end
