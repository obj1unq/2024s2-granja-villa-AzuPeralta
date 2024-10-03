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
		//ME FALTA LIMITAR QUE SI HAY UNA PLANTA ARRIBA NO PASE NADA, como hago??
		tablero.validarDentro(position.up(1))
		position = position.up(1)
		
		image = "tomaco.png"
	}
}