import cosas.*

object elCamion {
	var cargo = []
	const tara = 1000
	const capacidad = 2500
	method carga(objeto) {
		if (not(cargo.contains(objeto))) {
			cargo.add(objeto)
		}
		else {
			return "Este objeto ya está cargado."
		}
	}
	method descarga(objeto) {
		if (cargo.contains(objeto)) {
			cargo.remove(objeto)
		}
		else {
			return "Este objeto no está cargado."
		}
	}
	method objetosCargados() {
		if (cargo.isEmpty()) {
			return "El camión está vacío."
		}
		else {
			return "El camión transporta: " + cargo
		}
	}
	method pesoTotal() = tara + cargo.map({elem => elem.peso()}).sum()
	method todoPesoPar() = cargo.map({elem => elem.peso() % 2 == 0})
	method hayAlgunoQuePesa(cuanto) = cargo.any({elem => elem.peso() == cuanto})
	method capacidadExcedida() = self.pesoTotal() > capacidad
	method elDeNivel(peligrosidad) = cargo.find({elem => elem.nivelPeligrosidad() == peligrosidad})
	method cosasPeligrosas(nivel) = cargo.filter({elem => elem.nivelPeligrosidad() >= nivel})
	method puedeCircularEnRuta(nivel) = not(self.capacidadExcedida()) and self.cosasPeligrosas(nivel).isEmpty()
	method algoQuePesaEntre(min, max) = cargo.any({elem => elem.peso() >= min and elem.peso() <= max})
	method cosaMasPesada() {
		if (cargo.isEmpty()) {
			return "El camión está vacío."
		}
		else {
			return (cargo.max({elem => elem.peso()}))
		}
	}
	method pesos() = cargo.map({elem => elem.peso()})
	method accidente() {
		cargo.forEach({elem => elem.accidentarse()})
	}
	method transportar(destino, camino) {
		if (camino.puedeRecorrer()) {
			destino.depositar(cargo)
			cargo = []
		}
		else {
			throw "No se puede transportar."
		}
	}
}

object ruta9 {
	method puedeRecorrer() = elCamion.puedeCircularEnRuta(20)
}

object caminoVecinalMayor {
	const pesoMaximoPermitido = 2000
	method puedeRecorrer() = elCamion.pesoTotal() <= pesoMaximoPermitido
}

object caminoVecinalMenor {
	const pesoMaximoPermitido = 300
	method puedeRecorrer() = elCamion.pesoTotal() <= pesoMaximoPermitido
}

object almacen {
	var deposito = []
	method depositar(nuevo) {
		deposito = deposito + nuevo
	}
}