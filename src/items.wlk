import campeones.*

<<<<<<< HEAD

object anilloDeDoran {
	
	method estoyEn(campeon){
		return campeon.items().any({item=>item == self})
	}

	
	method meEquipa(campeon){
		campeon.puntosAtaque(campeon.puntosAtaque()+15)
		campeon.puntosVida(campeon.puntosVida()+60)
		campeon.acumDanio(campeon.acumDanio()+5)
	}
	method meDesequipa(campeon){
		campeon.puntosAtaque(campeon.puntosAtaque()-15)
		campeon.puntosVida(campeon.puntosVida()-60)
		campeon.acumDanio(campeon.acumDanio()-10)
	}	
	method actualizarEstadisticas(campeon){
		
	}
	
}
object tomoAmplificador{
	
	var property vidaQueOtorgue=0
	var property ataqueQueOtorgue=0
	method estoyEn(campeon){
		return campeon.items().any({item=>item == self})
	}
	

	method meEquipa(campeon){
		campeon.puntosVida(campeon.puntosVida()+campeon.acumDanio()*0.25)
		campeon.puntosAtaque(campeon.puntosAtaque()+campeon.acumDanio()*0.05)
		vidaQueOtorgue=campeon.acumDanio()*0.25
		ataqueQueOtorgue=campeon.acumDanio()*0.05
		campeon.bloqueo(campeon.bloqueo()+2)		
	}
	method meDesequipa(campeon){
		campeon.acumDanio(campeon.acumDanio()+30)
		campeon.bloqueo(campeon.bloqueo()+1)
	}
	method actualizarEstadisticas(campeon){
		campeon.puntosVida(campeon.puntosVida()+campeon.acumDanio()*0.25-vidaQueOtorgue)
		campeon.puntosAtaque(campeon.puntosAtaque()+campeon.acumDanio()*0.05-ataqueQueOtorgue)
	}	

}
object sombreroRabadon{
	var property vidaQueOtorgue=0
	var property ataqueQueOtorgue=0
	
	method estoyEn(campeon){
		return campeon.items().any({item=>item == self})
	}

	method meEquipa(campeon){
		campeon.puntosVida(campeon.puntosVida()+campeon.acumDanio()*0.25+5)
		ataqueQueOtorgue=campeon.puntosAtaque()*2
		campeon.puntosAtaque(campeon.puntosAtaque()+campeon.puntosAtaque()*2)
		vidaQueOtorgue=campeon.acumDanio()*0.25+5
		campeon.bloqueo(campeon.bloqueo()+2)
		campeon.acumDanio(campeon.acumDanio()+5)		
	}
	method meDesequipa(campeon){
	
	}
	method actualizarEstadisticas(campeon){
		campeon.puntosVida(campeon.puntosVida()+campeon.acumDanio()*0.25+5-vidaQueOtorgue)
		campeon.puntosAtaque(campeon.puntosAtaque()+campeon.puntosAtaque()*2-ataqueQueOtorgue)
	}
}
=======
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
>>>>>>> branch 'master' of https://github.com/obj1unq-2018s2/tp-cuatrimestral-obj1-tp1-fraga-polesel.git
