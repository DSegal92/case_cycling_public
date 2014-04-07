	/*
 * Evaluate-JS ~ 
 * Code: http://Evaluate-js.googlecode.com/
 * Examples: http://www.snaptortoise.com/Evaluate-js
 * Copyright (c) 2009 George Mandis (georgemandis.com, snaptortoise.com)
 * Version: 1.4.2 (9/2/2013)
 * Licensed under the MIT License (http://opensource.org/licenses/MIT)
 * Tested in: Safari 4+, Google Chrome 4+, Firefox 3+, IE7+, Mobile Safari 2.2.1 and Dolphin Browser
 */

var Evaluate = function (callback) {
	var Evaluate = {
		addEvent: function (obj, type, fn, ref_obj) {
			if (obj.addEventListener)
				obj.addEventListener(type, fn, false);
			else if (obj.attachEvent) {
				// IE
				obj["e" + type + fn] = fn;
				obj[type + fn] = function () {
					obj["e" + type + fn](window.event, ref_obj);
				}
				obj.attachEvent("on" + type, obj[type + fn]);
			}
		},
		input: "",
		pattern: "73776576738484766970658471738276",
		load: function (link) {
			this.addEvent(document, "keydown", function (e, ref_obj) {
				if (ref_obj) Evaluate = ref_obj; // IE
				Evaluate.input += e ? e.keyCode : event.keyCode;
				if (Evaluate.input.length > Evaluate.pattern.length)
					Evaluate.input = Evaluate.input.substr((Evaluate.input.length - Evaluate.pattern.length));
				if (Evaluate.input == Evaluate.pattern) {
					Evaluate.code(link);
					Evaluate.input = "";
					e.preventDefault();
					return false;
				}
			}, this);
			this.iphone.load(link);
		},
		code: function (link) {
			window.location = link
		},
		iphone: {
			start_x: 0,
			start_y: 0,
			stop_x: 0,
			stop_y: 0,
			tap: false,
			capture: false,
			orig_keys: "",
			keys: ["UP", "UP", "DOWN", "DOWN", "LEFT", "RIGHT", "LEFT", "RIGHT", "TAP", "TAP"],
			code: function (link) {
				Evaluate.code(link);
			},
			load: function (link) {
				this.orig_keys = this.keys;
				Evaluate.addEvent(document, "touchmove", function (e) {
					if (e.touches.length == 1 && Evaluate.iphone.capture == true) {
						var touch = e.touches[0];
						Evaluate.iphone.stop_x = touch.pageX;
						Evaluate.iphone.stop_y = touch.pageY;
						Evaluate.iphone.tap = false;
						Evaluate.iphone.capture = false;
						Evaluate.iphone.check_direction();
					}
				});
				Evaluate.addEvent(document, "touchend", function (evt) {
					if (Evaluate.iphone.tap == true) Evaluate.iphone.check_direction(link);
				}, false);
				Evaluate.addEvent(document, "touchstart", function (evt) {
					Evaluate.iphone.start_x = evt.changedTouches[0].pageX;
					Evaluate.iphone.start_y = evt.changedTouches[0].pageY;
					Evaluate.iphone.tap = true;
					Evaluate.iphone.capture = true;
				});
			},
			check_direction: function (link) {
				x_magnitude = Math.abs(this.start_x - this.stop_x);
				y_magnitude = Math.abs(this.start_y - this.stop_y);
				x = ((this.start_x - this.stop_x) < 0) ? "RIGHT" : "LEFT";
				y = ((this.start_y - this.stop_y) < 0) ? "DOWN" : "UP";
				result = (x_magnitude > y_magnitude) ? x : y;
				result = (this.tap == true) ? "TAP" : result;

				if (result == this.keys[0]) this.keys = this.keys.slice(1, this.keys.length);
				if (this.keys.length == 0) {
					this.keys = this.orig_keys;
					this.code(link);
				}
			}
		}
	}

	typeof callback === "string" && Evaluate.load(callback);
	if (typeof callback === "function") {
		Evaluate.code = callback;
		Evaluate.load();
	}

	return Evaluate;
};
var result = new Evaluate(function() { $('#header_logo').attr("src", "assets/target.jpg")})