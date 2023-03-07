<?php

require_once "conexion.php";


class ModeloHerramienta
{
    /**
     * METHOD THE LIST DATA HERRAMIENTAS
     */

    static public function mdlMostrarHerramientas($search, $orden)
    {
        $stmt = Conexion::conectar()->prepare("SELECT h.id,h.nombre,t.tipo_herramienta,h.marca,h.modelo,h.n_serie,h.n_placa,h.precio_dia,h.precio_mes
            FROM herramientas h, tipo_herramienta t where h.tipo = t.id  order by h.id asc");

        $stmt->execute();

        return $stmt->fetchAll();

        $stmt->close();

        $stmt = null;

    }

    static public function mdlCrearHerramientas($datos)
    {

        $stmt = Conexion::conectar()->prepare("INSERT INTO herramientas (id,nombre, tipo, marca, modelo, n_serie, n_placa, precio_dia, precio_mes) VALUES (0,:nombre, :tipo, :marca, :modelo, :n_serie, :n_placa, :precio_dia, :precio_mes)");

        $stmt->bindParam(":nombre", $datos["nombre"], PDO::PARAM_STR);
        $stmt->bindParam(":tipo", $datos["tipo"], PDO::PARAM_STR);
        $stmt->bindParam(":marca", $datos["marca"], PDO::PARAM_STR);
        $stmt->bindParam(":modelo", $datos["modelo"], PDO::PARAM_STR);
        $stmt->bindParam(":n_serie", $datos["n_serie"], PDO::PARAM_STR);
        $stmt->bindParam(":n_placa", $datos["n_placa"], PDO::PARAM_STR);
        $stmt->bindParam(":precio_dia", $datos["precio_dia"], PDO::PARAM_STR);
        $stmt->bindParam(":precio_mes", $datos["precio_mes"], PDO::PARAM_STR);

        if ($stmt->execute()) {

            return "La herramienta fue creada con éxito.";

        } else {

            return "error";

        }

        $stmt->close();
        $stmt = null;

    }
}
?>