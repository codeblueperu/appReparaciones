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
            let estado = (data[i].estado == '1' ? `<span class="badge btn-danger">Pendiente</span>` : `<span class="badge btn-success">Entregado</span>`)
          let btnedit = `<button class="btn btn-warning btn-sm" onclick="onUpdateArriendo(${data[i].id_arriendo});"><i class="fa fa-pencil-square-o"></i></button>`;
          
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
              btnedit
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
  