//
//  CharronDaysConnector.m
//  IGC Reader iOS
//
//  Created by Jelle Vandebeeck on 23/10/11.
//  Copyright (c) 2011 10to1. All rights reserved.
//

#import "CharronDaysConnector.h"

#import "CharronDay.h"

@implementation CharronDaysConnector
@synthesize year;

#pragma mark URL Constructors

- (NSString *)command {
    return [self.year.year stringByAppendingString:@"/days.php"];
}

#pragma mark - Parser

- (void)didReceiveJSON:(id)jsonObject {
    __block NSMutableArray *months = [NSMutableArray array];
    __block CharronMonth *previousMonth = nil;
    [((NSArray *)jsonObject) enumerateObjectsUsingBlock:^(NSDictionary *dayDictionary, NSUInteger idx, BOOL *stop) {
        CharronDay *day = [CharronDay dayFor:dayDictionary];
            
        NSDateComponents *components = [[NSCalendar currentCalendar] components:NSMonthCalendarUnit fromDate:day.date];
        CharronMonth *month = [CharronMonth monthFor:[NSString stringWithFormat:@"%i", [components month]]];
        if (previousMonth == nil || ![month.month isEqualToString:previousMonth.month]) {
            previousMonth = month;
            month.days = [NSMutableArray array];
            month.year = self.year;
            [months addObject:previousMonth];
        } else {
            day.month = previousMonth;
        }
        day.month = previousMonth;
        [previousMonth.days addObject:day];
    }];
    self.year.months = months;
    
    if ([self.delegate respondsToSelector:@selector(didReceiveYear:)]) {
        [self.delegate performSelector:@selector(didReceiveYear:) withObject:self.year];
    }
}

@end
