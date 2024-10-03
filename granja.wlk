import posiciones.*
import hector.*
import cultivos.*
import wollok.game.*

object granja {
  const property sembrados = #{}
  
  method validarSiembra() {
    if (not game.colliders(hector).isEmpty()) hector.error(
        "Ya hay un cultivo en esta parcela!"
      )
  }

//Como hago para que NO HAYA OTRA PLANTA EN LA POSICION al momento de sembrar utilizando la coleccion
//   method validarRiego(posicion) {
//     if (posicion.isEmpty()) hector.error("No tengo nada para regar!")

    
//   }
}
