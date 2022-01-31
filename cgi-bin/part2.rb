#!/usr/bin/ruby -w

print "Content-type: text/html\n\n"
require "cgi"
cgi = CGI.new("html5")


puts "<html>"
puts "<head>"

puts "<link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>"
puts "<link href='https://fonts.googleapis.com/css?family=Ubuntu+Mono' rel='stylesheet'>"
puts "<script src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js'></script>"

puts "<style> body { font-family: 'Ubuntu Mono'; font-size: 50px; background-color:#808080; } p { font-family: 'Montserrat'; font-weight:bold; } #fadebtn {

	background-color: #008080;
	font-family: 'Ubuntu Mono';
	font-weight: bold;
	border: none;
	padding: 15px 32px;
	font-size: 16px;

} span {display:none;} </style>"

puts "</head>"

puts "<body>"

puts "<p> Name: " + cgi['fname'].split.map(&:capitalize).join(' ') + "</p>"
puts "<p> Address: " + cgi['address'].split.map(&:capitalize).join(' ') + "</p>"

numberarr = cgi['number'].split("-")


puts "<p> Phone #: </p>"
puts "<span style='float: left;' id='p1'>" + "(" + numberarr[0] + ")-" + "</span>" + "<span style='float: left;' id='p2'>" + numberarr[1] + "-</span>" + "<span style='float: left;' id='p3'>" + numberarr[2] + "</span>"

puts "<script>"

puts <<SCRIPT

$(document).ready(function(){
	$("button").click(function() {
		var span1 = $("#p1");
		var span2 = $("#p2");
		var span3 = $("#p3");
		
		span1.fadeIn(300).css("color", "red"); 
		span2.fadeIn(900).css("color", "green");
		span3.fadeIn(1200).css("color", "blue");
		
	}); 
});
SCRIPT
puts "</script>"

puts "<br><br><button id='fadebtn'>Click to fade!</button>"

puts "</body>"
puts "</html>"