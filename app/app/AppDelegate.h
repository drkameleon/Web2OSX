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

#import <Cocoa/Cocoa.h>
#import "Web2OSX.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet Web2OSX *web2OSX;

@end
