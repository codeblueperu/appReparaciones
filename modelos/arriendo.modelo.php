<?php

require_once "conexion.php";


class ModeloArriendo
{
    /**
     * METHOD THE LIST DATA HERRAMIENTAS
     */

    static public function mdlMostrarArriendo($search, $orden)
    {
        $stmt = Conexion::conectar()->prepare("SELECT h.id,h.nombre,t.tipo_herramienta,h.marca,h.modelo,h.n_serie,h.n_placa,h.precio_dia,h.precio_mes,t.id as id_herramienta
            FROM herramientas h, tipo_herramienta t where h.tipo = t.id  order by h.id asc");

        $stmt->execute();

        return $stmt->fetchAll();

        $stmt->close();

        $stmt = null;

    }

    static public function mdlCrearArriendo($datos)
    {

        $stmt = Conexion::conectar()->prepare("INSERT INTO arriendo (id_cliente, id_usuario, banco, numero_ch, plaza, numero_ord_compra, observacion, fecha_arrienda,fecha_devolucion,subtotal,iva,total_pagar,estado)
         VALUES (:id_cliente, :id_usuario, :banco, :numero_ch, :plaza, :numero_ord_compra, :observacion, :fecha_arrienda, :fecha_devolucion, :subtotal, :iva, :total_pagar, :estado)");

        $stmt->bindParam(":id_cliente", $datos["id_cliente"], PDO::PARAM_STR);
        $stmt->bindParam(":id_usuario", $datos["id_usuario"], PDO::PARAM_STR);
        $stmt->bindParam(":banco", $datos["banco"], PDO::PARAM_STR);
        $stmt->bindParam(":numero_ch", $datos["numero_ch"], PDO::PARAM_STR);
        $stmt->bindParam(":plaza", $datos["plaza"], PDO::PARAM_STR);
        $stmt->bindParam(":numero_ord_compra", $datos["numero_ord_compra"], PDO::PARAM_STR);
        $stmt->bindParam(":observacion", $datos["observacion"], PDO::PARAM_STR);
        $stmt->bindParam(":fecha_arrienda", $datos["fecha_arrienda"], PDO::PARAM_STR);
        $stmt->bindParam(":fecha_devolucion", $datos["fecha_devolucion"], PDO::PARAM_STR);
        $stmt->bindParam(":subtotal", $datos["subtotal"], PDO::PARAM_STR);
        $stmt->bindParam(":iva", $datos["iva"], PDO::PARAM_STR);
        $stmt->bindParam(":total_pagar", $datos["total_pagar"], PDO::PARAM_STR);
        $stmt->bindParam(":estado", $datos["estado"], PDO::PARAM_STR);

        if ($stmt->execute()) {

            return "La herramienta fue creada con éxito.";

        } else {

            return "error";

        }

        $stmt->close();
        $stmt = null;

    }

    static public function mdlUpdateHerramientas($datos)
    {

        $stmt = Conexion::conectar()->prepare("UPDATE herramientas SET nombre = :nombre, tipo = :tipo, marca = :marca, modelo = :modelo, n_serie = :n_serie, n_placa = :n_placa, precio_dia = :precio_dia, precio_mes = :precio_mes WHERE id = :id");

        $stmt->bindParam(":nombre", $datos["nombre"], PDO::PARAM_STR);
        $stmt->bindParam(":tipo", $datos["tipo"], PDO::PARAM_STR);
        $stmt->bindParam(":marca", $datos["marca"], PDO::PARAM_STR);
        $stmt->bindParam(":modelo", $datos["modelo"], PDO::PARAM_STR);
        $stmt->bindParam(":n_serie", $datos["n_serie"], PDO::PARAM_STR);
        $stmt->bindParam(":n_placa", $datos["n_placa"], PDO::PARAM_STR);
        $stmt->bindParam(":precio_dia", $datos["precio_dia"], PDO::PARAM_STR);
        $stmt->bindParam(":precio_mes", $datos["precio_mes"], PDO::PARAM_STR);
        $stmt->bindParam(":id", $datos["id"], PDO::PARAM_STR);

        if ($stmt->execute()) {

            return "La herramienta fue actualizada con éxito.";

        } else {

            return "error";

        }

        $stmt->close();
        $stmt = null;

    }

    static public function mdlDeleteHerramientas($id)
    {

        $stmt = Conexion::conectar()->prepare("DELETE FROM herramientas WHERE id = :id");


        $stmt->bindParam(":id", $id, PDO::PARAM_STR);

        if ($stmt->execute()) {

            return "La herramienta fue eliminado con éxito.";

        } else {

            return "error";

        }

        $stmt->close();
        $stmt = null;

    }

    static public function mdlMostrarTipoHerramienta()
    {
        $stmt = Conexion::conectar()->prepare("SELECT * FROM tipo_herramienta ");

        $stmt->execute();

        return $stmt->fetchAll();

        $stmt->close();

        $stmt = null;

    }
}
?>