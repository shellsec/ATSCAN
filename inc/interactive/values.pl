#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

##############################################################################################
##############################################################################################
##
our(@c);
our (@INTERCOMNDS, @INTERSCANS, @INTERCOMNDSFIN, %INTEROPTION, @INTERSearchScans, %INTERSearchScans, @INTERdork, %INTERdork, @INTERtarget, %INTERtarget, @INTERlevel, %INTERlevel);

## EXTRAT INTERACTIVE OPTIONS
our @interExtraOpts=("config", "cat", "usage");

## MODULES
our %MODULES=('normal'=>'normal scan mode', 'advanced'=>'advanced scan mode');
our @MODULES=('normal', 'advanced');

## SCANS
our @SCANS=("sql", "lfi", "joomrfi", "wpafd", "admin", "shost", "wp", "joom", "upload", "zip", "decrypt", "email", "ip", "ports", "commands", "form", "nomodule");
our %SCANS=("sql"=>"sqli and xss scan", "lfi"=>"local file inclusion", "joomrfi"=>"joomla rfi", "wpafd"=>"wp file download", "admin"=>"find admin page", "shost"=>"get subdomains",
           "wp"=>"get wordpress sites", "joom"=>"get joomla sites", "upload"=>"get upload files", "zip"=>"get zip files", "decrypt"=>"md5/(en/de)code64",
           "email"=>"collect emails", "ip"=>"collect ips", "ports"=>"scan ports", "commands"=>"extern command", "form"=>"post/get data", "nomodule"=>"no module will be used");

## SEARCH ENGINE
@INTERSearchScans=('unique', 'motor', 'm-random', 'zone');
%INTERSearchScans=("unique"=>"unique tesults", "motor"=>"engine motor", "m-random"=>"random engine", "zone"=>"search zone");

## TARGET
@INTERtarget=('target', 'ping', 'index');
%INTERtarget=("target"=>"target", "ping"=>"check is alive", "index"=>"get engine index");

## SEARCH LEVEL
@INTERlevel=('level');
%INTERlevel=("level"=>"engine results number");

## SEARCH DORK
@INTERdork=('dork');
%INTERdork=("dork"=>"search dork");

## ALL ARGUMENTS
our %ARGUMENTSALL=("status"=>"status code", "valid"=>"content by string", "exp"=>"exploit", "proxy"=>"use proxy", "proxy-random"=>"random proxy", "save"=>"output file",
                   "replace"=>"Exact string replace", "replaceFROM"=>"full string replace", "ifinurl"=>"valid url by string", "noquery"=>"remove query string", "b-random"=>"random browser",
                   "content"=>"response content", "expHost"=>"exploit host", "expIp"=>"exploit target ip", "timeout"=>"browser time out", "host"=>"host name");
our @ARGUMENTSALL=('status', 'valid', 'exp', 'proxy', 'proxy-random', 'save', 'replace', 'replaceFROM', 'ifinurl', 'noquery', 'b-random', 'content', 'expHost', 'expIp', 'timeout', 'host');

## NOT REQUIRE A VALUE
our @NoValRequierd=('none', 'host', 'tcp', 'udp', 'full', 'unique', 'nobanner', 'beep', 'noinfo', 'update', 'ip', 'noquery', 'ifend', 'post', 'get', 'b-random', 'm-random', 'content', 'ping',
                   'HOST', 'PORT', 'HOSTIP', 'TARGET', 'sql', 'lfi', 'wpafd', 'admin', 'index', 'wp', 'joom', 'upload', 'zip', 'email',  'ip', 'ports', 'commands', 'form', 'search', 'normal',
                   'advanced', 'joomrfi', 'shost', 'email', 'decrypt', 'nomodule');

## DATA ARGUMENTS
our @INTERDataScan=('post', 'get', 'data', 'header');
our %INTERDataScan=("post"=>"post methode", "get"=>"get methode", "data"=>"data to post/get", "header"=>"data headers");

## SHELL LFI
our @INTERshell=('shell');
our %INTERshell=("shell"=>"shell url");

## PORTS
our @INTERPortScan=('port', 'tcp', 'udp');
our %INTERPortScan=("port"=>"port", "udp"=>"udp port type", "tcp"=>"tcp port type");

## PAYLOADS
our @INTERpayload=("payload");
our %INTERpayload=("payload"=>"payload");

## SQL INJECT PARAMETER
our @INTERparam=("param");
our %INTERparam=("param"=>"inject parameter");

## DECRYPT
our @INTERdecryp=("md5", "encode64", "decode64");
our %INTERdecryp=("md5"=>"generate md5", "encode64"=>"encode base64", "decode64"=>"decode base64");

## EXTERN PROCESS
our @INTERcomnd=("command");
our %INTERcomnd=("command"=>"extern process");

## ALL ENGINE COMMANDES
our @ENGINEARGUMENTS=(@INTERdork, @INTERtarget, @INTERSearchScans, @INTERlevel);
our %ENGINEARGUMENTS=(%ENGINEARGUMENTS, %INTERdork, %INTERtarget, %INTERSearchScans, %INTERlevel);

## ADVANCED MODE
our @INTERadvanced=("nobanner", "beep", "noinfo", "ifend", "freq", "regex", "sregex", "none", "notin", "source", "limit");
our %INTERadvanced=("nobanner"=>"hide banner", "beep"=>"beep sound", "noinfo"=>"hide target info", "ifend"=>"beep at end", "freq"=>"random frequency", "regex"=>"get matching regex",
                    "sregex"=>"valid url by regex", "none"=>"negative validation", "notin"=>"no string in html", "source"=>"html output folder", "limit"=>"max positive scans");
##############################################################################################

1;
