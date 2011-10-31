//
//  NSDate+CharronLine.m
//  igcreader
//
//  Created by Jelle Vandebeeck on 22/07/11.
//  Copyright 2011 10to1. All rights reserved.
//

#import "NSDate+CharronLine.h"

@implementation NSDate (CharronLine)

- (NSString *)charronURLFormat {
    static NSDateFormatter *charronDateURLFormatter = nil;
    if (charronDateURLFormatter == nil) {
        charronDateURLFormatter = [[NSDateFormatter alloc] init];
        [charronDateURLFormatter setDateFormat:@"yyyy-MM-dd"];
	}
    
	return [charronDateURLFormatter stringFromDate:self];
}

@end