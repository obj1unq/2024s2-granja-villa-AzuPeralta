import posiciones.*
import hector.*
import cultivos.*
import wollok.game.*

object granja {
  const property sembrados = #{}
  
  method validarParcela(posicion) {
    if (self.hayPlantaEn(posicion)) hector.error(
        "Hay un cultivo en esta parcela!"
      )
  }
  method hayPlantaEn(posicion) {
    //Existe una planta en esta posicion? BOOLEANO
    return sembrados.any({planta => planta.position() == posicion})
  }

  method cultivoEnLaPosicion(posicion) {
    //Si hay una planta en esta posicion, devolvemela. 
    return sembrados.find({planta => planta.position() == posicion})
  }

  method plantaListaParaCosechar(planta) {
    return self.hayPlantaEn(hector.position()) and planta.esAdulta()
}

  method cosecharPlanta(planta){
    	game.removeVisual(planta)
  		sembrados.remove(planta)

}
}
