//
//  Extensions.swift
//  MyMovies
//
//  Created by Богдан Бакун on 14.06.2023.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
