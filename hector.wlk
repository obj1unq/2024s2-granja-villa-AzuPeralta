import wollok.game.*
import posiciones.*
import cultivos.*
import granja.*

object hector {
	var property position = game.center()
	const property image = "player.png"
	const property cosecha = #{}
	var property oro = 0
	
	method sembrarTrigo() {
		const nuevaSiembra = new Trigo(position = self.position())
		granja.validarParcela(position)
		game.addVisual(nuevaSiembra)
		granja.sembrados().add(nuevaSiembra)
	}
	
	method sembrarMaiz() {
		const nuevaSiembra = new Maiz(position = self.position())
		granja.validarParcela(position)
		game.addVisual(nuevaSiembra)
		granja.sembrados().add(nuevaSiembra)
	}
	
	method sembrarTomaco() {
		const nuevaSiembra = new Tomaco(position = self.position())
		granja.validarParcela(position)
		game.addVisual(nuevaSiembra)
		granja.sembrados().add(nuevaSiembra)
	}
	
	method regar() {
		const cultivoEnPos = game.colliders(self)
		if (cultivoEnPos.isEmpty()) self.error("No tengo nada para regar!")
		else cultivoEnPos.forEach({ planta => planta.regar() })
	}

	method validarCosecha(planta) {
	  	if(not granja.plantaListaParaCosechar(planta)){
			self.error("No puedo cosechar aca!")
		}
	}
	
	method cosechar() {
		const cultivoEnPos = granja.cultivoEnLaPosicion(position)

		self.validarCosecha(cultivoEnPos)
		cosecha.add(cultivoEnPos)
		granja.cosecharPlanta(cultivoEnPos)
	}

	method vender() {
	 oro += cosecha.sum({planta => planta.precio()})
	 cosecha.clear()
	}
	
	method hablar() {

	  game.say(self, "Tengo "+ oro + " oro, y " + cosecha.count({planta => planta.esAdulta()}) + " para vender")
	}

	method mover(direccion) {
		const nuevaPosicion = direccion.siguiente(position)
		
		tablero.validarDentro(nuevaPosicion)
		position = direccion.siguiente(position)
	}
}