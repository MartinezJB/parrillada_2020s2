class Comida {
	method peso()
	method valoracion()
	method esAptoVegetariano()	
	method esAbundante() {return self.peso() > 250} 
}

class Provoleta inherits Comida {
	var property tieneEspecias = true //calor por defecto
	var property peso //esto porque el metodo de la superclase esta vacio
	
	override method peso() { return peso}
	method esEspecial(){ return self.esAbundante() or tieneEspecias }
	override method esAptoVegetariano() { return !tieneEspecias }
	override method valoracion() {
		if(self.esEspecial()){ return 120 }
		else{return 80}
	}	
}

class HamburguesaCarne inherits Comida {
	var property pan 
	override method peso() { return 250 }
	override method esAptoVegetariano(){ return false }
	override method valoracion() { return 60 + pan.valoracion() }
}

object panIndustrial { method valoracion() { return 0 } }
object panCasero { method valoracion() { return 20 } }
object panMasaMadre { method valoracion() { return 45 } }

class HamburguesaVegetariana inherits HamburguesaCarne {
	var property deQueLegumbre = ""
	override method esAptoVegetariano() { return true }
	override method valoracion() { return super() + 17.min(2 * deQueLegumbre.size()) }
}

class Parrillada inherits Comida {
	var property cortes = []
	method agregarCorte(corte) { cortes.add(corte) }
	override method peso() { return cortes.sum({each=>each.peso()}) }
	override method esAptoVegetariano() { return false}
	override method valoracion() { return (15 * (cortes.max({each=>each.calidad()})).calidad()) - cortes.size() }
}
class Corte {
	var property peso
	var property calidad
}