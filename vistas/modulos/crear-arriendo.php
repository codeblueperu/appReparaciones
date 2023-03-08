<?php

if ($_SESSION["perfil"] == "Especial") {

    echo '<script>

    window.location = "inicio";

  </script>';

    return;

}



?>
<div class="content-wrapper">

    <section class="content-header">

        <h1>
            Nuevo Arriendo

        </h1>

        <ol class="breadcrumb">

            <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>

            <li class="active">nuevo arriendo</li>

        </ol>

    </section>

    <section class="content">
        <div class="row">
            <!-- DATOS PERSONALES -->
            <div class="col-md-7">
                <div class="box box-primary">
                    <div class="box-header with-border">Datos del Arriendo</div>
                    <div class="box-body">
                        <input type="hidden" value="<?= $_SESSION["id"]?>" id="txtiduser">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="cbocliente">Cliente (*)</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-microchip"></i></span>
                                        <select name="cbocliente" id="cbocliente" class="form-control">
                                            <?php

                                            $item = null;
                                            $valor = null;

                                            $categorias = ControladorClientes::ctrMostrarClientes($item, $valor);

                                            foreach ($categorias as $key => $value) {
                                                echo '<option value="' . $value["id"] . '">' . $value["nombre"] . '</option>';
                                            }

                                            ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="txtdocumento">Documento (*)</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-microchip"></i></span>
                                        <input type="text" name="txtdocumento" id="txtdocumento" class="form-control"
                                            disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="txtdireccion">Direccion (*)</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-microchip"></i></span>
                                        <input type="text" name="txtdireccion" id="txtdireccion" class="form-control"
                                            disabled>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="txtbanco">Banco (*)</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-microchip"></i></span>
                                        <input type="text" name="txtbanco" id="txtbanco" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="txtnch">Numero CH (*)</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-microchip"></i></span>
                                        <input type="text" name="txtnch" id="txtnch" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="txtplaza">Plaza (*)</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-microchip"></i></span>
                                        <input type="text" name="txtplaza" id="txtplaza" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="txtncomprobante">N° comprobante (*)</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-microchip"></i></span>
                                        <input type="text" name="txtncomprobante" id="txtncomprobante"
                                            class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="txtfarriendo">Fecha Arriendo (*)</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input type="date" name="txtfarriendo" id="txtfarriendo" class="form-control">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="txtfdevolucion">Fecha Devolución (*)</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input type="date" name="txtfdevolucion" id="txtfdevolucion"
                                            class="form-control" onchange="onCalcularfechas();onUpdateTable()">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="txtdias">Dias Transcurridos (*)</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input type="text" name="txtdias" id="txtdias" class="form-control" value="0" disabled>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="cboperiodo">Periodo (*)</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <select name="cboperiodo" id="cboperiodo" class="form-control"
                                            onchange="onUpdateTable()">
                                            <option value="1">Dias</option>
                                            <option value="2">Mes</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="txtobs">Observacion</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-file"></i></span>
                                        <textarea name="txtobs" id="txtobs" class="form-control" cols="30"
                                            rows="2"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="table-responsive col-md-12">
                                <table id="__table_shopping__" class="table table-bordered table-striped dt-responsive">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Descripcion</th>
                                            <th>Precio</th>
                                            <th>Tiempo</th>
                                            <th>Total</th>
                                            <th></th>
                                        </tr>
                                    </thead>

                                </table>
                            </div>
                        </div>

                        <div class="row" style="margin-top: 15px;">
                            <div class="col-md-12" style="display:flex; flex-direction: row;justify-content: end;">
                                <button class="btn btn-success mt-5" style="width:150px;" onclick="onProcesar()">Procesar Arriendo</button>
                            </div>
                        </div>
                                            
                    </div>
                </div>
            </div>
            <!-- DATOS DE LAS HERRAMIENTAS -->
            <div class="col-md-5">
                <div class="box box-success">
                    <div class="box-header with-border">Mis Herramientas</div>
                    <div class="box-body">
                        <div class="table-responsive">
                            <table id="__table_herramienta__" class="table table-bordered table-striped dt-responsive"
                                width="100%">
                                <thead>
                                    <tr>
                                        <th>Descripción</th>
                                        <th>Marca | Modelo</th>
                                        <th>N° Serie | N° Placa</th>
                                        <th>Pr. Dia</th>
                                        <th>Pr. Mes</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>

    <!-- MODALS -->
    <?php require('modals/crear-herramienta.php') ?>

</div>
<script src="vistas/js/new-arriendo.js"></script>