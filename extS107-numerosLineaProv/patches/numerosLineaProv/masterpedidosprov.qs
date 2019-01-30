
/** @class_declaration numerosLineaProv */
/////////////////////////////////////////////////////////////////
//// NUMEROS DE L�NEA ///////////////////////////////////////////
class numerosLineaProv extends barCode /** %from: oficial */
{
  var numLinea_: Number;
  function numerosLineaProv(context)
  {
    barCode(context);
  }
  function generarAlbaran(where: String, cursor: FLSqlCursor, datosAgrupacion: Array): Number {
    return this.ctx.numerosLineaProv_generarAlbaran(where, cursor, datosAgrupacion);
  }
  function copiaLineas(idPedido: Number, idAlbaran: Number): Boolean {
    return this.ctx.numerosLineaProv_copiaLineas(idPedido, idAlbaran);
  }
  function datosLineaAlbaran(curLineaPedido: FLSqlCursor): Boolean {
    return this.ctx.numerosLineaProv_datosLineaAlbaran(curLineaPedido);
  }
}
//// NUMEROS DE L�NEA ///////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition numerosLineaProv */
/////////////////////////////////////////////////////////////////
//// N�MEROS DE L�NEA ///////////////////////////////////////////
function numerosLineaProv_generarAlbaran(where: String, cursor: FLSqlCursor, datosAgrupacion: Array): Number {
  this.iface.numLinea_ = 0;

  var idAlbaran: String = this.iface.__generarAlbaran(where, cursor, datosAgrupacion);
  if (!idAlbaran)
  {
    return false;
  }

  return idAlbaran;
}

function numerosLineaProv_copiaLineas(idPedido: Number, idAlbaran: Number): Boolean {
  var util: FLUtil = new FLUtil;
  var cantidad: Number;
  var totalEnAlbaran: Number;
  var curLineaPedido: FLSqlCursor = new FLSqlCursor("lineaspedidosprov");
  curLineaPedido.select("idpedido = " + idPedido + " AND (cerrada = false or cerrada IS NULL) ORDER BY numlinea");
  while (curLineaPedido.next())
  {
    curLineaPedido.setModeAccess(curLineaPedido.Browse);
    curLineaPedido.refreshBuffer();
    cantidad = parseFloat(curLineaPedido.valueBuffer("cantidad"));
    totalEnAlbaran = parseFloat(curLineaPedido.valueBuffer("totalenalbaran"));
    if (cantidad > totalEnAlbaran) {
      if (!this.iface.copiaLineaPedido(curLineaPedido, idAlbaran)) {
        return false;
      }
    }
  }
  return true;
}

/** \D Copia los datos de una l�nea de pedido en una l�nea de albar�n
@param  curLineaPedido: Cursor que contiene los datos a incluir en la l�nea de albar�n
@return True si la copia se realiza correctamente, false en caso contrario
\end */
function numerosLineaProv_datosLineaAlbaran(curLineaPedido: FLSqlCursor): Boolean {
  var util: FLUtil = new FLUtil;

  if (!this.iface.__datosLineaAlbaran(curLineaPedido))
  {
    return false;
  }

  this.iface.numLinea_++;
  this.iface.curLineaAlbaran.setValueBuffer("numlinea", this.iface.numLinea_);

  return true;
}
//// N�MEROS DE L�NEA ///////////////////////////////////////////
/////////////////////////////////////////////////////////////////

