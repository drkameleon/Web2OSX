/****************************************************
 * Web2OSX
 * Webview-based Cocoa/OSX application framework
 *
 * Copyright (c) 2014, Dr.Kameleon
 * All rights reserved.
 *
 *---------------------------------------------------
 * boot.js
 ****************************************************/

$(function()
{
    // Make sure not context menu appears
    $("body").bind("contextmenu", function ()
    {
        preventDefault();
    });
  
});

