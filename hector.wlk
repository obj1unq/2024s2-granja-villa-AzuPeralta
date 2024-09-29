import wollok.game.*
import posiciones.*
import cultivos.*



object hector {
	var property position = game.center()
	const property image = "player.png"

	method sembrar(cultivo) {
		if (cultivo == "maiz"){
	  		game.addVisual(new Maiz(position = self.position()))
		} else if (cultivo == "trigo"){
			game.addVisual(new Trigo(position = self.position()))
		} else{
			game.addVisual(new Tomaco(position = self.position()))
		}
	}

	method mover(direccion) {
		const nuevaPosicion = direccion.siguiente(position)
		tablero.validarDentro(nuevaPosicion)

		position = direccion.siguiente(position)
	}
}