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
<<<<<<< HEAD
}

class EjercitoDeMinions inherits Oleada{
	var property oleadas
	override method estaMuerta(){
		return oleadas.all{oleada=>oleada.estoyMuerta()}
	}
	
	method reciboDanio(campeon){
		return oleadas.forEach{oleada=>oleada.meAtaca(campeon)}
	}
	
	method provocoDanio(campeon){
		return oleadas.forEach{oleada=>oleada.meDefiendo(campeon)}
	}
	
}
=======
}

>>>>>>> branch 'master' of https://github.com/obj1unq-2018s2/tp-cuatrimestral-obj1-tp1-fraga-polesel.git
