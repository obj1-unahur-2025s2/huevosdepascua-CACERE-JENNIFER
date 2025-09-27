object huevoRepostero {
    method esDeChocolateBlanc0()= true
    method esDeChocolateAmargo()= false
    method calorias()= 750
}
object huevoMixto {
    method caloriasChocoBlanco()= 500
    method caloriasChocoLeche()= 400
    method calorias()= self.caloriasChocoBlanco() + self.caloriasChocoLeche()
    method esDeChocolateBlanc0()= true
    method esDeChocolateAmargo()= false
}

object conejo {
    var property peso= 2
     method esDeChocolateBlanc0()= false
     method esDeChocolateAmargo()= true
     method calorias()= peso *10
}

object blisterHuevitos {   
    var property huevitos = 3
     method esDeChocolateBlanc0()= huevitos>=5
     method esDeChocolateAmargo()= false
     method calorias()= huevitos *100 + huevitos.div(5)*150
}

object matrioshka {
  var property  huevosEnInterior= huevoMixto
   var property decoracion = flor
    method esDeChocolateBlanc0()= huevosEnInterior.esDeChocolateBlanc0()
    method esDeChocolateAmargo()= true
    method calorias()= 3000 + huevosEnInterior.calorias()+ decoracion.calorias()
}
object flor {
    var property petalos = 5
      method calorias()= petalos *100
}
object arbo{
    method calorias()=150
}
object ana{
  const huevosComidos = []
  method comer(unHuevo){ huevosComidos.add(unHuevo)}
    method estaEnfermo(){self.comioMasDe5000()|| self.hayAlgunoDeChocoBlanco() }
    method comioMasDe5000()= huevosComidos.sum({h => h.calorias()>5000 })
    method hayAlgunoDeChocoBlanco()= huevosComidos.any({h => h.esDeChocolateBlanc0()})
}
object jose{
    var ultimoHuevoComido = huevoMixto
    method comer(unHuevo){
        ultimoHuevoComido = unHuevo
    }
    method estaEnfermo()= ultimoHuevoComido.esDeChocolateAmargo()
}
object tito{
 method comer(unHuevo){}
 method estaEnfermo()=false
}
object caseria{
    const huevosEncontrados=[]
    const huevosNoEncontrados=[]

    method inicializarJuego(){
        flor.petalos(7)
        matrioshka.huevoEnSuInterior(blisterHuevitos)
        blisterHuevitos.huevitos(14)
        huevosEncontrados.addAll({matrioshka,
        huevoRepostero,conejo,huevoMixto})}

    method cantidadPorEncontrar()=huevosNoEncontrados.size()
    method cuantosConChocoBlanco()=huevosEncontrados.count({h => h.esDeChocoBlanc0()})

    method aunNoFueEncontrado(unHuevo)=huevoNoEncontrados.contains(unHuevo)

    method encontrarUnHuevoPor(unChico,unHuevo){
        unChico.comer(unHuevo)
        huevosNoEncontrados.remove(unHuevo)
        huevosEncontrados.add(unHuevo)
    }
    method encontrarPrimerHuevo(unChico){
        self.encontrarUnHuevoPor(unChico.huevosEncontrados.first())}
   
    method encontrarLosRestantes(unChico) {huevosNoEncontrados.forEach({h=>self.encontrarUnHuevoPor(unChico,h)})}
   
    method huevosFaltantesBlacos()=huevosNoEncontrados.filter({h=>h.esDeChocolateBlanc0()})
   
    method huevosNoEncontradosBlancos()=
    huevosNoEncontrados.filter({h=>h.esDeChocolateBlanc0()})
  
    method noEncontradoDeMayorCalo()=
    huevosNoEncontrados.max({h=>h.calorias()})
}

