/****************************************************
 * Web2OSX
 * Webview-based Cocoa/OSX application framework
 *
 * Copyright (c) 2014, Dr.Kameleon
 * All rights reserved.
 *
 *---------------------------------------------------
 * AppDelegate.h
 ****************************************************/

//=====================
// Imports
//=====================

#import <Cocoa/Cocoa.h>
#import "Web2OSX.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

//=====================
// Outlets
//=====================

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet Web2OSX *web2OSX;

//=====================
// Backend Library
//=====================

- (void)testMe;

@end
