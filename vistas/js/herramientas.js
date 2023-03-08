var __table_herramientas__ = $("#__table_herramienta__").DataTable({
  deferRender: true,
  retrieve: true,
  processing: true,
  language: {
    sProcessing: "Procesando...",
    sLengthMenu: "Mostrar _MENU_ registros",
    sZeroRecords: "No se encontraron resultados",
    sEmptyTable: "Ningún dato disponible en esta tabla",
    sInfo: "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
    sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0",
    sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
    sInfoPostFix: "",
    sSearch: "Buscar:",
    sUrl: "",
    sInfoThousands: ",",
    sLoadingRecords: "Cargando...",
    oPaginate: {
      sFirst: "Primero",
      sLast: "Último",
      sNext: "Siguiente",
      sPrevious: "Anterior",
    },
    oAria: {
      sSortAscending: ": Activar para ordenar la columna de manera ascendente",
      sSortDescending:
        ": Activar para ordenar la columna de manera descendente",
    },
  },
});

listarTipoHerramienta();
listarData();

async function listarData() {
  await $.ajax({
    url: `ajax/herramientas.ajax.php`,
    type: "GET",
    dataType: "json",
    data: { operation: "show", buscar: "" },
  })
    .done(function (data) {
      //console.log(data);
      __table_herramientas__.clear().draw();

      for (let i = 0; i < data.length; i++) {
        let btnedit = `<button class="btn btn-warning btn-sm" onclick="onBuscarHerramientaId(${data[i].id});"><i class="fa fa-pencil-square-o"></i></button>`;
        let btndelete = `<button class="btn btn-danger btn-sm" onclick="onDeleteHerramienta(${data[i].id})"><i class="fa fa-trash"></i></button>`;
        __table_herramientas__.row
          .add([
            i + 1,
            data[i].nombre,
            data[i].tipo_herramienta,
            data[i].marca,
            data[i].modelo,
            data[i].n_serie,
            data[i].n_placa,
            data[i].precio_dia,
            data[i].precio_mes,
            btnedit + " " + btndelete,
          ])
          .draw(false);
      }
    })
    .fail(function (error) {
      console.log(error);
    });
}

onCrearHerramienta = async () => {
  let id = $("#txtid").val();
  let txtnombre = $("#txtnombre").val();
  let cbotipo = $("#cbotipo").val();
  let txtmarca = $("#txtmarca").val();
  let txtmodelo = $("#txtmodelo").val();
  let txtnserie = $("#txtnserie").val();
  let txtnplaca = $("#txtnplaca").val();
  let txtpdia = $("#txtpdia").val();
  let txtpmes = $("#txtpmes").val();
  await $.ajax({
    url: `ajax/herramientas.ajax.php`,
    method: "GET",
    data: {
      id: id,
      txtnombre: txtnombre,
      cbotipo: cbotipo,
      txtmarca: txtmarca,
      txtmodelo: txtmodelo,
      txtnserie: txtnserie,
      txtnplaca: txtnplaca,
      txtpdia: txtpdia,
      txtpmes: txtpmes,
      operation: "createupdate",
    },
    dataType: "JSON",
  })
    .done(function (data) {
      console.log(data);
      $("#mdlHerramienta").modal("hide");
      swal({ type: "success", title: "Muy Bien!", html: data.message });
      onClear();
      listarData();
    })
    .fail(function (error) {
      console.log(error);
    });
};

onBuscarHerramientaId = async (id) => {
  $("#txtid").val(id);
  $("#mdlHerramienta").modal("show");
  await $.ajax({
    url: `ajax/herramientas.ajax.php`,
    method: "GET",
    data: {
      id: id,
      operation: "buscarID",
    },
    dataType: "JSON",
  })
    .done(function (data) {
     // console.log(data);
      $("#txtnombre").val(data.nombre);
      $("#cbotipo").val(data.id_herramienta);
      $("#txtmarca").val(data.marca);
      $("#txtmodelo").val(data.modelo);
      $("#txtnserie").val(data.n_serie);
      $("#txtnplaca").val(data.n_placa);
      $("#txtpdia").val(data.precio_dia);
      $("#txtpmes").val(data.precio_mes);
    })
    .fail(function (error) {
      console.log(error);
    });
};

onDeleteHerramienta = async (id) => {
  await swal({
    title: "Estas seguro de eliminar?",
    text: "una vez eliminada la herramienta no podras recuperarla!",
    type: "warning",
    buttons: true,
    dangerMode: true,
  }).then((willDelete) => {
    if (willDelete) {
      $.ajax({
        url: `ajax/herramientas.ajax.php`,
        method: "GET",
        data: {
          id: id,
          operation: "delete",
        },
        dataType: "JSON",
      })
        .done(function (data) {
          swal({ type: "success", title: "Muy Bien!", html: data.message });

          listarData();
        })
        .fail(function (error) {
          console.log(error);
        });
    } else {
      swal("operacion cancelada");
    }
  });
};

onClear = () => {
  $("#txtnombre").val("");
  $("#cbotipo").val("0");
  $("#txtmarca").val("");
  $("#txtmodelo").val("");
  $("#txtnserie").val("");
  $("#txtnplaca").val("");
  $("#txtpdia").val("");
  $("#txtpmes").val("");
  $("#txtid").val("");
};

async function listarTipoHerramienta() {
  await $.ajax({
    url: `ajax/herramientas.ajax.php`,
    type: "GET",
    dataType: "json",
    data: { operation: "listaTipo" },
  })
    .done(function (data) {
      //console.log(data);
      let option = '<option value="0">SELECCIONE...</option>'
      for (let i = 0; i < data.length; i++) {
        option += `<option value="${data[i].id}">${data[i].tipo_herramienta}</option>`
        
      }
      $("#cbotipo").html(option);
    })
    .fail(function (error) {
      console.log(error);
    });
}
