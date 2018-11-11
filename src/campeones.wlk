import items.*
import oleadasMinions.*

class Campeon {
	const property baseAtaque
	const property baseVida
	var property plusAtaque = 0
	var property plusVida = 0
	var property danioAcumulado = 0
	var property items = #{}
	var property bloqueo = 0
	var property cantDinero=0
	
 	method vidaTotal(){
		return baseVida + plusVida
	}
	
	method ataqueTotal(){
		return baseAtaque + plusAtaque
	}
	method estoyMuerto(){
		return self.vidaTotal() <= danioAcumulado
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
	method ganarOro(oleada){
		if(self.ataqueTotal()<=oleada.cantMinion()){
			cantDinero+=self.ataqueTotal()
		}else{
			cantDinero+=oleada.cantMinion()
		}
	}
	
	method atacar(oleada){
		self.ganarOro(oleada)
		if (self.bloqueo() == 0){
			oleada.meDefiendo(self)
			oleada.meAtaca(self)
			items.forEach({item=>item.actualizarEstadisticas(self)})
		}else{
			bloqueo -= 1
			oleada.meAtaca(self)
		}
	}
	
	method comprar(item){
		if(cantDinero>=item.precio()){
			self.equipar(item)
			cantDinero-=item.precio()
		}
	}
	method vender(item){
		cantDinero+=item.precio()/2
		self.desequipar(item)
	}
	method usarHabilidad(item){
		item.habilidadActivable(self)
	}
}
