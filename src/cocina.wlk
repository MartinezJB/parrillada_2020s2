import comidas.*
import comensales.*

object cocina {
	var property comidas=[]
	method comer(comida){comidas.add(comida)}
	
	method tieneBuenaOfertaVegana(){
		return comidas.count({each=>!each.esAptoVegetariano()}).between(
			comidas.count({each=>each.esAptoVegetariano()})-2,
			comidas.count({each=>each.esAptoVegetariano()})+2
		) or comidas.count({each=>each.esAptoVegetariano()}) > comidas.count({each=>!each.esAptoVegetariano()}) 
	}
	method platoFuerteCarnivoro() {
		return comidas.filter({each=>!each.esAptoVegetariano()}).max({each=>each.valoracion()})
	}
	
	method comidasQueLeGusta(comensal) {
		return comidas.filter({each=>comensal.leAgrada(each)})
	}
	method elegirPlato(comensal) {
		const plato=comidas.anyOne()
		if(comensal.leAgrada(plato)){
			comidas.remove(plato)
			comensal.comer(plato)
		}
		else{self.error("Al comensal no le gusta el plato")}
	}
}