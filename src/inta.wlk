import parcelas.*
object inta{
	const parcelas= #{}
	
	method agregarParcela(unaParcela){parcelas.add(unaParcela)}
	method promedioDePlantas()= self.cantidadDePlantasInta()/self.cantidadDeParcelasInta()
	method cantidadDePlantasInta()=parcelas.sum({p=>p.cantidadDePlantas()})
	method cantidadDeParcelasInta()=parcelas.size()
	method parcelaMasAutoSustentable()=self.parcelasConMasDeCantidadDePlantas(4).max({p=>p.cantidadPlantasBienAsociadas()})
	method parcelasConMasDeCantidadDePlantas(cantidad)=parcelas.filter({p=>p.cantidadDePlantas()>cantidad})
}