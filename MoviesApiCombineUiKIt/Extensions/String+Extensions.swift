//
//  String+Extensions.swift
//  MoviesApiCombineUiKIt
//
//  Created by Brian Surface on 11/29/24.
//

import Foundation


extension String {
    var urlEncoded: String? {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
}
