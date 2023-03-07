<?php

class ControladorHerramientas
{
    static public function ctrMostrarHerramientas($search, $orden)
    {

        $respuesta = ModeloHerramienta::mdlMostrarHerramientas($search, $orden);

        return $respuesta;

    }

    static public function ctrCrearHerramienta($datos)
    {


        $respuesta = ModeloHerramienta::mdlCrearHerramientas($datos);

        return $respuesta;

    }
}
?>