//
//  Models.swift
//  indesign-scripts
//
//  Created by Yehuda Neufeld on 24/03/2022.
//

struct Script: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: String
    let finalPrice: String
    let onSale: Bool
    let isFree: Bool
    let fileSize: Int
    let compatibility: String
    let coverImage: String
    // let screenshots: [String]
    let updated_at: String
    let excerpt: String
    let version: String
}
