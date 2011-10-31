//
//  CharronDownloader.h
//  IGC Reader iOS
//
//  Created by Jelle Vandebeeck on 23/10/11.
//  Copyright (c) 2011 10to1. All rights reserved.
//

#import "CharronFlight.h"

@interface CharronDownloader : NSObject
@property (nonatomic, retain) NSObject *delegate;
@property (nonatomic, retain) CharronFlight *flight;

- (void)downloadIGC;

+ (NSString *)IGCDirectory;
@end
