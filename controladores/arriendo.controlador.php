<?php

class ControladorArriendo
{
    static public function ctrCrearArriendo($datos)
    {

        $respuesta = ModeloArriendo::mdlCrearArriendo($datos);

        return $respuesta;

    }
}
?>