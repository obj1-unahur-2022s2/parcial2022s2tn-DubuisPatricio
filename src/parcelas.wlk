/*
 * Otra solucion en el método hayAlgunaMayorA() podría ser con any()
 * Recordá que cuando lanzas un excepcion se corta el método por eso no es necesario poner el else en el método plantar(unaPlanta) 
 */
import plantas.*

class Parcela {
	const ancho
	const largo
	const  property horasDeSol
	const plantas = #{}
	
	method superficie()= ancho*largo
	method cantidadMaxima(){
		if (ancho>largo){
			return self.superficie()/5
		}
		else{
			return self.superficie()/3 + largo
		}
	}
    method tieneComplicaciones()=plantas.any({p=>p.horasDeSol()<horasDeSol})
    method plantar(unaPlanta){
    	if(self.seSuperaLaCantidadMaxima() or self.superaPorHorasLasQueTolera(2,unaPlanta)){
    		self.error("no se puede plantar")
    	}
    	plantas.add(unaPlanta)
    }
    method seSuperaLaCantidadMaxima()=self.cantidadDePlantas()>=self.cantidadMaxima()
	method superaPorHorasLasQueTolera(horasQueSupera,unaPlanta)=unaPlanta.horasDeSol()+horasQueSupera<horasDeSol
    method hayAlgunaMayorA(unaAltura)= plantas.max({p=>p.altura()}).altura()>unaAltura
    method seAsociaBien(unaPlanta)
    method cantidadDePlantas()=plantas.size()
    method cantidadPlantasBienAsociadas()= plantas.filter({p=>self.seAsociaBien(p)}).size()
}

class ParcelaEcologica inherits Parcela{
	override method seAsociaBien(unaPlanta)=not self.tieneComplicaciones() and unaPlanta.esParcelaIdeal(self)
}
class ParcelaIndustrial inherits Parcela{
	override method seAsociaBien(unaPlanta)=self.cantidadDePlantas()<=2 and unaPlanta.esFuerte()
}