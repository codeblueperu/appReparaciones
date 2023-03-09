<?php
require_once "../controladores/arriendo.controlador.php";
require_once "../modelos/arriendo.modelo.php";


class AjaxArriendo
{
    public $idArriendo;
}
/* METHOD */
if ($_GET['operation'] === 'show') {
    $serach = $_GET['buscar'];
    $orden = '';

    $response = ControladorArriendo::ctrMostrarArriendo($serach);
    $data = array();

    foreach ($response as $a) {
        $data[] = array(
            "id_arriendo" => $a['id_arriendo'],
            "id_cliente" => $a['id_cliente'],
            "nombre" => $a['nombre'],
            "documento" => $a['documento'],
            "numero_ord_compra" => $a['numero_ord_compra'],
            "fecha_arrienda" => $a['fecha_arrienda'],
            "subtotal" => $a['subtotal'],
            "iva" => $a['iva'],
            "total_pagar" => $a['total_pagar'],
            "periodo" => $a['periodo'],
            "usuario" => $a['usuario'],
            "estado" => $a['estado']            
        );
    }

    echo json_encode($data);
}else if ($_GET['operation'] === 'createupdate') {
    $datos = $_GET['datos'];
  $msg=  ControladorArriendo::ctrCrearArriendo($datos,$_GET['detalle']);
   $response = array('message' => $msg);
    echo json_encode($response);
}else if($_GET['operation'] === 'buscararriendo'){
    $id = $_GET['id'];
    $dtarriendo = ControladorArriendo::ctrBuscarArriendoID($id);
    $data = array();

    foreach ($dtarriendo as $a) {
        $data = array(
            "id_arriendo" => $a['id_arriendo'],
            "id_cliente" => $a['id_cliente'],
            "id_usuario" => $a['id_usuario'],
            "banco" => $a['banco'],
            "numero_ch" => $a['numero_ch'],
            "plaza" => $a['plaza'],
            "numero_ord_compra" => $a['numero_ord_compra'],
            "periodo" => $a['periodo'],
            "observacion" => $a['observacion'],
            "fecha_arrienda" => $a['fecha_arrienda'],
            "fecha_devolucion" => $a['fecha_devolucion'],
            "subtotal" => $a['subtotal'],
            "iva" => $a['iva'], 
            "total_pagar" => $a['total_pagar'], 
            "estado" => $a['estado']            
        );
    }

    $dtdetalle = ControladorArriendo::ctrBuscarDetalleArriendoID($id);
    $datadetalle = array();
    foreach ($dtdetalle as $a) {
        $datadetalle[] = array(
            "id_detalle" => $a['id_detalle'],
            "id_arriendo" => $a['id_arriendo'],
            "id_herramienta" => $a['id_herramienta'],
            "precio" => $a['precio'],
            "tiempo" => $a['tiempo'],
            "total" => $a['total'],
            "nombre" => $a['nombre'], 
            "precio_dia" => $a['precio_dia'], 
            "precio_mes" => $a['precio_mes']            
        );
    }

    $response = array('data' => $data,'detalle' => $datadetalle);

    echo json_encode($response);
}
?>