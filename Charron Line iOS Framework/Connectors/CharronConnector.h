//
//  CharronConnector.h
//  IGC Reader iOS
//
//  Created by Jelle Vandebeeck on 23/10/11.
//  Copyright (c) 2011 10to1. All rights reserved.
//

@protocol CharronConnectorProtocol <NSObject>
@required
- (void)didReceiveJSON:(id)jsonObject;
- (NSString *)command;
@end

@interface CharronConnector : NSObject
@property (nonatomic, retain) NSObject *delegate;

- (void)getData;

- (NSString *)URLString;
- (NSString *)baseURLString;
@end
