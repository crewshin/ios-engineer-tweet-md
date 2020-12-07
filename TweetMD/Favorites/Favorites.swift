//
//  Favorites.swift
//  TweetMD
//
//  Created by Gene Crucean on 12/7/20.
//  Copyright © 2020 Doximity. All rights reserved.
//

import Foundation

protocol FavoritesContract {
    var favorites: Set<Int> { get }
    func saveOrRemoveFavorite(id: Int)
    func isFavorite(id: Int) -> Bool
}

class Favorites: FavoritesContract {
    
    var favorites: Set<Int> = []
    
    func saveOrRemoveFavorite(id: Int) {
        if favorites.contains(id) {
            favorites.remove(id)
        } else {
            favorites.insert(id)
        }
    }
    
    func isFavorite(id: Int) -> Bool {
        return favorites.contains(id)
    }
}
