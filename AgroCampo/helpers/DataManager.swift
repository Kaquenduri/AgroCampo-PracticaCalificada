//
//  DataManager.swift
//  AgroCampo
//
//  Created by Marco Chunga 5F 20261 on 08/05/26.
//

// Helpers/DataManager.swift
import Foundation


class DataManager {
    static let shared = DataManager()
    private let parcelasKey   = "parcelas_key"
    private let perfilKey     = "perfil_key"
    private let onboardingKey = "onboarding_completado"
    
    // MARK: - Onboarding
    // UserDefaults es el mecanismo correcto aquí porque:
    // es un flag booleano simple, no es dato de negocio,
    // persiste entre sesiones sin necesidad de base de datos.
    var onboardingCompletado: Bool {
        get { UserDefaults.standard.bool(forKey: onboardingKey) }
        set { UserDefaults.standard.set(newValue, forKey: onboardingKey) }
    }
    
    // MARK: - Parcelas
    func cargarParcelas() -> [Parcela] {
        guard let data = UserDefaults.standard.data(forKey: parcelasKey),
              let parcelas = try? JSONDecoder().decode([Parcela].self, from: data)
        else { return [] }
        return parcelas
    }
    
    func guardarParcelas(_ parcelas: [Parcela]) {
        if let data = try? JSONEncoder().encode(parcelas) {
            UserDefaults.standard.set(data, forKey: parcelasKey)
        }
    }
    
    // MARK: - Perfil
    func cargarPerfil() -> PerfilProductor {
        guard let data = UserDefaults.standard.data(forKey: perfilKey),
              let perfil = try? JSONDecoder().decode(PerfilProductor.self, from: data)
        else { return PerfilProductor(nombre: "", region: "", cooperativa: "") }
        return perfil
    }
    
    func guardarPerfil(_ perfil: PerfilProductor) {
        if let data = try? JSONEncoder().encode(perfil) {
            UserDefaults.standard.set(data, forKey: perfilKey)
        }
    }
}
