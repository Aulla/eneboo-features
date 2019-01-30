
/** @class_declaration orderCols */
/////////////////////////////////////////////////////////////////
//// ORDER COLS /////////////////////////////////////////////////
class orderCols extends oficial {
    function orderCols( context ) { oficial ( context ); }
	function init() {
		return this.ctx.orderCols_init();
	}
    function reordenarColumnas() {
		return this.ctx.orderCols_reordenarColumnas();
	}
}
/////////////////////////////////////////////////////////////////
//// ORDER COLS /////////////////////////////////////////////////

/** @class_definition orderCols */
/////////////////////////////////////////////////////////////////
//// ORDER COLS /////////////////////////////////////////////////
function orderCols_init()
{
	
  	this.iface.__init();

	connect(this.child("tdbLineasComanda").cursor(), "newBuffer()", this, "iface.reordenarColumnas");
  
	var util: FLUtil = new FLUtil;
	var cursor:FLSqlCursor = this.child("tdbLineasComanda").cursor();
	var orden:Array = formRecordordercols.iface.pub_aplicarOrden(cursor);
	this.child("tdbLineasComanda").setOrderCols(orden);
	


	var anchos:Array = formRecordordercols.iface.pub_aplicarAnchos(cursor);
	if (anchos.length == orden.length) { 
	    for (var i = 0; i < anchos.length; i++) {
		  this.child("tdbLineasComanda").setColumnWidth(orden[i], anchos[i]);
	    }
	} else {
	    MessageBox.warning(util.translate("scripts", "No se puede establecer el ancho de columnas al ser diferente\nel número de elementos de anchura que de columnas seleccionadas."), MessageBox.Ok, MessageBox.NoButton);

	}

	this.child("tdbLineasComanda").switchSortOrder(formRecordordercols.iface.pub_ascendenteDescendente(cursor));
	
	this.child("tdbLineasComanda").refresh(); 	
	
}


function orderCols_reordenarColumnas()
{
  /* Deixamos os anchos das columnas soamente */
  
	var util: FLUtil = new FLUtil;
	var cursor:FLSqlCursor = this.child("tdbLineasComanda").cursor();
	var orden:Array = formRecordordercols.iface.pub_aplicarOrden(cursor);
	var anchos:Array = formRecordordercols.iface.pub_aplicarAnchos(cursor);
	if (anchos.length == orden.length) {
	    for (var i = 0; i < anchos.length; i++) {
		  this.child("tdbLineasComanda").setColumnWidth(orden[i], anchos[i]);
	    }
	} else {
	    MessageBox.warning(util.translate("scripts", "No se puede establecer el ancho de columnas al ser diferente\nel nÃºmero de elementos de anchura que de columnas seleccionadas."), MessageBox.Ok, MessageBox.NoButton);

	}

	this.child("tdbLineasComanda").refresh();


}
//// ORDER COLS /////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

