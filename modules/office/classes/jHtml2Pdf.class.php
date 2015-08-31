<?php
/**
* @package     office
* @subpackage  office module
* @author      aurelle MELESS
* @contributor yann danho
* @copyright   2007-2009 Julien Issler, 2007-2012 Laurent Jouanneau
* @link        http://www.jelix.org
* @licence     GNU Lesser General Public Licence see LICENCE file or http://www.gnu.org/licenses/lgpl.html
* @since 1.0
*/

require_once (__DIR__.'/html2pdf/html2pdf.class.php');

/**
 * sub-class of HTML2PDF, for better Jelix integration (error handling) and easy save to disk feature.
 * @package    jelix
 * @subpackage utils
 * @since 1.0
 */
class jHtml2Pdf extends HTML2PDF {

    public function __construct($orientation='P', $format='A4', $langue='fr', $encoding=true, $unicode='UTF-8', $marge=array(5,5,5,8)) {
        parent::__construct($orientation, $format, $langue, $encoding, $unicode, $marge);
    }


    /**
     * Throw an exception when an error occurs, instead of die()
     * @param string $msg The error's message generated by TCPDF
     */
    public function Error($msg){
        throw new Exception($msg);
    }


    /**
     * Method to save the current document to a file on the disk
     * @param string $filename The target filename
     * @param string $path The target path where to store the file
     * @return boolean TRUE if success, else throws a jException
     */
    public function saveToDisk($filename,$path){

        if(!is_dir($path))
            throw new jException('jelix~errors.file.directory.notexists',array($path));

        if(!is_writable($path))
           throw new jException('jelix~errors.file.directory.notwritable',array($path));

        if(file_put_contents(realpath($path).'/'.$filename, $this->Output('','S')))
           return true;

        throw new jException('jelix~errors.file.write.error',array($path.'/'.$filename,''));

    }
}