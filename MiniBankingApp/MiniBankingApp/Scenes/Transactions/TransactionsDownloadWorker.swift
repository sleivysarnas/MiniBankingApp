//
//  TransactionsDownloadWorker.swift
//  MiniBankingApp
//
//  Created by Arnas Sleivys on 2021-09-20.
//

import Alamofire

struct TransactionsDownloadWorker {

    private static let TransactionsEndpoint = "https://sheet.best/api/sheets/ebb5bfdc-efda-4966-9ecf-d2c171d6985a"

    typealias TransactionsDownloadCompletion = ([Transaction]?) -> Void

    private init() {}

    static func downloadTransactions(_ completion: @escaping TransactionsDownloadCompletion) {
        AF.request(TransactionsEndpoint).responseDecodable(of: [Transaction].self) { response in
            completion(response.value)
        }
    }
}
