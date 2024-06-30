//
//  String+Extensions.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/29/24.
//

import CryptoKit
import Foundation

extension String {
    func md5() -> String {
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
}
