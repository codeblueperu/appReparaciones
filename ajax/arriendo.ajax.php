<?php
require_once "../controladores/arriendo.controlador.php";
require_once "../modelos/arriendo.modelo.php";


class AjaxArriendo
{
    public $idArriendo;
}
/* METHOD */
if ($_GET['operation'] === 'createupdate') {
    
   // ControladorArriendo::ctrCrearArriendo($datos);
   $response = array('message' => "olaaa");
    echo json_encode($response);
}
?>