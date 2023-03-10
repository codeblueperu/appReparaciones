//================================ RUTA TOKEN ====================================//
const urlParams = new URLSearchParams(window.location.search);
var token_value = urlParams.get("token");
//====================================================================//

var __table_herramientas__ = "";
var __table_shopping__ = "";

function init() {
  __table_herramientas__ = $("#__table_herramienta__").DataTable({
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
        sSortAscending:
          ": Activar para ordenar la columna de manera ascendente",
        sSortDescending:
          ": Activar para ordenar la columna de manera descendente",
      },
    },
  });

  __table_shopping__ = $("#__table_shopping__").DataTable({
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
        sSortAscending:
          ": Activar para ordenar la columna de manera ascendente",
        sSortDescending:
          ": Activar para ordenar la columna de manera descendente",
      },
    },
  });

  listarHerramientas();

  $("#txtfarriendo").val(moment(new Date()).format("yyyy-MM-DD"));
  $("#txtfdevolucion").val(moment(new Date()).format("yyyy-MM-DD"));
  //$("#txtfdevolucion").val(moment(new Date()).add(1, "d").format("yyyy-MM-DD"));
  if (token_value != null) {
    buscarDatosArriendo(token_value);
    $("#txtfdevolucion").val(moment(new Date()).format("yyyy-MM-DD"));
    $("#btn-save").css("display", "none");
    $("#btn-cerrar").css("display", "block");
    $("#dtphoraingreso").val(moment(new Date()).format("HH:mm"));
  } else {
    $("#btn-cerrar").css("display", "none");
    setInterval(() => {
      $("#dtphorasalida").val(moment(new Date()).format("HH:mm"));
    }, 1000);
  }
  onCalcularfechas();
}

async function listarHerramientas() {
  await $.ajax({
    url: `ajax/herramientas.ajax.php`,
    type: "GET",
    dataType: "json",
    data: { operation: "show", buscar: "" },
  })
    .done(function (data) {
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
  onCalcularTotales();
};

$("#__table_shopping__ tbody").on("click", "#botoneliminar", function () {
  __table_shopping__.row($(this).parents("tr")).remove().draw();
  onCalcularTotales();
});

onCalcularTotales = () => {
  let i = 0;
  let subtotal = 0;
  $("#__table_shopping__ tr").each(function () {
    if (i != 0) {
      subtotal += parseFloat($(this).find("td").eq(4).html());
    }
    i++;
  });
  $("#txtsubtotal").val(parseFloat(subtotal).toFixed(2));
  /* CALCULAR IVA */
  let iva = 0;
  if ($("#chkiva").prop("checked")) {
    iva = parseFloat(subtotal).toFixed(2) * 0.19;
  }
  let total = parseFloat(subtotal) + parseFloat(iva);
  $("#txtiva").val(parseFloat(iva).toFixed(2));
  $("#txttotal").val(parseFloat(total).toFixed(2));
};

onUpdateTable = () => {
  let pagetable = __table_shopping__.page.info();
  let cntherramientas = pagetable.recordsTotal;
  if (cntherramientas === 0) {
    return false;
  }
  let i = 0;
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
  onCalcularTotales();
};

onProcesar = () => {
  let pagetable = __table_shopping__.page.info();
  let cntherramientas = pagetable.recordsTotal;
  /* VALIDAMOS QUE EL CARRITO DE HERRAMIENTAS NO ESTE VACIO */
  if (cntherramientas > 0) {
    /* DATOS DE LA CABECERA */
    let datos = {
      id_usuario: $("#txtiduser").val(),
      id_cliente: $("#cbocliente").val(),
      banco: $("#txtbanco").val(),
      numero_ch: $("#txtnch").val(),
      plaza: $("#txtplaza").val(),
      numero_ord_compra: $("#txtncomprobante").val(),
      fecha_arrienda: $("#txtfarriendo").val(),
      h_arriendo: $("#dtphorasalida").val(),
      fecha_devolucion: $("#txtfdevolucion").val(),
      h_devolucion: $("#dtphoraingreso").val(),
      periodo: $("#cboperiodo").val(),
      observacion: $("#txtobs").val(),
      subtotal: $("#txtsubtotal").val(),
      iva: $("#txtiva").val(),
      total_pagar: $("#txttotal").val(),
      estado: 1,
    };

    /* DATOS DEL DETALLE */
    let i = 0;
    let detalle = [];
    $("#__table_shopping__ tr").each(function () {
      if (i != 0) {
        precio = 0;
        if ($("#cboperiodo").val() === "1") {
          precio = $(this).find("td").eq(2).find("input:eq(0)").val();
        } else {
          precio = $(this).find("td").eq(2).find("input:eq(1)").val();
        }
        detalle.push({
          id_herramienta: $(this).find("td").eq(0).html(),
          precio: precio,
          tiempo: $(this).find("td").eq(3).html(),
          total: $(this).find("td").eq(4).html(),
        });
      }
      i++;
    });

    $.ajax({
      url: `ajax/arriendo.ajax.php`,
      method: "GET",
      data: { operation: "createupdate", datos: datos, detalle: detalle },
      dataType: "JSON",
    })
      .done(function (data) {
        swal({ type: "success", title: "Bien echo!", text: data.message });
        setTimeout(() => {
          window.location.href = "arriendo";
        }, 2000);
      })
      .fail(function (error) {
        console.log(error);
      });
  } else {
    swal({
      type: "warning",
      title: "Upps!",
      text: "Todo los campos son Obligatorios",
    });
  }
};

function onCalcularfechas() {
  let txtfarriendo = moment($("#txtfarriendo").val(), "yyyy-MM-DD HH:mm");
  let txtfdevolucion = moment($("#txtfdevolucion").val(), "yyyy-MM-DD HH:mm");
  let dias = txtfdevolucion.diff(txtfarriendo, "days");
  let hs = $("#dtphorasalida").val();
  let hi = $("#dtphoraingreso").val();

  let countdias = calcularDiasAusencia(
    $("#txtfarriendo").val() + " " + hs,
    $("#txtfdevolucion").val() + " " + hi
  );
  $("#txtdias").val(countdias + " Dia(s)");
  /* if (parseInt(dias) > 30) {
    let dd = txtfdevolucion.diff(txtfarriendo, "days");
    $("#txtdias").val(txtfdevolucion.diff(txtfarriendo, "months") + " Mes(s)");
  } else {
    $("#txtdias").val(txtfdevolucion.diff(txtfarriendo, "days") + " Dia(s)");
  } */
}

function calcularDiasAusencia(fechaIni, fechaFin) {
  const inicio = new Date(fechaIni);
  const fin = new Date(fechaFin);
  const UN_DIA_EN_MILISEGUNDOS = 1000 * 60 * 60 * 24;
  const INTERVALO = UN_DIA_EN_MILISEGUNDOS * 1; // Cada DIA
  const formateadorFecha = new Intl.DateTimeFormat("es-Pe", {
    dateStyle: "medium",
  });
  let count_dias = 0;
  for (let i = inicio; i <= fin; i = new Date(i.getTime() + INTERVALO)) {
    count_dias++;
  }

  return count_dias;
}

function buscarDatosArriendo(token) {
  $.ajax({
    url: `ajax/arriendo.ajax.php`,
    type: "GET",
    dataType: "json",
    data: { operation: "buscararriendo", id: token },
  })
    .done(function ({ data, detalle }) {
      //console.log(detalle);
      $("#cbocliente").val(data.id_cliente);
      $("#txtbanco").val(data.banco);
      $("#txtnch").val(data.numero_ch);
      $("#txtplaza").val(data.plaza);
      $("#txtncomprobante").val(data.numero_ord_compra);
      $("#txtfarriendo").val(moment(data.fecha_arrienda).format("yyyy-MM-DD"));
      //$("#txtfdevolucion").val(data.);
      $("#cboperiodo").val(data.periodo);
      $("#txtobs").val(data.observacion);
      $("#txtsubtotal").val(data.subtotal);
      $("#txtiva").val(data.iva);
      $("#txttotal").val(data.total_pagar);
      $("#cboestado").val(0);
      $("#dtphorasalida").val(data.h_arriendo);
      buscarDataCliente()
      //$("#txtfdevolucion").val(),
      //h_devolucion:$("#dtphoraingreso").val(),
      if (data.iva != 0) {
        $("#chkiva").prop("checked", true);
      }
      onCalcularfechas();

      for (let i = 0; i < detalle.length; i++) {
        addservice(
          detalle[i].id_herramienta,
          detalle[i].nombre,
          detalle[i].precio_dia,
          detalle[i].precio_mes
        );
      }
    })
    .fail(function (error) {
      console.log(error);
    });
}

onCerrarProcesoArriendo = () => {
  let pagetable = __table_shopping__.page.info();
  let cntherramientas = pagetable.recordsTotal;
  /* VALIDAMOS QUE EL CARRITO DE HERRAMIENTAS NO ESTE VACIO */
  if (cntherramientas > 0) {
    /* DATOS DE LA CABECERA */
    let datos = {
      id_arriendo: token_value,
      id_usuario: $("#txtiduser").val(),
      id_cliente: $("#cbocliente").val(),
      banco: $("#txtbanco").val(),
      numero_ch: $("#txtnch").val(),
      plaza: $("#txtplaza").val(),
      numero_ord_compra: $("#txtncomprobante").val(),
      fecha_arrienda: $("#txtfarriendo").val(),
      h_arriendo: $("#dtphorasalida").val(),
      fecha_devolucion: $("#txtfdevolucion").val(),
      h_devolucion: $("#dtphoraingreso").val(),
      periodo: $("#cboperiodo").val(),
      observacion: $("#txtobs").val(),
      subtotal: $("#txtsubtotal").val(),
      iva: $("#txtiva").val(),
      total_pagar: $("#txttotal").val(),
      estado: $("#cboestado").val(),
    };

    /* DATOS DEL DETALLE */
    let i = 0;
    let detalle = [];
    $("#__table_shopping__ tr").each(function () {
      if (i != 0) {
        precio = 0;
        if ($("#cboperiodo").val() === "1") {
          precio = $(this).find("td").eq(2).find("input:eq(0)").val();
        } else {
          precio = $(this).find("td").eq(2).find("input:eq(1)").val();
        }
        detalle.push({
          id_arriendo: token_value,
          id_herramienta: $(this).find("td").eq(0).html(),
          precio: precio,
          tiempo: $(this).find("td").eq(3).html(),
          total: $(this).find("td").eq(4).html(),
        });
      }
      i++;
    });

    $.ajax({
      url: `ajax/arriendo.ajax.php`,
      method: "GET",
      data: {
        operation: "cerrararriendo",
        datos: datos,
        detalle: detalle,
        id_arriendo: token_value,
      },
      dataType: "JSON",
    })
      .done(function (data) {
        swal({ type: "success", title: "Bien echo!", text: data.message });
        setTimeout(() => {
          window.location.href = "arriendo";
        }, 2000);
      })
      .fail(function (error) {
        console.log(error);
      });
  } else {
    swal({
      type: "warning",
      title: "Upps!",
      text: "Todo los campos son Obligatorios",
    });
  }
};

function buscarDataCliente() {
  var datos = new FormData();
  datos.append("idCliente", $("#cbocliente").val());

  $.ajax({
    url: "ajax/clientes.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType: "json",
    success: function (respuesta) {
      $("#txtdocumento").val(respuesta["documento"]);
      $("#txtdireccion").val(respuesta["direccion"]);
    },
  });
}

init();
