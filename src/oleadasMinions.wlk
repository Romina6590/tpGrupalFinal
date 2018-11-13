import campeones.*



class Oleada{
	var property cantMinion = 0
	var property plusDanio = 0
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
	
	method cuantoOroDoyA(campeon){
	 if(campeon.ataqueTotal()<=self.cantMinion()){
		return campeon.ataqueTotal()
	}else{
		return  self.cantMinion()
		}
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
	
	override method cuantoOroDoyA(campeon){
		 return oleadas.sum{oleada=>oleada.cuantoOroDoyA(campeon)}
	}
	
	
}

