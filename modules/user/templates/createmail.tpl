{meta Subject "[ INSCRIPTION  GOUABO ] Activez votre compte GOUABO "} 
{meta Priority 1} 
{meta From 'gouabo.com <webmaster@gouabo.com>'} 
{meta Sender 'webmaster@gouabo.com'} 
{meta to array($user->lastname.'<'.$user->email.'>')}
Cher(e) {$user->firstname.' '.$user->lastname},<br/>
Nous vous remercions de vous &ecirc;tre inscrit(e) sur gouabo.com, mais vous devez activez votre compte en cliquant sur le lien suivant:  {jfullurl 'user~default:activeAccount', array('token'=>$user->keyactivate)}<br/><br/>

si vous n'arrivez pas cliquer sur le lien copier et coller dans un navigateur.<br/>

VEUILLEZ NE PAS R&Eacute;PONDRE &Agrave; CET E-MAIL. POUR TOUTE QUESTION, N'H&Eacute;SITEZ PAS &Agrave; NOUS CONTACTER &Agrave;