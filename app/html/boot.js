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

//=====================
// Boot
//=====================

// Override native console.log
// and send logs to Objective-C

console.log = function(text) {
    API.log_(text);
}

// On jQuery-ready

$(function()
{
    // Make sure not context menu appears
    $("body").bind("contextmenu", function ()
    {
        preventDefault();
    });
  
    API.log_("Done");
});

