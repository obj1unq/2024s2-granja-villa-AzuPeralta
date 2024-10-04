import granja.*
import wollok.game.*
import posiciones.*
import hector.*

class Maiz {
	var property position = game.at(1, 1)
	var property image = "corn_baby.png"
	
	method regar() {
		image = "corn_adult.png"
	}
}

class Trigo {
	var property position = game.at(9, 7)
	var property image = ("wheat_" + evolucion) + ".png"
	var property evolucion = 0
	
	method regar() {
		if (evolucion <= 2) {
			image = ("wheat_" + (evolucion + 1)) + ".png"
			evolucion += 1
		} else {
			if (evolucion == 3) {
				image = ("wheat_" + 0) + ".png"
				evolucion = 0
			}
		}
	}
}

class Tomaco {
	var property position = game.at(2, 3)
	var property image = "tomaco_baby.png"
	
	method regar() {
		const nuevaPos = position.up(1)
		self.puedoMoverme(nuevaPos)
		position = nuevaPos
		
		image = "tomaco.png"
	}
	
	method puedoMoverme(posicion) {
		tablero.validarDentro(posicion)
		granja.validarSiHayPlanta(posicion)
	}
}