import posiciones.*
import hector.*
import cultivos.*
import wollok.game.*



object granja {
  const property sembrados = #{}

  	method validarSiembra() {
		if (not game.colliders(self).isEmpty()){
			self.error("Ya hay un cultivo en esta parcela!")
		}
	}
}


