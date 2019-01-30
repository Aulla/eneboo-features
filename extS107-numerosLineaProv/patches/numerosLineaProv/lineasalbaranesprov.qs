
/** @class_declaration numerosLineaProv */
/////////////////////////////////////////////////////////////////
//// NUMEROS DE L�NEA ///////////////////////////////////////////
class numerosLineaProv extends barCode /** %from: oficial */
{
  function numerosLineaProv(context)
  {
    barCode(context);
  }
  function init()
  {
    return this.ctx.numerosLineaProv_init();
  }
}
//// NUMEROS DE L�NEA ///////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition numerosLineaProv */
/////////////////////////////////////////////////////////////////
//// N�MEROS DE L�NEA ///////////////////////////////////////////
function numerosLineaProv_init()
{
  this.iface.__init();

  var cursor: FLSqlCursor = this.cursor();
  switch (cursor.modeAccess()) {
    case cursor.Insert: {
      debug("SIAGAL >>>>>>> lineasalbaranesprov.qs >>>>>>>>>>>>> numerosLineaProv_init   CURSOR INSERT");
      cursor.setValueBuffer("numlinea",this.iface.calculateField("numlinea"));
      break;
    }
  }
}
//// N�MEROS DE L�NEA ///////////////////////////////////////////
/////////////////////////////////////////////////////////////////

