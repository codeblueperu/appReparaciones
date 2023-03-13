<?php
include_once '../extensiones/dompdf/autoload.inc.php';

use Dompdf\Dompdf;
use Dompdf\Options;

ob_start();
$options = new Options();
$options->set('isRemoteEnabled', true);
$options->set('defaultFont', 'Courier');


$dompdf = new DOMPDF($options);

// Componer el HTML
$html = '
<style>
    @page {
        margin-left: 0.7cm;
        margin-right: 0.7cm;
        margin-top: 0.7cm;
    }
    p{
        width:100%;
    }
    .content_cliente{
        width:100%;
        position: relative;
    }
     span.p_don{
        width: 200px;
        color:red;
        position:absolute;
    }
</style>
<body>
    <div class="container-fluid">
        <div class="banner">       
                    
        </div>

        <div class="content_fecha">
            <p>En antofagasta 	<b>13</b>	de	<b>Marzo</b>			del <b>2023</b>	Nº	<b>2460</b></p>

            <p style="text-align:justify;font-size:12px">Entre SERVICIOS GENERALES MEDINA ASOCIADOS SPA., RUT: 76,957462-K en adelante "EL ARRENDADOR" debidamente representado
             por el Sr. CARLOS MEDINA IZQUIERDO Rep. Legal, domiciliados en Huamachuco 9962, Antofagasta - Cel.: 9 9264 4118 por una parte y la otra.</p>										

        </div>

        <div class="content_cliente">
            <p><span style="width:150px;">Don</span> <b>: More Inga Jhony</b> <span>RUT</span> <b>013587469</b></p> 
            <p><span>Domicilio</span> <b>: Jr meliton carbajal #240 SMP</b> <span>Ciudad</span> <b>: Lima</b> <span>Fono</span> <b>: 963258741</b></p> 
        </div>
       
        
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
$dompdf->stream("comprobante", array("Attachment" => false));
?>