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

listarData();

async function listarData() {
  await $.ajax({
    url: `ajax/herramientas.ajax.php`,
    type: "GET",
    dataType: "json",
    data: { operation: "show", buscar: "" },
  })
    .done(function (data) {
      console.log(data);
      __table_herramientas__.clear().draw();

      for (let i = 0; i < data.length; i++) {
        let btndelete = `<button class="btn-circle bg-danger">OLA</button>`;
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
            btndelete,
          ])
          .draw(false);
      }
    })
    .fail(function (error) {
      console.log(error);
    });
}

onCrearHerramienta = async () => {
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
      txtnombre: txtnombre,
      cbotipo: cbotipo,
      txtmarca: txtmarca,
      txtmodelo: txtmodelo,
      txtnserie: txtnserie,
      txtnplaca: txtnplaca,
      txtpdia: txtpdia,
      txtpmes: txtpmes,
      operation: "create",
    },
    dataType: "JSON",
  })
    .done(function (data) {
      $("#mdlHerramienta").modal("hide");
      swal({ type: "success", title: "Muy Bien!", html: data.message });
      onClear();
      listarData();
    })
    .fail(function (error) {
      console.log(error);
    });
};

onClear = () => {
  $("#txtnombre").val("");
  $("#cbotipo").val("");
  $("#txtmarca").val("");
  $("#txtmodelo").val("");
  $("#txtnserie").val("");
  $("#txtnplaca").val("");
  $("#txtpdia").val("");
  $("#txtpmes").val("");
};
