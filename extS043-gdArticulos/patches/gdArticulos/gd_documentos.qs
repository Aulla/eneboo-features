
/** @class_declaration gdArticulos */
/////////////////////////////////////////////////////////////////
/// GD ARTICULOS  ////////////////////////////////////////////////
class gdArticulos extends oficial /** %from: oficial */
{
  function gdArticulos(context)
  {
    oficial(context);
  }
  function infoObjeto(tipoObjeto: String, clave: String, ePadre: FLDomElement): String {
    return this.ctx.gdArticulos_infoObjeto(tipoObjeto, clave, ePadre);
  }
}
/// GD ARTICULOS  ////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition gdArticulos */
//////////////////////////////////////////////////////////////////
/// GD ARTICULOS  ////////////////////////////////////////////////
/** \D Sobrecargamos la principal para poder tener GD en Art�culos
@param  tipoObjeto: Tabla de la que proviene el objeto
@param  clave: Identificador �nico del objeto
@return string si la funci�n se ejecuta correctamente, false en caso contrario
\end */
function gdArticulos_infoObjeto(tipoObjeto: String, clave: String, ePadre: FLDomElement): String {
  var util: FLUtil = new FLUtil;
  var valor: String = "";
debug(">>>>>>>>>>>>>>>>>>>><  estou na gd");
  ePadre.setAttribute("Tipo", tipoObjeto);
  ePadre.setAttribute("IdObjeto", clave);
  switch (tipoObjeto)
  {
    case "articulos": {
      ePadre.setAttribute("Nombre", util.sqlSelect("articulos", "referencia", "referencia = '" + clave + "'"));
      break;
    }
    default: {
      return this.iface.__infoObjeto(tipoObjeto,clave,ePadre);
    }
  }
  return ePadre;
}

/// GD ARTICULOS  ////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

