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

var __table_shopping__ = $("#__table_shopping__").DataTable({
  paging: false,
  lengthChange: true,
  searching: false,
  ordering: false,
  info: true,
  retrieve: true,
  processing: true,
  autoWidth: false,
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

listarHerramientas();

$("#txtfarriendo").val(moment(new Date()).format("yyyy-MM-DD"));
$("#txtfdevolucion").val(moment(new Date()).add(1, "d").format("yyyy-MM-DD"));
onCalcularfechas();

async function listarHerramientas() {
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
        let btnedit = `<button class="btn btn-warning btn-xs" onclick="addservice(${data[i].id},'${data[i].nombre}',${data[i].precio_dia},${data[i].precio_mes})"><i class="fa fa-shopping-cart"></i></button>`;
        __table_herramientas__.row
          .add([
            data[i].nombre,
            data[i].marca + " / " + data[i].modelo,
            data[i].n_serie + " / " + data[i].n_placa,
            data[i].precio_dia,
            data[i].precio_mes,
            btnedit,
          ])
          .draw(false);
      }
    })
    .fail(function (error) {
      console.log(error);
    });
}

addservice = (id, nombre, pdia, pmes) => {
  console.log(nombre);
  let dias = parseInt($("#txtdias").val());
  let periodo = $("#cboperiodo").val();
  let precio = 0;
  let pdiainput = `<input type="hidden" value="${pdia}">`;
  let pmesinput = `<input type="hidden" value="${pmes}">`;

  /* X DIA */
  if (periodo === "1") {
    precio = pdia;
  } else {
    /* X MES */
    precio = pmes;
  }
  let total = parseFloat(precio) * parseInt(dias);
  __table_shopping__.row
    .add([
      id,
      nombre,
      pdiainput + pmesinput + precio,
      dias,
      total,
      '<a href="#" id="botoneliminar" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></a>',
    ])
    .draw(false);
};

$("#__table_shopping__ tbody").on("click", "#botoneliminar", function () {
  __table_shopping__.row($(this).parents("tr")).remove().draw();
  // mostrarTotal();
});

onUpdateTable = () => {
  i = 0;
  let suma = 0.0;
  let periodo = $("#cboperiodo").val();
  let dias = parseInt($("#txtdias").val());
  $("#__table_shopping__ tr").each(function () {
    if (i != 0) {
      let precio = 0;
      let pdiainput = `<input type="hidden" value="${$(this)
        .find("td")
        .eq(2)
        .find("input:eq(0)")
        .val()}">`;
      let pmesinput = `<input type="hidden" value="${$(this)
        .find("td")
        .eq(2)
        .find("input:eq(1)")
        .val()}">`;

      if (periodo == "1") {
        precio = $(this).find("td").eq(2).find("input:eq(0)").val();
      } else {
        precio = $(this).find("td").eq(2).find("input:eq(1)").val();
      }

      let total = parseFloat(dias) * parseFloat(precio);
      __table_shopping__
        .cell(i - 1, 2)
        .data(pdiainput + pmesinput + precio)
        .draw(false);
      __table_shopping__
        .cell(i - 1, 3)
        .data(dias)
        .draw(false);
      __table_shopping__
        .cell(i - 1, 4)
        .data(parseFloat(Math.round(total * 100) / 100).toFixed(2))
        .draw(false);
      suma += total;
    }
    i++;
  });
};

onProcesar =  () => {
  let pagetable = __table_shopping__.page.info();
  let cntherramientas = pagetable.recordsTotal;
  /* VALIDAMOS QUE EL CARRITO DE HERRAMIENTAS NO ESTE VACIO */
  if (cntherramientas == 0) {
    let datos = {
      txtiduser: $("#txtiduser").val(),
      cbocliente: $("#cbocliente").val(),
      txtbanco: $("#txtbanco").val(),
      txtnch: $("#txtnch").val(),
      txtplaza: $("#txtplaza").val(),
      txtncomprobante: $("#txtncomprobante").val(),
      txtfarriendo: moment($("#txtfarriendo").val()),
      txtfdevolucion: moment($("#txtfdevolucion").val()),
      cboperiodo: $("#cboperiodo").val(),
      txtobs: $("#txtobs").val(),
    };

    let forData = new FormData();
    forData.append("datos", JSON.stringify(datos));
    forData.append("operation", 'createupdate');

     $.ajax({
      url: `ajax/arriendo.ajax.php`,
      method: "GET",
      data: forData,
      dataType: "JSON",
    })
      .done(function (data) {
        console.log(data)
      })
      .fail(function (error) {
        console.log(error);
      });
  } else {
    alert("Vacio");
  }
};

function onCalcularfechas() {
  let txtfarriendo = moment($("#txtfarriendo").val());
  let txtfdevolucion = moment($("#txtfdevolucion").val());
  let dias = txtfdevolucion.diff(txtfarriendo, "days");

  if (parseInt(dias) > 30) {
    let dd = txtfdevolucion.diff(txtfarriendo, "days");
    $("#txtdias").val(txtfdevolucion.diff(txtfarriendo, "months") + " Mes(s)");
  } else {
    $("#txtdias").val(txtfdevolucion.diff(txtfarriendo, "days") + " Dia(s)");
  }
}
