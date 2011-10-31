//
//  CharronDaysConnector.h
//  IGC Reader iOS
//
//  Created by Jelle Vandebeeck on 23/10/11.
//  Copyright (c) 2011 10to1. All rights reserved.
//

#import "CharronConnector.h"

#import "CharronYear.h"

@interface CharronDaysConnector : CharronConnector <CharronConnectorProtocol>
@property (nonatomic, retain) CharronYear *year;
@end
