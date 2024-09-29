import wollok.game.*

class Maiz {
	var property position = game.at(1,1)
	// method position() {
	// 	// TODO: hacer que aparezca donde lo plante Hector
	// 	return position
	// }
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "corn_baby.png"
	}
}

class Trigo{
	var property position = game.at(9, 7)
	// method position() {
	// 	// TODO: hacer que aparezca donde lo plante Hector
	// 	return 
	// }
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "wheat_0.png"
	}

}

class Tomaco{
	var property position = game.at(2, 3)
	// method position() {
	// 	// TODO: hacer que aparezca donde lo plante Hector
	// 	return 
	// }
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "tomaco.png"
	}
}