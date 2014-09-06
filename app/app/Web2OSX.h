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
// Defines
//=====================

// Paths

#define _RESOURCES_PATH     [[NSBundle mainBundle] resourcePath]
#define _BASE_PATH          RSRC_PATH(@"html/index.html")
#define _WIN_SCR_OBJ        [self windowScriptObject]

// Window Script Objects' aliases

#define _CORE               @"Core"
#define _BACKEND            @"Backend"

// Notifications

#define _LOAD_FINISHED      @"W2OSX Load Finished"

//=====================
// Macros
//=====================

#define ENABLE_JS_BRIDGE    + (BOOL)isSelectorExcludedFromWebScript:(SEL)aSelector { return NO; }\
+ (BOOL)isKeyExcludedFromWebScript:(const char *)name { return NO; }

#define RSRC_PATH(X)        [_RESOURCES_PATH stringByAppendingPathComponent:(X)]
#define RSRC_URL(X)         [NSURL fileURLWithPath:(X)]

#define STR_FROM_FILE(X)    [NSString stringWithContentsOfFile:(X) encoding:NSUTF8StringEncoding error:nil]

#define OBSERVE(X,Y,Z)      [[NSNotificationCenter defaultCenter] addObserver:self selector:(Y) name:(X) object:(Z)]
#define UNOBSERVE(X)        [[NSNotificationCenter defaultCenter] removeObserver:self name:(X) object:nil]
#define NOTIFY(X,Y)         [[NSNotificationCenter defaultCenter] postNotificationName:(X) object:(Y)]

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
