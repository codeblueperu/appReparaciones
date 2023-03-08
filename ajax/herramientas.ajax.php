<?php
require_once "../controladores/herramientas.controlador.php";
require_once "../modelos/herramienta.modelo.php";


class AjaxHerramienta
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
            "precio_mes" => $a['precio_mes'],
        );
    }

    echo json_encode($data);
} else if ($_GET['operation'] === 'createupdate') {

    $datos = array(
        'id' => $_GET['id'],
        'nombre' => $_GET['txtnombre'],
        'tipo' => $_GET['cbotipo'],
        'marca' => $_GET['txtmarca'],
        'modelo' => $_GET['txtmodelo'],
        'n_serie' => $_GET['txtnserie'],
        'n_placa' => $_GET['txtnplaca'],
        'precio_dia' => $_GET['txtpdia'],
        'precio_mes' => $_GET['txtpmes']
    );
    $msg = "";

    if (empty($_GET['id'])) {
        $msg = ControladorHerramientas::ctrCrearHerramienta($datos);
    } else {
        $msg = ControladorHerramientas::ctrUpdateHerramienta($datos);
    }

    $response = array('message' => $msg);
    echo json_encode($response);

} else if ($_GET['operation'] === 'buscarID') {

    $id = $_GET['id'];

    $response = ControladorHerramientas::ctrMostrarHerramientas('', '');
    $data = array();

    foreach ($response as $a) {
        if ($a['id'] == $id) {
            $data = array(
                "id" => $a['id'],
                "nombre" => $a['nombre'],
                "tipo_herramienta" => $a['tipo_herramienta'],
                "marca" => $a['marca'],
                "modelo" => $a['modelo'],
                "n_serie" => $a['n_serie'],
                "n_placa" => $a['n_placa'],
                "precio_dia" => $a['precio_dia'],
                "precio_mes" => $a['precio_mes'],
                "id_herramienta" => $a['id_herramienta']
            );
            break;
        }
    }
    echo json_encode($data);
} else if ($_GET['operation'] === 'delete') {

    $msg = ControladorHerramientas::ctrDeleteHerramienta($_GET['id']);
    $response = array('message' => $msg);
    echo json_encode($response);
} else if ($_GET['operation'] === 'listaTipo') {

    $response = ControladorHerramientas::ctrMostrarTipoHerramienta();
    $data = array();

    foreach ($response as $a) {
            $data[] = array(
                "id" => $a['id'],
                "tipo_herramienta" => $a['tipo_herramienta']                
            );
            
       
    }
    echo json_encode($data);
}


?>