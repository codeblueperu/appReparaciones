<?php
include_once  '../extensiones/dompdf/autoload.inc.php';

use Dompdf\Dompdf;
use Dompdf\Options;
ob_start();
$options = new Options();
$options->set('isRemoteEnabled', true);
$options->set('defaultFont', 'Courier');


$dompdf = new DOMPDF($options);

// Componer el HTML
$html = '
<body>
    <div class="container-fluid">
        <div class="banner">
       
            <img src="'.$_SERVER['DOCUMENT_ROOT'].'/fyfsistema/ajax/banner.png" alt="">
        </div>
        '. $_SERVER['DOCUMENT_ROOT'].'
        ola
    </div>
</body>
';

$dompdf->loadHtml($html);

//$dompdf->setHttpContext($contxt);
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();
/*header("Content-type: application/pdf");
header("Content-Disposition: inline; filename=comprobante");
echo $dompdf->output(); */
$dompdf->stream("", array("Attachment" => false));
?>