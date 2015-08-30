<?php
/**
* @package     jelix
* @subpackage  jtcpdf module
* @author      Julien Issler
* @contributor Uriel Corfa, Laurent Jouanneau
* @copyright   2007 Julien Issler, 2007 Emotic SARL, 2007-2012 Laurent Jouanneau
* @link        http://www.jelix.org
* @licence     GNU Lesser General Public Licence see LICENCE file or http://www.gnu.org/licenses/lgpl.html
* @since 1.0
*/
require_once (__DIR__.'/../classes/jHtml2Pdf.class.php');
/**
* PDF Response based on HTML2PDF (http://tcpdf.sourceforge.net)
* @package  jelix
* @subpackage core_response
* @since 1.0
*/
class jResponseHtml2Pdf extends jResponse {
    /**
    * @var string
    */
    protected $_type = 'pdf';

    /**
     * the tcpdf object you want to send.
     * @var object
     */
    public $pdf = null;

    /**
     * name of the file under which the file will be send to the user
     * @var string
     */
    public $outputFileName = 'document.pdf';

    /**
     * Says if the "save as" dialog appear or not to the user.
     * @var boolean
     */
    public $doDownload = false;

    /**
     * send the PDF to the browser.
     * @return boolean    true if it's ok
     */
    public function output(){

        if(!($this->html2pdf instanceof jHtml2Pdf ))
            throw new jException('jtcpdf~errors.reptcpdf.not_a_jtcpdf');

        $pdf_data = $this->html2pdf->Output('','S');

        // headers to disable cache
        $this->addHttpHeader('Cache-Control', 'public, must-revalidate, max-age=0', false); // HTTP/1.1
        $this->addHttpHeader('Pragma', 'public', false);
        $this->addHttpHeader('Expires', 'Sat, 26 Jul 1997 05:00:00 GMT', false); // Date in the past
        $this->addHttpHeader('Last-Modified', gmdate("D, d M Y H:i:s")." GMT", false);
        $this->addHttpHeader('Content-Length', strlen($pdf_data));
        if($this->doDownload){
            $this->addHttpHeader("Content-Type","application/force-download");
            $this->addHttpHeader("Content-Type","application/octet-stream", -1);
            $this->addHttpHeader("Content-Transfer-Encoding", "binary");
            $this->addHttpHeader('Content-Disposition','attachment; filename="'.str_replace('"','\"',$this->outputFileName).'";');
        }
        else{
            $this->addHttpHeader('Content-Type', 'application/pdf');
            $this->addHttpHeader('Content-Disposition', 'inline; filename="'.str_replace('"','\"',$this->outputFileName).'";');
        }
        $this->sendHttpHeaders();
        echo $pdf_data;

        flush();
        return true;
    }

    /**
    * Creates the TCPDF object in $this->html2pdf
    * @param string $orientation Orientation (portrait/landscape)
    * @param string $unit Page base unit (default to millimeters)
    * @param mixed $format Page size (defaults to A4)
    * @param String $encoding charset encoding;
    */
    public function initHtml2Pdf($orientation='P', $format='A4', $langue='fr', $encoding=true, $unicode='UTF-8', $marge=array(5,5,5,8)){
        $this->html2pdf = new jHtml2Pdf($orientation, $format, $langue, $encoding, $unicode, $marge);
    }

    /**
    * Transmits calls to non-existent methods to TCPDF (max : 8 params because
    * TCPDF methods never take more than 8 params)
    * @param string $method Method name
    * @param array $attr Method parameters
    * @return mixed Value returned by TCPDF's method
    */
    public function __call($method, $attr){
        if ($this->html2pdf !== null)
            return call_user_func_array(array($this->html2pdf, $method), $attr );
        else
            throw new jException('jtcpdf~errors.reptcpdf.not_a_jtcpdf');
    }
}