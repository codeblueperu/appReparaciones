var __table_arriendo__ = $("#__table_arriendo__").DataTable({
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
      url: `ajax/arriendo.ajax.php`,
      type: "GET",
      dataType: "json",
      data: { operation: "show", buscar: "" },
    })
      .done(function (data) {
        //console.log(data);
        __table_arriendo__.clear().draw();
  
        for (let i = 0; i < data.length; i++) {
            let estado = (data[i].estado == '1' ? `<span class="badge btn-warning">Pendiente</span>` : (data[i].estado == '2' ? `<span class="badge btn-danger">Anulado</span>` : `<span class="badge btn-success">Entregado</span>`))
          let btnedit = `<button class="btn btn-success btn-xs" onclick="onUpdateArriendo(${data[i].id_arriendo});"><i class="fa fa-check-square-o"></i></button>`;
          let btnprint = `<button class="btn btn-primary btn-xs" onclick="printcontratoarriendo(${data[i].id_arriendo});"><i class="fa fa-print"></i></button>`;
          
          __table_arriendo__.row
            .add([
              i + 1,
              data[i].nombre,
              data[i].documento,
              data[i].numero_ord_compra,
              moment(data[i].fecha_arrienda).format("DD/MM/yyyy"),
              data[i].subtotal,
              data[i].iva,
              data[i].total_pagar,
              data[i].periodo,
              estado,
              (data[i].estado == '1' ? btnedit : btnprint)
            ])
            .draw(false);
        }
      })
      .fail(function (error) {
        console.log(error);
      });
  }

  onUpdateArriendo = (id) => {
    window.location.href = "crear-arriendo?token="+id
  }
  

  function printcontratoarriendo(id){
    window.open(
      "ajax/rptcontratoarriendo.ajax.php",
      "",
      "location=no,menubar=no,titlebar=no,resizable=no,toolbar=no,scrollbars=yes,width=700,height=540"
    );
  }