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
// Helpers
//=====================

JSON.stringifyOnce = function(obj, replacer, indent)
{
    var printedObjects = [];
    var printedObjectKeys = [];
    
    function printOnceReplacer(key, value)
    {
        if ( printedObjects.length > 2000)
        {
            return 'object too long';
        }
        
        var printedObjIndex = false;
        printedObjects.forEach(function(obj, index){
                               if(obj===value){
                               printedObjIndex = index;
                               }
                               });
        
        if ( key == '')
        {
            printedObjects.push(obj);
            printedObjectKeys.push("root");
            return value;
        }
        
        else if (printedObjIndex+"" != "false" && typeof(value)=="object")
        {
            if ( printedObjectKeys[printedObjIndex] == "root")
            {
                return "(pointer to root)";
            }
            else
            {
                return "(see " + ((!!value && !!value.constructor) ? value.constructor.name.toLowerCase()  : typeof(value)) + " with key " + printedObjectKeys[printedObjIndex] + ")";
            }
        }
        else
        {
            var qualifiedKey = key || "(empty key)";
            printedObjects.push(value);
            printedObjectKeys.push(qualifiedKey);
            if (replacer)
            {
                return replacer(key, value);
            }
            else
            {
                return value;
            }
        }
    }
    
    return JSON.stringify(obj, printOnceReplacer, indent);
};

//=====================
// Boot
//=====================

// Override native console.log
// and send logs to Objective-C

console.log = function() {
    if ((arguments.length==1) && (typeof arguments[0] == "string"))
    {
        Core.log_(arguments[0]);
    }
    else
    {
        $.each(arguments, function(i,a)
            {
               Core.log_(JSON.stringifyOnce(a, null, 4));
            }
        );
    }
}

// On jQuery-ready

$(function()
{
    // Make sure not context menu appears
    $("body").bind("contextmenu", function ()
    {
        preventDefault();
    });
  
    console.log("Hello world");
    Backend.testMe();
});

