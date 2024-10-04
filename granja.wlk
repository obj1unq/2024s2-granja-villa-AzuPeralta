import posiciones.*
import hector.*
import cultivos.*
import wollok.game.*

object granja {
  const property sembrados = #{}
  
  method validarSiHayPlanta(posicion) {
    if (self.hayPlantaEn(posicion)) hector.error(
        "Hay un cultivo en esta parcela!"
      )
  }
  method hayPlantaEn(posicion) {
    return sembrados.any({planta => planta.position() == posicion})
  }

}
