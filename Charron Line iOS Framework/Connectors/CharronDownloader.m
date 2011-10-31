//
//  CharronDownloader.m
//  IGC Reader iOS
//
//  Created by Jelle Vandebeeck on 23/10/11.
//  Copyright (c) 2011 10to1. All rights reserved.
//

#import "CharronDownloader.h"

@class ASIHTTPRequest;

// Remove ASIHTTPRequest warnings
@interface ASIHTTPRequest : NSObject
+ (id)requestWithURL:(NSURL *)URL;
- (void)setDelegate:(id)object;
- (void)setDownloadDestinationPath:(NSString *)downloadPath;
- (void)setTemporaryFileDownloadPath:(NSString *)temporaryFileDownloadPath;
- (void)setAllowResumeForFileDownloads:(BOOL)allowResumeForFileDownloads;
- (void)startAsynchronous;
- (int)responseStatusCode;
@end

@interface CharronDownloader (Request)
- (void)requestFailed:(ASIHTTPRequest *)request;
@end

@implementation CharronDownloader
@synthesize delegate, flight;

#pragma mark - Downloading

- (void)downloadIGC {
    NSURL *url = [NSURL URLWithString:self.flight.igcURLString];
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
	
	NSFileManager *fileManager= [NSFileManager defaultManager]; 
	BOOL isDir=YES;
	if(![fileManager fileExistsAtPath:[CharronDownloader IGCDirectory] isDirectory:&isDir])
		[fileManager createDirectoryAtPath:[CharronDownloader IGCDirectory] withIntermediateDirectories:NO attributes:nil error:nil];
	
	NSString *downloadPath = [[CharronDownloader IGCDirectory] stringByAppendingPathComponent:@"charron.igc"];
	NSString *tempDownloadPath = [downloadPath stringByAppendingString:@".download"];
	
	[request setDownloadDestinationPath:downloadPath];
	[request setTemporaryFileDownloadPath:tempDownloadPath];
	[request setAllowResumeForFileDownloads:YES];
    request.delegate = self;
	[request startAsynchronous];
}

#pragma mark - Requests

- (void)requestFinished:(ASIHTTPRequest *)request {
    if (request.responseStatusCode == 200) {
        if ([self.delegate respondsToSelector:@selector(receivedFlight:)]) {
            [self.delegate performSelector:@selector(receivedFlight:) withObject:self.flight];
        }
    } else {
        [self requestFailed:request];
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    if ([self.delegate respondsToSelector:@selector(connectionError)]) {
        [self.delegate performSelector:@selector(connectionError)];
    }
}

# pragma mark - Directories

+ (NSString *)IGCDirectory {
    NSString *directory = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    return [directory stringByAppendingPathComponent:@"IGC"];
}

@end
