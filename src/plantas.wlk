class Planta {
	const property fechaObtencion
	var altura
	method altura()=altura
	method horasDeSol()
	method esFuerte()= self.horasDeSol()>=10
	method daNuevasSemillas()= self.esFuerte()
	method espacioQueOcupa()
	method esParcelaIdeal(unaParcela)
	
}

class Menta inherits Planta {
	override method horasDeSol()=6
	 override method daNuevasSemillas()=super() or altura>0.4
	 override method espacioQueOcupa()=altura*3
	 override method esParcelaIdeal(unaParcela)= unaParcela.superficie()>6
}

class Soja inherits Planta{
	override method horasDeSol(){
		if(altura < 0.5){
			return 6
		}else if(altura<1){
			return 7
		}else{
			return 9
		}
	}
	override method daNuevasSemillas()=super() or self.condicionPropia()
	method condicionPropia()= fechaObtencion>2007 and altura>1	
	override method espacioQueOcupa()=altura/2
	override method esParcelaIdeal(unaParcela)= unaParcela.horasDeSol()==self.horasDeSol()
}

class Quinoa inherits Planta{
	const horasDeSol
	override method horasDeSol()= horasDeSol
	override method espacioQueOcupa()=0.5
	override method daNuevasSemillas()=super() or fechaObtencion<2005 
	override method esParcelaIdeal(unaParcela)= not unaParcela.hayAlgunaMayorA(1.5)
}

class SojaTransgenica inherits Soja{
	override method daNuevasSemillas()= false
	override method esParcelaIdeal(unaParcela)=unaParcela.cantidadMaxima()==1
}
class Hierbabuena inherits Menta{
	override method espacioQueOcupa()= super()*2
}
