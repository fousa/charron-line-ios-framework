//
//  CharronMonth.h
//  IGC Reader iOS
//
//  Created by Jelle Vandebeeck on 23/10/11.
//  Copyright (c) 2011 10to1. All rights reserved.
//

#import "CharronYear.h"

@interface CharronMonth : NSObject
@property (nonatomic, retain) CharronYear *year;
@property (nonatomic, retain) NSString *month;
@property (nonatomic, retain) NSMutableArray *days;

+ (CharronMonth *)monthFor:(NSString *)monthString;
@end
