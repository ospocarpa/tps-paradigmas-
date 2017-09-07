// TP DE OBJETOS DE RECUPERACION
// MODELANDO LOS HUEVOS                          //oscar hinojoca campos
object huevoRepostero {
	
	method calorias() {
		return 750
	}
	method tieneChocoBlanco() {
		return true
	}
	
	method tieneChocoAmargo() {
		return false
	}
}
object huevoMixto {
	var chocoLeche=400
	var chocoBlanco=500
	method calorias() {
	        return chocoLeche + chocoBlanco 
	}
	method tieneChocoBlanco() {
		return true
	}
	
	method tieneChocoAmargo() {
		return false
	}
}
object conejoChoco {
	var peso=50
	method peso(kilos) {
	   peso=kilos
	}
	method calorias() {
		return 10*peso
	}
	method tieneChocoBlanco() {
		return false
	}
	method tieneChocoAmargo() {
		return true
	}	
}
object huevoBlister  {
	var huevos=0
     method calorias(huevosLeche) {
     	huevos =huevosLeche
     	return 100*huevosLeche + huevosLeche.div(5)*150
     	 }	
     method tieneChocoBlanco() {
     	return huevos>=5 
     }
     method tieneChocoAmargo() {
     	return false
     }
 }
 object matrioshka {
 	var base=3000
 	var huevoInterior = huevoMixto
 	var decoracion = arbol
 	method tieneChocoAmargo() {
     	return huevoInterior.tieneChocoAmargo()
     }
 	method huevoInterior(huevo) {
 		huevoInterior = huevo
 	}
 	method decoracion(deco) {
 		decoracion=deco
 	}
 	 method calorias() {

 	   return huevoInterior.calorias()+base+decoracion.calorias()
 	
 	       }
 	 }        
 object arbol{
 	method calorias() {
 	      return 150	
 	}
 }
 object flor {
 	var petalos =5
 	method cantPetalos(petalo) {
 		petalos =petalo
 	}
 	method calorias () {
 		
 		return petalos*100
 	}
 
 }
 // PERSONAJES 
 object tito {
 // a tito le gusta todo	
 	method leGusta(huevo) {
 		return true
 	}
 	method comer(huevo){
    }
   
    method enfermo(){
        return false       
    }
 	 
 }
 








object ana {
 	 var huevos = []
 	 
   method leGusta(huevo) {
   	 return !huevo.tieneChocoAmargo()
   }
     method comer(huevo){
        huevos.add(huevo)
    }
      method enfermo(){
        return self.totalCalorias() > 5000 or self.comioChocolateBlanco()
    }
     method totalCalorias(){
        return huevos.sum({h=>h.calorias()})
    }
    method comioChocolateBlanco() {
        return huevos.any({h=>h.tieneChocoBlanco()})
    }
    
 }
 object jose {
 	 var ultimoHuevo
     method leGusta(huevo) {
     	return huevo.tieneChocoBlanco() and huevo.calorias()< 400
     	
     }	
     method comer(huevo){
        ultimoHuevo = huevo
    }
    method enfermo(){
        return ultimoHuevo.tieneChocoAmargo()
    }
    
 }
 
 // JUEGO
 object juego{
    var huevosBuscados = []
   
    method agregarHuevos(huevos){
        huevosBuscados.addAll(huevos)
    }
   
    method cuantosFaltan(){
        return huevosBuscados.size()
    }
     method huevoEncontrado(personaje,huevo){
        personaje.comer(huevo)
        huevosBuscados.remove(huevo) }
    method encontrarPrimerHuevo(personaje){
        self.huevoEncontrado(personaje, huevosBuscados.first())
    }
    method encontrarHuevosRestantes(personaje){
        huevosBuscados.forEach({huevo => self.huevoEncontrado(personaje,huevo)})
    }
}
	



