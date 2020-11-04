import comidas.*
class Comensal {
	var property comidas = []
	var property peso = 0
	method leAgrada(unaComida)
	method satisfecho() { return comidas.sum({each=>each.peso()}) >= peso*0.01 }
	method comer(comida) { comidas.add(comida) }
}

class Vegetariano inherits Comensal {
	override method leAgrada(comida) { return comida.esAptoVegetariano() and comida.valoracion() > 85 }
	override method satisfecho() { return super() and !comidas.any({each=>each.esAbundante()}) }
}

class HambrePopular inherits Comensal {
	override method leAgrada(unaComida) { return unaComida.esAbundante() }
}

class PaladarFino inherits Comensal {
	override method leAgrada(comida) { return comida.peso().between(150,300) and comida.valoracion() > 100}
	override method satisfecho() { return super() and comidas.size().even() }
}