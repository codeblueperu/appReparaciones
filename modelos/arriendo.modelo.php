<?php

require_once "conexion.php";


class ModeloArriendo
{
    /**
     * METHOD THE LIST DATA HERRAMIENTAS
     */

    static public function mdlMostrarArriendo($search)
    {
        $stmt = Conexion::conectar()->prepare("SELECT a.id_arriendo,a.id_cliente,c.nombre,c.documento,a.numero_ord_compra,
        a.fecha_arrienda,a.subtotal,a.iva,a.total_pagar,case a.periodo when '1' then 'DIARIO' else 'MENSUAL' end as periodo,u.usuario, a.estado ,a.h_arriendo,a.h_devolucion
         FROM arriendo a, clientes c, usuarios u where a.id_cliente = c.id and a.id_usuario  = u.id ORDER BY a.id_arriendo desc");

        $stmt->execute();

        return $stmt->fetchAll();

        $stmt->close();

        $stmt = null;

    }

    static public function mdlCrearArriendo($datos,$detalle)
    {
        $stmt = Conexion::conectar()->prepare("INSERT INTO arriendo (id_cliente, id_usuario, banco, numero_ch, plaza, numero_ord_compra, periodo, observacion, fecha_arrienda,h_arriendo,fecha_devolucion,h_devolucion,subtotal,iva,total_pagar,estado)
         VALUES (:id_cliente, :id_usuario, :banco, :numero_ch, :plaza, :numero_ord_compra, :periodo, :observacion, :fecha_arrienda, :h_arriendo, :fecha_devolucion, :h_devolucion, :subtotal, :iva, :total_pagar, :estado)");

        $stmt->bindParam(":id_cliente", $datos["id_cliente"], PDO::PARAM_INT);
        $stmt->bindParam(":id_usuario", $datos["id_usuario"], PDO::PARAM_INT);
        $stmt->bindParam(":banco", $datos["banco"], PDO::PARAM_STR);
        $stmt->bindParam(":numero_ch", $datos["numero_ch"], PDO::PARAM_STR);
        $stmt->bindParam(":plaza", $datos["plaza"], PDO::PARAM_STR);
        $stmt->bindParam(":numero_ord_compra", $datos["numero_ord_compra"], PDO::PARAM_STR);
        $stmt->bindParam(":periodo", $datos["periodo"], PDO::PARAM_STR);
        $stmt->bindParam(":observacion", $datos["observacion"], PDO::PARAM_STR);
        $stmt->bindParam(":fecha_arrienda", $datos["fecha_arrienda"], PDO::PARAM_STR);
        $stmt->bindParam(":h_arriendo", $datos["h_arriendo"], PDO::PARAM_STR);       
        $stmt->bindParam(":fecha_devolucion", $datos["fecha_devolucion"], PDO::PARAM_STR);
        $stmt->bindParam(":h_devolucion", $datos["h_devolucion"], PDO::PARAM_STR);
        $stmt->bindParam(":subtotal", $datos["subtotal"], PDO::PARAM_STR);
        $stmt->bindParam(":iva", $datos["iva"], PDO::PARAM_STR);
        $stmt->bindParam(":total_pagar", $datos["total_pagar"], PDO::PARAM_STR);
        $stmt->bindParam(":estado", $datos["estado"], PDO::PARAM_STR);

        if ($stmt->execute()) {
            $id= 2;
            foreach ($detalle as $key) {
                $stmt = Conexion::conectar()->prepare("INSERT INTO detalle_arriendo (id_arriendo, id_herramienta, precio, tiempo, total)
                VALUES ((SELECT id_arriendo from arriendo order by id_arriendo desc limit 1), :id_herramienta, :precio, :tiempo, :total)");
    
                //$stmt->bindParam(":id_arriendo", $id, PDO::PARAM_INT);
                $stmt->bindParam(":id_herramienta", $key["id_herramienta"], PDO::PARAM_INT);
                $stmt->bindParam(":precio", $key["precio"], PDO::PARAM_STR);
                $stmt->bindParam(":tiempo", $key["tiempo"], PDO::PARAM_STR);
                $stmt->bindParam(":total", $key["total"], PDO::PARAM_STR);
        
                $stmt->execute();
            }
            return "El arriendo fue registrado con éxito.";

        } else {

            return "error";

        }

        $stmt->close();
        $stmt = null;

    }

    static public function mdlBuscarArriendoID($id)
    {
        $stmt = Conexion::conectar()->prepare("SELECT a.* FROM arriendo a, clientes c, usuarios u where a.id_cliente = c.id and a.id_usuario  = u.id and a.id_arriendo = :id");

        $stmt->bindParam(":id", $id, PDO::PARAM_STR);
        $stmt->execute();

        return $stmt->fetchAll();

        $stmt->close();

        $stmt = null;

    }
    static public function mdlBuscarDetalleArriendoID($id)
    {
        $stmt = Conexion::conectar()->prepare("SELECT dt.*,h.nombre,h.precio_dia,h.precio_mes FROM detalle_arriendo dt, herramientas h where dt.id_herramienta = h.id and dt.id_arriendo = :id");

        $stmt->bindParam(":id", $id, PDO::PARAM_STR);
        $stmt->execute();

        return $stmt->fetchAll();

        $stmt->close();

        $stmt = null;

    }

    static public function mdlCerrarArriendo($datos,$detalle,$id_Arriendo)
    {
       
        /* ACTUALIZAMOS LOS DATOS DEL ARRIENDO */
        $stmt = Conexion::conectar()->prepare("UPDATE arriendo SET id_cliente = :id_cliente, id_usuario = :id_usuario, banco = :banco, numero_ch = :numero_ch, plaza = :plaza
            , numero_ord_compra = :numero_ord_compra, periodo =  :periodo, observacion = :observacion, fecha_arrienda = :fecha_arrienda,h_arriendo = :h_arriendo ,fecha_devolucion = :fecha_devolucion,h_devolucion =  :h_devolucion, 
            subtotal = :subtotal, iva = :iva,total_pagar = :total_pagar,estado = :estado where id_arriendo = :id_arriendo ");

        $stmt->bindParam(":id_cliente", $datos["id_cliente"], PDO::PARAM_INT);
        $stmt->bindParam(":id_usuario", $datos["id_usuario"], PDO::PARAM_INT);
        $stmt->bindParam(":banco", $datos["banco"], PDO::PARAM_STR);
        $stmt->bindParam(":numero_ch", $datos["numero_ch"], PDO::PARAM_STR);
        $stmt->bindParam(":plaza", $datos["plaza"], PDO::PARAM_STR);
        $stmt->bindParam(":numero_ord_compra", $datos["numero_ord_compra"], PDO::PARAM_STR);
        $stmt->bindParam(":periodo", $datos["periodo"], PDO::PARAM_STR);
        $stmt->bindParam(":observacion", $datos["observacion"], PDO::PARAM_STR);
        $stmt->bindParam(":fecha_arrienda", $datos["fecha_arrienda"], PDO::PARAM_STR);
        $stmt->bindParam(":h_arriendo", $datos["h_arriendo"], PDO::PARAM_STR);       
        $stmt->bindParam(":fecha_devolucion", $datos["fecha_devolucion"], PDO::PARAM_STR);
        $stmt->bindParam(":h_devolucion", $datos["h_devolucion"], PDO::PARAM_STR);
        $stmt->bindParam(":subtotal", $datos["subtotal"], PDO::PARAM_STR);
        $stmt->bindParam(":iva", $datos["iva"], PDO::PARAM_STR);
        $stmt->bindParam(":total_pagar", $datos["total_pagar"], PDO::PARAM_STR);
        $stmt->bindParam(":estado", $datos["estado"], PDO::PARAM_STR);
        $stmt->bindParam(":id_arriendo", $id_Arriendo, PDO::PARAM_INT);

        if ($stmt->execute()) {
            /* UNA VEZ ACTUALIZADO ELIMINAMOS EL DETALLE ANTERIOR PARA INSERTAR EL NUEVO DETALLE */
            $stmt = Conexion::conectar()->prepare("DELETE FROM  detalle_arriendo where id_arriendo = :id_arriendo ");
            $stmt->bindParam(":id_arriendo", $id_Arriendo, PDO::PARAM_INT);
            $stmt->execute();

            /* GUARDAMOS EL NUEVO DETALLE */
            foreach ($detalle as $key) {
                $stmt = Conexion::conectar()->prepare("INSERT INTO detalle_arriendo (id_arriendo, id_herramienta, precio, tiempo, total)
                VALUES (:id_arriendo, :id_herramienta, :precio, :tiempo, :total)");
    
                $stmt->bindParam(":id_arriendo", $key["id_arriendo"], PDO::PARAM_INT);
                $stmt->bindParam(":id_herramienta", $key["id_herramienta"], PDO::PARAM_INT);
                $stmt->bindParam(":precio", $key["precio"], PDO::PARAM_STR);
                $stmt->bindParam(":tiempo", $key["tiempo"], PDO::PARAM_STR);
                $stmt->bindParam(":total", $key["total"], PDO::PARAM_STR);
        
                $stmt->execute();
            }
            return "El arriendo fue cerrado con éxito.";

        } else {

            return "error";

        }

        $stmt->close();
        $stmt = null;

    }
}
?>