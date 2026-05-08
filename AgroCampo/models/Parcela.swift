//
//  Parcela.swift
//  AgroCampo
//
//  Created by Marco Chunga 5F 20261 on 08/05/26.
//

// Models/Parcela.swift
import Foundation

enum Cultivo: String, CaseIterable, Codable {
    case cafe   = "Café"
    case cacao  = "Cacao"
    case papa   = "Papa"
    case maiz   = "Maíz"
    case otro   = "Otro"
}

enum EstadoCampana: String, CaseIterable, Codable {
    case preparacion  = "En preparación"
    case sembrado     = "Sembrado"
    case desarrollo   = "En desarrollo"
    case cosechado    = "Cosechado"
    
    var color: String { // nombre para UIColor después
        switch self {
        case .preparacion: return "systemGray"
        case .sembrado:    return "systemBlue"
        case .desarrollo:  return "systemGreen"
        case .cosechado:   return "systemOrange"
        }
    }
}

struct Campana: Codable, Identifiable {
    var id: UUID = UUID()
    var fechaSiembra: Date
    var fechaEstimadaCosecha: Date
    var cantidadEstimadaKg: Double
    var estado: EstadoCampana
}

struct Parcela: Codable, Identifiable {
    var id: UUID = UUID()
    var nombre: String
    var cultivo: Cultivo
    var areaHectareas: Double
    var departamento: String
    var provincia: String
    var campanas: [Campana] = []
    
    // Composición: Parcela "contiene" sus Campañas
    var campanaActiva: Campana? {
        campanas.last(where: { $0.estado != .cosechado })
    }
}
