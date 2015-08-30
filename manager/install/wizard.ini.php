
; path related to the ini file. By default, the ini file is expected to be into the myapp/install/ directory.
pagesPath = "../lib/installwizard/pages/,pages/"
customPath = "custom/"
start = welcome
tempPath = "../temp/bos/"
supportedLang = en
appname = "Business Open Suite"
[welcome.step]
next=checkjelix
;enctype

[checkjelix.step]
next=dbprofile
databases = mysql,pgsql,sqlsrv
[installapp.step]
next=end

[end.step]
noprevious = on

[dbprofile.step]
next=installapp
availabledDrivers = mysql,pgsql,sqlsrv

[foo.step]
;enctype=
;noprevious = on