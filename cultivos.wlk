import granja.*
import wollok.game.*
import posiciones.*
import hector.*

class Maiz {
	var property position = game.at(1, 1)
	var property image = "corn_baby.png"
	var property esAdulta = false
	
	method regar() {
		image = "corn_adult.png"
		esAdulta = true
	}

	method precio() {
	  return 150
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

	method esAdulta() {
	  return evolucion >= 2
	}

	method precio() {
	  return (evolucion - 1) * 100
	}
}

class Tomaco {
	var property position = game.at(2, 3)
	var property image = "tomaco.png"
	
	method regar() {
		const nuevaPos = position.up(1)
		self.puedoMoverme(nuevaPos)
		position = nuevaPos
	}
	
	method puedoMoverme(posicion) {
		tablero.validarDentro(posicion)
		granja.validarParcela(posicion)
	}

	method esAdulta() {
	  return true
	}

	method precio() {
	  return 80
	}
}