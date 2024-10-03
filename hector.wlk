import wollok.game.*
import posiciones.*
import cultivos.*
import granja.*


object hector {
	var property position = game.center()
	const property image = "player.png"
	
	method sembrarTrigo() {
		const nuevaSiembra = new Trigo(position = self.position())
		self.validarSiembra()
		game.addVisual(nuevaSiembra)
		granja.sembrados().add(nuevaSiembra)
	}
	
	method sembrarMaiz() {
		self.validarSiembra()
		game.addVisual(new Maiz(position = self.position()))
	}
	
	method sembrarTomaco() {
		self.validarSiembra()
		game.addVisual(new Tomaco(position = self.position()))

	}
	
	method validarSiembra() {
		if (not game.colliders(self).isEmpty()){
			self.error("Ya hay un cultivo en esta parcela!")
		}
	}
	
	method regar() {
		const cultivoEnPos = game.colliders(self)
		if (cultivoEnPos.isEmpty()){
			self.error("No tengo nada para regar!")
		} else{
			cultivoEnPos.forEach({planta => planta.regar()})
		}
	  
	}

	method mover(direccion) {
		const nuevaPosicion = direccion.siguiente(position)
		
		tablero.validarDentro(nuevaPosicion)
		position = direccion.siguiente(position)
	}
}