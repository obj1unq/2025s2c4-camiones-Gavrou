//Las cosas
object knightRider {
	const unidades = 1
	method peso() = unidades * 500
	method nivelPeligrosidad() = 10
	method bultos() = 1
	method accidentarse() {}
}

object arenaAGranel {
	var unidades = 0
	method kilos(kg) {
		unidades = unidades + kg
		return unidades
	}
	method peso() = unidades
	method nivelPeligrosidad() = 1
	method bultos() = 1
	method accidentarse() = unidades + 20
}

object bumblebee {
	var robot = true
	const unidades = 1
	method modoRobot() {
		robot = false
		return robot
	}
	method peso() = unidades * 800
	method nivelPeligrosidad() {
		var nivel = 30
		if (not(robot)) {
			nivel = 30
		}
		return nivel
	}
	method bultos() = 2
	method accidentarse() = self.modoRobot()
}

object paqueteDeLadrillos {
	var unidades = 0
	method kilos(kg) {
		unidades = unidades + kg
		return unidades
	}
	method peso() = unidades * 2
	method nivelPeligrosidad() = 2
	method bultos() = ((unidades - 1) / 100).floor() + 1
	method accidentarse() {
		if (unidades < 0) {
			return 0
		}
		else {
			return unidades - 12
		}
	}
}

object bateriaAntiaerea {
	var armado = true
	const unidades = 1
	method descargarBateria() {
		armado = false
		return armado
	}
	method peso() {
		var kg = unidades * 300
		if (armado) {
			kg = unidades * 200
		}
		return kg
	}
	method nivelPeligrosidad() {
		var nivel = 0
		if (armado) {
			nivel = 100
		}
		return nivel
	}
	method bultos() {
		var cantidad = 1
		if (armado) {
			cantidad = 2
		}
	}
	method accidentarse() = self.descargarBateria()
}

object residuosRadioactivos {
	var unidades = 0
	method kilos(kg) {
		unidades = unidades + kg
		return unidades
	}
	method peso() = unidades
	method nivelPeligrosidad() = 200
	method bultos() = 1
	method accidentarse() = unidades + 15
}

object contenedorPortuario {
	var contiene = []
	var unidades = 100
	method kilos(kg) {
		unidades = unidades + (contiene.map({elem => elem.peso()})).sum()
		return unidades
	}
	method peso() = unidades
	method nivelPeligrosidad() {
		if (contiene.isEmpty()) {
			return 0
		}
		else {
			(contiene.map({elem => elem.nivelPeligrosidad()})).max()
		}
	}
	method carga(objeto) {
		if (not(contiene.contains(objeto))) {
			contiene.add(objeto)
		}
		else {
			return "Este objeto ya está incluido."
		}
	}
	method descarga(objeto) {
		if (contiene.contains(objeto)) {
			contiene.remove(objeto)
		}
		else {
			return "Este objeto no está incluido."
		}
	}
	method objetosCargados() {
		if (contiene.isEmpty()) {
			return "El contenedor está vacío."
		}
		else {
			return "El contenedor lleva: " + contiene
		}
	}
	method bultos() = (contiene.map({elem => elem.bultos()})).sum() + 1
	method accidente() {
		contiene.forEach({elem => elem.accidentarse()})
	}
}

object embalajeDeSeguridad {
	var envuelve = []
	var unidades = 0
	method kilos(kg) {
		unidades = unidades + (envuelve.map({elem => elem.peso()})).sum()
		return unidades
	}
	method peso() = unidades
	method nivelPeligrosidad() {
		if (envuelve.isEmpty()) {
			return 0
		}
		else {
			(envuelve.map({elem => elem.nivelPeligrosidad()})) / 2
		}
	}
	method carga(objeto) {
		if (not(envuelve.contains(objeto))) {
			envuelve.add(objeto)
		}
		else {
			return "Este objeto ya está envuelto."
		}
	}
	method descarga(objeto) {
		if (envuelve.contains(objeto)) {
			envuelve.remove(objeto)
		}
		else {
			return "Este objeto no está envuelto."
		}
	}
	method objetosCargados() {
		if (envuelve.isEmpty()) {
			return "El embalaje está vacío."
		}
		else {
			return "El embalaje tiene: " + envuelve
		}
	}
	method bultos() = 2
	method accidentarse() {}
}
