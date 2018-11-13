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
	
	method habilidadActivable(campeon){
		
	}
	method bonusAtaque(campeon){
		return 0
	}
	method bonusVida(campeon){
		return 0
	}
	
}

class ItemVidaAtaque inherits Item{
	override method meEquipa(campeon){
		campeon.danioAcumulado(campeon.danioAcumulado() + 5)
		
	}
	override method meDesequipa(campeon){
		campeon.danioAcumulado(campeon.danioAcumulado() - 10)
	}
	override method bonusAtaque(campeon){
		return 15
	}
	override method bonusVida(campeon){
		return 60
	}
	
}
		
class ItemBloqueo inherits  Item{
	var property usosHabilidad
	override method meEquipa(campeon){
		campeon.bloqueo(campeon.bloqueo() + 2)
	}
	
	override method meDesequipa(campeon){
		campeon.danioAcumulado(campeon.danioAcumulado() + 30)
		campeon.bloqueo(campeon.bloqueo() + 1)
	}
	
	override method habilidadActivable(campeon){
		if(usosHabilidad>0&& campeon.cantDinero()<500){
			usosHabilidad-=1
			campeon.cantDinero(500)
		}
	}
	override method bonusAtaque(campeon){
		
		return campeon.danioAcumulado() *0.05
		
	}
	override method bonusVida(campeon){
	
		return campeon.danioAcumulado() *0.25
		
	}
}

class ItemVariante inherits ItemBloqueo {
	
	
	override method precio(){
		return super()+100
	}
	
	override method meEquipa(campeon){
		campeon.bloqueo(campeon.bloqueo() + 2)
		campeon.danioAcumulado(campeon.danioAcumulado() + 5)
		
	}
	override method meDesequipa(campeon){
		
	}
	
	override method bonusVida(campeon){
		return super(campeon)+5
	
	}
	override method bonusAtaque(campeon){
		return campeon.baseAtaque()*2
	}
	

} 

class Pocion inherits Item{
	var property usosHabilidad
	override method habilidadActivable(campeon){
		if(usosHabilidad>0&&campeon.danioAcumulado()>50){
			usosHabilidad-=1
			campeon.danioAcumulado(campeon.danioAcumulado()-50)
	    }else if(usosHabilidad>0){
	    	usosHabilidad-=1
	    	campeon.danioAcumulado(0)
	    }
	    
	 }
	 
}
//parte individual
class ItemDelVacio inherits Item{
	
	var property materiales=[]
	
	
	override method habilidadActivable(campeon){
		materiales.forEach({item=>item.habilidadActivable(campeon)})
	}

	override method bonusVida(campeon){
		return materiales.sum({item=>item.bonusVida(campeon)})/2
	}
	override method bonusAtaque(campeon){
		return materiales.sum({item=>item.bonusAtaque(campeon)})
	}
	method agregarDesdeInventario(item,campeon){
		materiales.add(item)
		item.meDesequipa(campeon)
		self.meEquipa(campeon)
	}
	method agregarDesdeAfueraInventario(item,campeon){
		materiales.add(item)
		self.meEquipa(campeon)
	}
	method agregarMaterialSi(item,campeon){
		if(campeon.items().contains(item)){
			self.agregarDesdeInventario(item,campeon)
		}else{
			self.agregarDesdeAfueraInventario(item,campeon)
		}
	}
	
}
