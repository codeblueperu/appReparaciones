<div id="back"></div>

<div class="login-box">
  
  <div class="login-logo">

       <!-- 
<img src="vistas/img/plantilla/logo2.jpg" class="img-responsive"> -->

  </div>
  <br>
  <br>
  <br>
  <br>
  <br>

  <div class="login-box-body">
   <img src="vistas/img/plantilla/logo2.jpg" class="img-responsive">
   <center>
   <h3>Ingresar al sistema de F&F</h3>
    </center>

    <form method="post">

      <div class="form-group has-feedback">

        <input type="text" class="form-control" placeholder="Usuario" name="ingUsuario" required>
        <span class="glyphicon glyphicon-user form-control-feedback"></span>

      </div>

      <div class="form-group has-feedback">

        <input type="password" class="form-control" placeholder="Contraseña" name="ingPassword" required>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      
      </div>

      <div class="row">
       
        <div class="col-xs-4">

          <button type="submit" class="btn btn-primary btn-block btn-flat">Ingresar</button>
        
        </div>

      </div>

      <?php

        $login = new ControladorUsuarios();
        $login -> ctrIngresoUsuario();
        
      ?>

    </form>

  </div>

</div>
