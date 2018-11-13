import campeones.*



class Oleada{
	var property cantMinion = null
	var property plusDanio = null
	
	method meDefiendo(campeon){
		if(not self.estoyMuerta()){
			campeon.danioAcumulado(campeon.danioAcumulado() + cantMinion + plusDanio)	
		}
	}
	method meAtaca(campeon){
		cantMinion-=campeon.ataqueTotal()
	}
	method estoyMuerta(){
		return cantMinion<=0
	}

}

//parte individual
class EjercitoDeMinions inherits Oleada{
	var property oleadas
	override method estoyMuerta(){
		return oleadas.all{oleada=>oleada.estoyMuerta()}
	}
	
	override method meDefiendo(campeon){
		 oleadas.forEach{oleada=>oleada.meDefiendo(campeon)}
	}
	
	override method meAtaca(campeon){
		oleadas.forEach{oleada=>oleada.meAtaca(campeon)}
	}
	
	override method cantMinion(){
		return oleadas.sum{oleada=>oleada.cantMinion()}
	}
	
	override method plusDanio(){
		return oleadas.sum{oleada=>oleada.plusDanio()}
	}
	
	
}

