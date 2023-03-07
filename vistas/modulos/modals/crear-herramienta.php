<div id="mdlHerramienta" class="modal fade" role="dialog">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header" style="background:#3c8dbc; color:white">

                <button type="button" class="close" data-dismiss="modal">&times;</button>

                <h4 class="modal-title">Nueva Herramienta</h4>

            </div>

            <div class="modal-body">

                <div class="box-body">
                    <div class="row">
                        <input type="text" id="txtid">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="">Nombre (*)</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-cog"></i></span>
                                    <input type="text" class="form-control" id="txtnombre">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                            <label for="">Seleccione un Tipo (*)</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-map"></i></span>
                                    <select  id="cbotipo" class="form-control">
                                        <option value="1">SELECCIONE...</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                            <label for="">Marca (*)</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-newspaper-o"></i></span>
                                    <input type="text" class="form-control" id="txtmarca">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                            <label for="">Modelo (*)</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-microchip"></i></span>
                                    <input type="text" class="form-control" id="txtmodelo">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                            <label for="">N° Serie (*)</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-credit-card-alt"></i></span>
                                    <input type="text" class="form-control" id="txtnserie">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                            <label for="">N° Placa (*)</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                    <input type="text" class="form-control" id="txtnplaca">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                            <label for="">Precio Dia (*)</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-money"></i></span>
                                    <input type="number" class="form-control" id="txtpdia">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                            <label for="">Precio Mes (*)</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-money"></i></span>
                                    <input type="number" class="form-control" id="txtpmes">
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

            <div class="modal-footer">

                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

                <button class="btn btn-primary" onclick="onCrearHerramienta()" >Guardar</button>

            </div>

        </div>

    </div>

</div>