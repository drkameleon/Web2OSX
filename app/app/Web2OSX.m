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
#define _BASE_PATH          RSRC_PATH(@"index.html")

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
    [[self mainFrame] loadHTMLString:STR_FROM_FILE(_BASE_PATH)
                             baseURL:RSRC_URL(_BASE_PATH)];
}

@end
