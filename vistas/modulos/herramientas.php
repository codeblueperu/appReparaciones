<?php

if($_SESSION["perfil"] == "Especial"){

  echo '<script>

    window.location = "inicio";

  </script>';

  return;

}

/* $xml = ControladorVentas::ctrDescargarXML();

if($xml){

  rename($_GET["xml"].".xml", "xml/".$_GET["xml"].".xml");

  echo '<a class="btn btn-block btn-success abrirXML" archivo="xml/'.$_GET["xml"].'.xml" href="ventas">Se ha creado correctamente el archivo XML <span class="fa fa-times pull-right"></span></a>';

} */

?>
<div class="content-wrapper">

  <section class="content-header"> 
    
    <h1>
      
      Administrar Herramientas
    
    </h1>

    <ol class="breadcrumb">
      
      <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>
      
      <li class="active">Administrar herramientas</li>
    
    </ol>

  </section>

  <section class="content">

    <div class="box">

      <div class="box-header with-border">

          <button class="btn btn-primary" data-toggle="modal" data-target="#mdlHerramienta" onclick="onClear()">           
            Agregar Herramienta
          </button>

         <!-- <button type="button" class="btn btn-default pull-right" id="daterange-btn">
           
            <span>
              <i class="fa fa-calendar"></i> 

              <?php

               /*  if(isset($_GET["fechaInicial"])){

                  echo $_GET["fechaInicial"]." - ".$_GET["fechaFinal"];
                
                }else{
                 
                  echo 'Rango de fecha';

                } */

              ?>
            </span>

            <i class="fa fa-caret-down"></i>

         </button> -->

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

       <?php

     /*  $eliminarVenta = new ControladorVentas();
      $eliminarVenta -> ctrEliminarVenta(); */

      ?>
       

      </div>

    </div>

  </section>

  <!-- MODALS -->
  <?php require('modals/crear-herramienta.php')?>

</div>

<script src="vistas/js/herramientas.js"></script>



