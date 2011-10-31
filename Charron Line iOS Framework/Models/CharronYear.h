//
//  CharronYear.h
//  IGC Reader iOS
//
//  Created by Jelle Vandebeeck on 23/10/11.
//  Copyright (c) 2011 10to1. All rights reserved.
//

@interface CharronYear : NSObject
@property (nonatomic, retain) NSString *year;
@property (nonatomic, retain) NSArray *months;

+ (CharronYear *)yearFor:(NSString *)yearString;
@end
