
/** @class_declaration barCode */
/////////////////////////////////////////////////////////////////
//// TALLAS Y COLORES POR BARCODE ///////////////////////////////
class barCode extends oficial /** %from: oficial */ {
    function barCode( context ) { oficial ( context ); }
	function datosLineaFactura(curLineaAlbaran:FLSqlCursor):Boolean {
		return this.ctx.barCode_datosLineaFactura(curLineaAlbaran);
	}
}
//// TALLAS Y COLORES POR BARCODE ///////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_declaration rappel */
/////////////////////////////////////////////////////////////////
//// RAPPEL /////////////////////////////////////////////////////
class rappel extends barCode /** %from: barCode */ {
    function rappel( context ) { barCode ( context ); }
	function datosLineaFactura(curLineaAlbaran:FLSqlCursor):Boolean {
		return this.ctx.rappel_datosLineaFactura(curLineaAlbaran);
	}
}
//// RAPPEL /////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition barCode */
/////////////////////////////////////////////////////////////////
//// TALLAS Y COLORES POR BARCODE ///////////////////////////////
/** \D Copia los datos de una l�nea de albar�n en una l�nea de factura
@param	curLineaAlbaran: Cursor que contiene los datos a incluir en la l�nea de factura
@return	True si la copia se realiza correctamente, false en caso contrario
\end */
function barCode_datosLineaFactura(curLineaAlbaran:FLSqlCursor):Boolean
{
	if (!this.iface.__datosLineaFactura(curLineaAlbaran))
		return false;

	with (this.iface.curLineaFactura) {
		setValueBuffer("barcode", curLineaAlbaran.valueBuffer("barcode"));
		setValueBuffer("talla", curLineaAlbaran.valueBuffer("talla"));
		setValueBuffer("color", curLineaAlbaran.valueBuffer("color"));
	}
	return true;
}
//// TALLAS Y COLORES POR BARCODE ///////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition rappel */
/////////////////////////////////////////////////////////////////
//// RAPPEL /////////////////////////////////////////////////////
/** \D Copia los datos de una l�nea de albar�n en una l�nea de factura a�adiendo el dato de descuento por rappel a una l�nea de factura
@param	curLineaAlbaran: Cursor que contiene los datos a incluir en la l�nea de factura
@return	True si la copia se realiza correctamente, false en caso contrario
\end */
function rappel_datosLineaFactura(curLineaAlbaran:FLSqlCursor):Boolean
{
	if(!this.iface.__datosLineaFactura(curLineaAlbaran))
		return false;

	with (this.iface.curLineaFactura) {
		setValueBuffer("dtorappel", curLineaAlbaran.valueBuffer("dtorappel"));
	}
	return true;
}
//// RAPPEL /////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////

