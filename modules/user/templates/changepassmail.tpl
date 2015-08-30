{meta Subject "Reinitialisation de mot de passe etape 2/2 GOUABO "} 
{meta Priority 1} 
{meta From 'gouabo.com <noreply@gouabo.com>'} 
{meta Sender 'noreply@gouabo.com'} 
{meta to array($user->lastname.'<'.$user->email.'>')}
votre mot de passe a &eacute;t&eacute; chang&eacute; pour l'activer cliquer sur le lien suivant : <br/>
<a href="{jfullurl 'user~default:activePassword', array('token'=>$user->keyactivate)}">{jfullurl 'user~default:activePassword', array('token'=>$user->keyactivate)}</a>