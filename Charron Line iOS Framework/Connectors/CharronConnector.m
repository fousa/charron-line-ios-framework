//
//  CharronConnector.m
//  IGC Reader iOS
//
//  Created by Jelle Vandebeeck on 23/10/11.
//  Copyright (c) 2011 10to1. All rights reserved.
//

#import "CharronConnector.h"

@class ASIHTTPRequest;

// Remove ASIHTTPRequest warnings
@interface ASIHTTPRequest : NSObject
- (id)initWithURL:(NSURL *)URL;
- (void)setDelegate:(id)object;
- (void)startAsynchronous;
- (NSString *)responseString;
- (int)responseStatusCode;
@end

// Remove Coby warnings
@interface NSString (RemoveWarnings)
- (id)objectFromJSONString;
@end

@implementation CharronConnector
@synthesize delegate;

#pragma mark - Fetching

- (void)getData {
    NSURL *URL = [NSURL URLWithString:[self URLString]];
    ASIHTTPRequest *request = [[ASIHTTPRequest alloc] initWithURL:URL];
    request.delegate = self;
    [request startAsynchronous];
    [request release];
}

- (void)requestFinished:(ASIHTTPRequest *)request {
    if (request.responseStatusCode == 200) {
        id jsonObject = [[request responseString] objectFromJSONString];
        if (jsonObject) {
            [self performSelector:@selector(didReceiveJSON:) withObject:jsonObject];
        } else {
            if ([self.delegate respondsToSelector:@selector(parseError)]) {
                [self.delegate performSelector:@selector(parseError)];
            }
        }
    } else {
        if ([self.delegate respondsToSelector:@selector(connectionError)]) {
            [self.delegate performSelector:@selector(connectionError)];
        }
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    if ([self.delegate respondsToSelector:@selector(connectionError)]) {
        [self.delegate performSelector:@selector(connectionError)];
    }
}

#pragma mark - URL

- (NSString *)URLString {
    return [NSString stringWithFormat:@"%@%@", [self baseURLString], [self performSelector:@selector(command)]];
}

- (NSString *)baseURLString {
    return @"http://www.lvzc.be/charronline/";
}

@end
