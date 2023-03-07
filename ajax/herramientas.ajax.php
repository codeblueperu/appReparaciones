<?php
require_once "../controladores/herramientas.controlador.php";
require_once "../modelos/herramienta.modelo.php";


class AjaxCategorias
{
    public $idHerramientas;
}


/**
 * SHOW LISTA DATA HERRAMIENTAS
 */
if ($_GET['operation'] === 'show') {
    $serach = $_GET['buscar'];
    $orden = '';

    $response = ControladorHerramientas::ctrMostrarHerramientas($serach, $orden);
    $data = array();

    foreach ($response as $a) {
        $data[] = array(
            "id" => $a['id'],
            "nombre" => $a['nombre'],
            "tipo_herramienta" => $a['tipo_herramienta'],
            "marca" => $a['marca'],
            "modelo" => $a['modelo'],
            "n_serie" => $a['n_serie'],
            "n_placa" => $a['n_placa'],
            "precio_dia" => $a['precio_dia'],
            "precio_mes" => $a['precio_mes']
        );
    }

    echo json_encode($data);
} else if ($_GET['operation'] === 'create') {

    $datos = array(
        'nombre' => $_GET['txtnombre'],
        'tipo' => $_GET['cbotipo'],
        'marca' => $_GET['txtmarca'],
        'modelo' => $_GET['txtmodelo'],
        'n_serie' => $_GET['txtnserie'],
        'n_placa' => $_GET['txtnplaca'],
        'precio_dia' => $_GET['txtpdia'],
        'precio_mes' => $_GET['txtpmes']
    );

    $msg = ControladorHerramientas::ctrCrearHerramienta($datos);
    $response = array('message' => $msg);
    echo json_encode($response);

}


?>