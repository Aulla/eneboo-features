
/** @class_declaration barCode */
/////////////////////////////////////////////////////////////////
//// TALLAS Y COLORES POR BARCODE ///////////////////////////////
class barCode extends ivaIncluido {
    function barCode( context ) { ivaIncluido ( context ); }
	function datosLineaPedido(curLineaPresupuesto:FLSqlCursor):Boolean {
		return this.ctx.barCode_datosLineaPedido(curLineaPresupuesto);
	}
}
//// TALLAS Y COLORES POR BARCODE ///////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition barCode */
/////////////////////////////////////////////////////////////////
//// TALLAS Y COLORES POR BARCODE ///////////////////////////////

/** \D Copia los datos de una l�nea de presupuesto en una l�nea de pedido
@param	curLineaPresupuesto: Cursor que contiene los datos a incluir en la l�nea de pedido
@return	True si la copia se realiza correctamente, false en caso contrario
\end */
function barCode_datosLineaPedido(curLineaPresupuesto:FLSqlCursor):Boolean
{
	if (!this.iface.__datosLineaPedido(curLineaPresupuesto))
		return false;

	with (this.iface.curLineaPedido) {
		setValueBuffer("barcode", curLineaPresupuesto.valueBuffer("barcode"));
		setValueBuffer("talla", curLineaPresupuesto.valueBuffer("talla"));
		setValueBuffer("color", curLineaPresupuesto.valueBuffer("color"));
	}
	return true;
}
//// TALLAS Y COLORES POR BARCODE ///////////////////////////////
/////////////////////////////////////////////////////////////////

