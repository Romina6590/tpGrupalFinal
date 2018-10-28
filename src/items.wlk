import campeones.*

object anilloDeDoran{
	
	method estoyEn(campeon){
		return campeon.items().any{item=>item == self}
	}
	
	method meEquipa(campeon){
		campeon.puntosAtaque(campeon.puntosAtaque() + 15)
		campeon.puntosVida(campeon.puntosVida() + 60)
		campeon.acumDanio(campeon.acumDanio() + 5)
	}
	
	method meDesequipa(campeon){
		campeon.puntosAtaque(campeon.puntosAtaque() - 15)
		campeon.puntosVida(campeon.puntosVida() - 60)
		campeon.acumDanio(campeon.acumDanio() - 10)
	}
	
	method actualizarEstadisticas(campeon){
		
	}
}

object tomoAmplificador{
	var property vidaQueOtorgue = 0
	var property ataqueQueOtorgue = 0
	
	method estoyEn(campeon){
		return campeon.items().any{item=>item == self}
	}
	
	method meEquipa(campeon){
		campeon.puntosVida(campeon.puntosVida() + campeon.acumDanio() * 0.25)
		campeon.puntosAtaque(campeon.puntosAtaque() + campeon.acumDanio() * 0.05)
		vidaQueOtorgue = campeon.acumDanio() * 0.25
		ataqueQueOtorgue = campeon.acumDanio() * 0.05
		campeon.bloqueo(campeon.bloqueo() + 2)
		
	}
	
	method meDesequipa(campeon){
		campeon.acumDanio(campeon.acumDanio() + 30)
		campeon.bloqueo(campeon.bloqueo() + 1)
	}
	
	method actualizarEstadisticas(campeon){
		campeon.puntosVida(campeon.puntosVida() + campeon.acumDanio() * 0.25 - vidaQueOtorgue)
		campeon.puntosAtaque(campeon.puntosAtaque() + campeon.acumDanio() * 0.05 - ataqueQueOtorgue)
	}
}

object sombreroRabadon{
	var property vidaQueOtorgue = 0
	var property ataqueQueOtorgue = 0
	
	method estoyEn(campeon){
		return campeon.items().any{item=>item == self}
	}
	
	method meEquipa(campeon){
		vidaQueOtorgue = campeon.acumDanio() * 0.25 + 5
		ataqueQueOtorgue = campeon.puntosAtaque() * 2
		campeon.puntosVida(campeon.puntosVida() + campeon.acumDanio() * 0.25 + 5)
		campeon.puntosAtaque(campeon.puntosAtaque() + campeon.puntosAtaque() * 2)
		campeon.bloqueo(campeon.bloqueo() + 2)
		campeon.acumDanio(campeon.acumDanio() + 5)
		
	}
	
	method meDesequipa(campeon){
		
	}
	
	method actualizarEstadisticas(campeon){
		campeon.puntosVida(campeon.puntosVida() + campeon.acumDanio() * 0.25 + 5 - vidaQueOtorgue)
		campeon.puntosAtaque(campeon.puntosAtaque() + campeon.puntosAtaque() * 2 - ataqueQueOtorgue)
	}
} 