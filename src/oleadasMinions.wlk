import campeones.*

class Oleada{
	var property cantMinion
	var property nroOleada
	var property plusDanio
	
	method meDefiendo(campeon){
		campeon.acumDanio(campeon.acumDanio() + cantMinion + plusDanio)
	}
}