//
//  Transaction.swift
//  MiniBankingApp
//
//  Created by Arnas Sleivys on 2021-09-20.
//

import Foundation

struct Transaction: Decodable {

    let transactionId: String
    let counterPartyName: String
    let type: String
    let amount: String
    let transactionDescription: String
    let date: String

    enum CodingKeys: String, CodingKey {
        case transactionId = "id"
        case counterPartyName
        case type
        case amount
        case transactionDescription = "description"
        case date
    }

    init(from decoder: Decoder) throws {
        let transactionContainer = try decoder.container(keyedBy: CodingKeys.self)

        transactionId = try transactionContainer.decode(String.self, forKey: .transactionId)
        counterPartyName = try transactionContainer.decode(String.self, forKey: .counterPartyName)
        type = try transactionContainer.decode(String.self, forKey: .type)
        amount = try transactionContainer.decode(String.self, forKey: .amount)
        transactionDescription = try transactionContainer.decode(String.self, forKey: .transactionDescription)
        date = try transactionContainer.decode(String.self, forKey: .date)
    }
}
