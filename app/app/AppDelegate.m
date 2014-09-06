/****************************************************
 * Web2OSX
 * Webview-based Cocoa/OSX application framework
 *
 * Copyright (c) 2014, Dr.Kameleon
 * All rights reserved.
 *
 *---------------------------------------------------
 * AppDelegate.m
 ****************************************************/

//=====================
// Imports
//=====================

#import "AppDelegate.h"

@implementation AppDelegate

//=====================
// Start up
//=====================

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (void)awakeFromNib
{
    // Show loading indicator
    
    [[self loadingIndicator] startAnimation:nil];
    
    // Set backend
    
    [[self web2OSX] setBackend:self];
    
    // Set observers
    
    OBSERVE(_LOAD_FINISHED, @selector(loadFinished:), nil);
} 

//=====================
// Observers
//=====================

- (void)loadFinished:(NSNotification*)n
{
    NSLog(@"Load Finished.");
    [[self loadingIndicator] stopAnimation:nil];
    [[[self loadingIndicator] animator] setHidden:YES];
}

//=====================
// Backend Library
//=====================

// Necessary for Javascript->Cocoa bridging

ENABLE_JS_BRIDGE

// Functions

- (void)testMe
{
    NSLog(@"Testing backend function call");
}

@end
