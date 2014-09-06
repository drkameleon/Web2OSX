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
// Imports
//=====================

#import "Web2OSX.h"

@implementation Web2OSX

//=====================
// Start up
//=====================

- (void)awakeFromNib
{
    [self setHidden:YES];
    // Set up delegates
    [self setDownloadDelegate:self];
    [self setEditingDelegate:self];
    [self setFrameLoadDelegate:self];
    [self setResourceLoadDelegate:self];
    [self setUIDelegate:self];
    
    // Set observers
    OBSERVE(WebViewProgressFinishedNotification, @selector(webviewProgressFinished:), nil);
    
    // Load Web App
    [[self mainFrame] loadHTMLString:STR_FROM_FILE(_BASE_PATH)
                             baseURL:RSRC_URL(_BASE_PATH)];
    
    [_WIN_SCR_OBJ setValue:self forKey:_CORE];
}

//=====================
// Functions
//=====================

- (void)setBackend:(id)backend
{
    [_WIN_SCR_OBJ setValue:backend forKey:_BACKEND];
}

- (NSString*)execJs:(NSString*)js
{
    return [self stringByEvaluatingJavaScriptFromString:js];
}


//=====================
// Core Library
//=====================

// Necessary for Javascript->Cocoa bridging

ENABLE_JS_BRIDGE

// Functions

- (void)log:(NSString*)msg
{
    // Print forwarded message from JS's console.log to Xcode log window
    NSLog(@"%@", msg);
}

//=====================
// Observers
//=====================

- (void)webviewProgressFinished:(NSNotification*)n
{
    NOTIFY(_LOAD_FINISHED, nil);
    
    [[self animator] setHidden:NO];
}

//=====================
// Delegates
//=====================

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
