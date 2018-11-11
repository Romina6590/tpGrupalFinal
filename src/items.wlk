import campeones.*



class Item {
	
	method estoyEn(campeon){
		return campeon.items().any{item=>item == self}
	}
	
	method meEquipa(campeon){
		
	}
	
	method meDesequipa(campeon){
		
	}
	method actualizarEstadisticas(campeon){
		
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
		campeon.danioAcumulado(campeon.danioAcumulado() - 5)
	}
	
	
}
		
class ItemBloqueo inherits  Item{
	
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
}

class ItemVariante inherits Item {
	var property danioAlEquipar=0
	override method estoyEn(campeon){
		return campeon.items().any{item=>item == self}
	}
	
	override method meEquipa(campeon){
		campeon.plusVida(campeon.plusVida() + campeon.danioAcumulado() * 0.25 + 5)
		campeon.plusAtaque(campeon.plusAtaque() + campeon.baseAtaque() * 2)
		campeon.bloqueo(campeon.bloqueo() + 2)
		campeon.danioAcumulado(campeon.danioAcumulado() + 5)
		
	}
	override method actualizarEstadisticas(campeon){
		campeon.plusVida(campeon.plusVida() - danioAlEquipar * 0.25+5)
		campeon.plusVida(campeon.plusVida() + campeon.danioAcumulado() * 0.25+5)
			
	}
	
} 

