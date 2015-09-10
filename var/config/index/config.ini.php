;<?php die(''); ?>
;for security reasons , don't remove or modify the first line

startModule=link
startAction="default:index"

[responses]
csv="office~jResponseCsv"
html2pdf="office~jResponseHtml2Pdf"
[modules]
jauth.access=2
user.access=2
office.access=2
blog.access=2
event.access=2
browser.access=2
[coordplugins]
auth="index/auth.coord.ini.php"
[_coreResponses]
csv="office~jResponseCsv"
html2pdf="office~jResponseHtml2Pdf"







