import items.*
import oleadasMinions.*

class Campeon {
	var property puntosAtaque
	var property puntosVida
	var property acumDanio
	var property items
	var property bloqueo
	
	
	method seMuere(){
		return puntosVida<=acumDanio
	}
	method equipar(item){
		items.add(item)
		item.meEquipa(self)
	}
	method desequipar(item){
		
		if(item.estoyEn(self)){
			items.remove(item)
			item.meDesequipa(self)
		}
	}
	method atacar(oleada){
		if(self.bloqueo()==0){
		oleada.meDefiendo(self)
		items.forEach{item=>item.actualizarEstadisticas(self)}
		}else{
			bloqueo-=1
		}
	
	}
	
	
}
