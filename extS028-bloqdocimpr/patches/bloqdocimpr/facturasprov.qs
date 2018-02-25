
/** @class_declaration bloqDocImpr */
/////////////////////////////////////////////////////////////////
//// BLOQUEO DOCUMENTOS IMPRESION ///////////////////////////////
class bloqDocImpr extends eFactura /** %from: oficial */
{
  function bloqDocImpr(context)
  {
    eFactura(context);
  }
  function init()
  {
    return this.ctx.bloqDocImpr_init();
  }

}
//// BLOQUEO DOCUMENTOS IMPRESION ///////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition bloqDocImpr */
/////////////////////////////////////////////////////////////////
//// BLOQUEO DOCUMENTOS IMPRESION ///////////////////////////////

function bloqDocImpr_init()
{
  this.iface.__init();
  var util:FLUtil = new FLUtil();
  var cursor: FLSqlCursor = this.cursor();

  if (cursor.modeAccess() == cursor.Edit) {
		if (cursor.valueBuffer("impreso") == true && util.sqlSelect("empresa", "bloqfacproimp", " 1 = 1") == true )
		{
			MessageBox.warning(util.translate("scripts", "Seg�n la configuraci�n actual no es posible\neditar una factura de proveedor impresa.\n\nContacte con un administrador si es necesario."), MessageBox.Ok, MessageBox.NoButton);
			this.form.close();
		}
    }




}
//// BLOQUEO DOCUMENTOS IMPRESION ///////////////////////////////
/////////////////////////////////////////////////////////////////

