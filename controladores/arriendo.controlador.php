<?php

class ControladorArriendo
{
    static public function ctrMostrarArriendo($search)
    {

        $respuesta = ModeloArriendo::mdlMostrarArriendo($search);

        return $respuesta;

    }

    static public function ctrCrearArriendo($datos,$detalle)
    {

        $respuesta = ModeloArriendo::mdlCrearArriendo($datos,$detalle);

        return $respuesta;

    }

    static public function ctrBuscarArriendoID($id)
    {

        $respuesta = ModeloArriendo::mdlBuscarArriendoID($id);

        return $respuesta;

    }

    static public function ctrBuscarDetalleArriendoID($id)
    {

        $respuesta = ModeloArriendo::mdlBuscarDetalleArriendoID($id);

        return $respuesta;

    }

    static public function ctrCerrarArriendo($datos,$detalle,$id_arriendo)
    {

        $respuesta = ModeloArriendo::mdlCerrarArriendo($datos,$detalle,$id_arriendo);

        return $respuesta;

    }

    static public function ctrParametrosGenerales()
    {

        $respuesta = ModeloArriendo::mdlParametrosGenerales();

        return $respuesta;

    }
}
?>