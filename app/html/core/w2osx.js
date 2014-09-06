/****************************************************
 * Web2OSX
 * Webview-based Cocoa/OSX application framework
 *
 * Copyright (c) 2014, Dr.Kameleon
 * All rights reserved.
 *
 *---------------------------------------------------
 * w2osx.js
 ****************************************************/

loadTemplate = function(template,data,into) {
	$.get(template, function(tmpl) {
		var rendered = Mustache.render(tmpl, data);
		$(into).html(rendered);
	});
}

loadView = function(view,data) {
	loadTemplate('views/' + view + '.html', data, 'body');
}
