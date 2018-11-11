import campeones.*

class Oleada{
	var property cantMinion
	var property nroOleada
	var property plusDanio
	
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