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
            Mis Arriendos

        </h1>

        <ol class="breadcrumb">

            <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>

            <li class="active">mis arriendo</li>

        </ol>

    </section>

    <section class="content">

        <div class="box">

            <div class="box-header with-border">
                <a href="crear-arriendo">
                    <button class="btn btn-primary" data-toggle="modal" data-target="#mdlHerramienta"
                        onclick="onClear()">
                        Nuevo arriendo
                    </button>
                </a>

            </div>

            <div class="box-body">

                <table id="__table_herramienta__" class="table table-bordered table-striped dt-responsive" width="100%">

                    <thead>

                        <tr>

                            <th style="width:10px">#</th>
                            <th>Nombre</th>
                            <th>Tipo</th>
                            <th>Marca</th>
                            <th>Modelo</th>
                            <th>N° Serie</th>
                            <th>N° Placa</th>
                            <th>Precio Dia</th>
                            <th>Precio Mes</th>
                            <th></th>

                        </tr>

                    </thead>

                    <tbody>



                    </tbody>

                </table>

            </div>

        </div>

    </section>

    <!-- MODALS -->
    <!--  -->

</div>

<script src="vistas/js/herramientas.js"></script>