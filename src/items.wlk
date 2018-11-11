import campeones.*



class Item {
	var property precio
	
	method estoyEn(campeon){
		return campeon.items().any{item=>item == self}
	}
	
	method meEquipa(campeon){
		
	}
	
	method meDesequipa(campeon){
		
	}
	method actualizarEstadisticas(campeon){
		
	}
	method habilidadActivable(campeon){
		
	}
	
}

class ItemVidaAtaque inherits Item{
	override method meEquipa(campeon){
		campeon.plusAtaque(campeon.plusAtaque() + 15)
		campeon.plusVida(campeon.plusVida() + 60)
		campeon.danioAcumulado(campeon.danioAcumulado() + 5)
		
	}
	override method meDesequipa(campeon){
		campeon.plusAtaque(campeon.plusAtaque() - 15)
		campeon.plusVida(campeon.plusVida() - 60)
		campeon.danioAcumulado(campeon.danioAcumulado() - 10)
	}
	
	
}
		
class ItemBloqueo inherits  Item{
	var property usosHabilidad
	var property danioAlEquipar=0
	 
	override method meEquipa(campeon){
		
			campeon.plusAtaque(campeon.plusAtaque() + campeon.danioAcumulado() * 0.05)
			campeon.plusVida(campeon.plusVida() + campeon.danioAcumulado() * 0.25)
			danioAlEquipar=campeon.danioAcumulado()
			campeon.bloqueo(campeon.bloqueo() + 2)
	}
	
	override method meDesequipa(campeon){
		campeon.plusVida(campeon.plusVida() - campeon.danioAcumulado() * 0.25)
		campeon.plusAtaque(campeon.plusAtaque() - campeon.danioAcumulado() * 0.05)
		campeon.danioAcumulado(campeon.danioAcumulado() + 30)
		campeon.bloqueo(campeon.bloqueo() + 1)
	}
	override method actualizarEstadisticas(campeon){
		campeon.plusVida(campeon.plusVida() - danioAlEquipar * 0.25)
		campeon.plusAtaque(campeon.plusAtaque() - danioAlEquipar * 0.05)
		campeon.plusAtaque(campeon.plusAtaque() + campeon.danioAcumulado() * 0.05)
		campeon.plusVida(campeon.plusVida() + campeon.danioAcumulado() * 0.25)
			
	}
	override method habilidadActivable(campeon){
		if(usosHabilidad>0&& campeon.cantDinero()<500){
			usosHabilidad-=1
			campeon.cantDinero(500)
		}
	}
}

class ItemVariante inherits ItemBloqueo {
	
	
	override method precio(){
		return super()+100
	}
	
	override method meEquipa(campeon){
		campeon.plusVida(campeon.plusVida() + campeon.danioAcumulado() * 0.25 + 5)
		campeon.plusAtaque(campeon.plusAtaque() + campeon.baseAtaque() * 2)
		campeon.bloqueo(campeon.bloqueo() + 2)
		campeon.danioAcumulado(campeon.danioAcumulado() + 5)
		
	}
	override method meDesequipa(campeon){
		
	}
	override method actualizarEstadisticas(campeon){
		campeon.plusVida(campeon.plusVida() - danioAlEquipar * 0.25+5)
		campeon.plusVida(campeon.plusVida() + campeon.danioAcumulado() * 0.25+5)
			
	}
	override method habilidadActivable(campeon){
		
	}
	

} 

class Pocion inherits Item{
	var property usosHabilidad
	override method habilidadActivable(campeon){
		if(usosHabilidad>0){
			campeon.danioAcumulado(campeon.danioAcumulado()-50)
	    }
	    
	 }
}

