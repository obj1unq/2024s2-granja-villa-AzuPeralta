import wollok.game.*
import posiciones.*
import cultivos.*
import granja.*

object hector {
	var property position = game.center()
	const property image = "player.png"
	
	method sembrarTrigo() {
		const nuevaSiembra = new Trigo(position = self.position())
		granja.validarSiHayPlanta(position)
		game.addVisual(nuevaSiembra)
		granja.sembrados().add(nuevaSiembra)
	}
	
	method sembrarMaiz() {
		const nuevaSiembra = new Maiz(position = self.position())
		granja.validarSiHayPlanta(position)
		game.addVisual(nuevaSiembra)
		granja.sembrados().add(nuevaSiembra)
	}
	
	method sembrarTomaco() {
		const nuevaSiembra = new Tomaco(position = self.position())
		granja.validarSiHayPlanta(position)
		game.addVisual(nuevaSiembra)
		granja.sembrados().add(nuevaSiembra)
	}
	
	method regar() {
		const cultivoEnPos = game.colliders(self)
		if (cultivoEnPos.isEmpty()) self.error("No tengo nada para regar!")
		else cultivoEnPos.forEach({ planta => planta.regar() })
	}
	
	method mover(direccion) {
		const nuevaPosicion = direccion.siguiente(position)
		
		tablero.validarDentro(nuevaPosicion)
		position = direccion.siguiente(position)
	}
}