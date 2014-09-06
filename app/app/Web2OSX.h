/****************************************************
 * Web2OSX
 * Webview-based Cocoa/OSX application framework
 *
 * Copyright (c) 2014, Dr.Kameleon
 * All rights reserved.
 *
 *---------------------------------------------------
 * Web2OSX.h
 ****************************************************/

//=====================
// Imports
//=====================

#import <Cocoa/Cocoa.h>
#import <WebKit/WebView.h>
#import <WebKit/WebFrame.h>
#import <WebKit/WebScriptObject.h>

@interface Web2OSX : WebView

//=====================
// Functions
//=====================

- (void)setBackend:(id)backend;
- (NSString*)execJs:(NSString*)js;

//=====================
// Core Library
//=====================

- (void)log:(NSString*)msg;

//=====================
// Delegates
//=====================

+ (BOOL)isSelectorExcludedFromWebScript:(SEL)aSelector;
+ (BOOL)isKeyExcludedFromWebScript:(const char *)name;

- (NSArray *)webView:(WebView *)sender contextMenuItemsForElement:(NSDictionary *)element defaultMenuItems:(NSArray *)defaultMenuItems;

@end
