//
//  CharronFlightsConnector.h
//  IGC Reader iOS
//
//  Created by Jelle Vandebeeck on 23/10/11.
//  Copyright (c) 2011 10to1. All rights reserved.
//

#import "CharronConnector.h"

#import "CharronDay.h"

@interface CharronFlightsConnector : CharronConnector <CharronConnectorProtocol>
@property (nonatomic, retain) CharronDay *day;
@end
