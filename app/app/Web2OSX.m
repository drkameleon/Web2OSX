/****************************************************
 * Web2OSX
 * Webview-based Cocoa/OSX application framework
 *
 * Copyright (c) 2014, Dr.Kameleon
 * All rights reserved.
 *
 *---------------------------------------------------
 * Web2OSX.m
 ****************************************************/

//=====================
// Defines
//=====================

#define _RESOURCES_PATH     [[NSBundle mainBundle] resourcePath]
#define _BASE_PATH          RSRC_PATH(@"html/index.html")
#define _WIN_SCR_OBJ        [self windowScriptObject]

//=====================
// Macros
//=====================

#define RSRC_PATH(X)        [_RESOURCES_PATH stringByAppendingPathComponent:(X)]
#define RSRC_URL(X)         [NSURL fileURLWithPath:(X)]

#define STR_FROM_FILE(X)    [NSString stringWithContentsOfFile:(X) encoding:NSUTF8StringEncoding error:nil]

//=====================
// Imports
//=====================

#import "Web2OSX.h"

@implementation Web2OSX

//=====================
// Start up
//=====================

- (void)awakeFromNib
{
    // Set up delegates
    [self setDownloadDelegate:self];
    [self setEditingDelegate:self];
    [self setFrameLoadDelegate:self];
    [self setResourceLoadDelegate:self];
    [self setUIDelegate:self];
    
    // Load Web App
    [[self mainFrame] loadHTMLString:STR_FROM_FILE(_BASE_PATH)
                             baseURL:RSRC_URL(_BASE_PATH)];
    
    [_WIN_SCR_OBJ setValue:self forKey:@"Core"];
}

//=====================
// Functions
//=====================

- (void)setBackend:(id)backend
{
    [_WIN_SCR_OBJ setValue:backend forKey:@"Backend"];
}

- (NSString*)execJs:(NSString*)js
{
    return [self stringByEvaluatingJavaScriptFromString:js];
}


//=====================
// Core Library
//=====================

- (void)log:(NSString*)msg
{
    NSLog(@"Logging from JS : %@", msg);
}

//=====================
// Delegates
//=====================

+ (BOOL)isSelectorExcludedFromWebScript:(SEL)aSelector
{
    NSLog(@"Asking for: %@",NSStringFromSelector(aSelector));
    // Necessary for Javascript->Cocoa bridging
    return NO;
}

+ (BOOL)isKeyExcludedFromWebScript:(const char *)name
{
    return NO;
}

//-----------------
// UIDelegate
//-----------------

        - (NSArray *)webView:(WebView *)sender
  contextMenuItemsForElement:(NSDictionary *)element
            defaultMenuItems:(NSArray *)defaultMenuItems
{
    // Disable Right-click menu
    return nil;
}

@end
