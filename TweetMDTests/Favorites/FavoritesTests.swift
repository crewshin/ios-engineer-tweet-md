//
//  FavoritesTests.swift
//  TweetMDTests
//
//  Created by Gene Crucean on 12/7/20.
//  Copyright © 2020 Doximity. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import TweetMD

class FavoritesTests: QuickSpec {

    override func spec() {
        
        let testFavorite = 12345
        
        context("save favorite") {
            let favorites = Favorites()
            favorites.saveOrRemoveFavorite(id: testFavorite)
            it("correctly saves the id as favorite") {
                expect(favorites.isFavorite(id: testFavorite)).to(beTrue())
            }
        }
        
        context("remove favorite") {
            let favorites = Favorites()
            favorites.saveOrRemoveFavorite(id: testFavorite)
            favorites.saveOrRemoveFavorite(id: testFavorite)
            it("correctly removes the id from favorites") {
                expect(favorites.isFavorite(id: testFavorite)).to(beFalse())
            }
        }
        
        context("no favorites") {
            let favorites = Favorites()
            it("correctly removes the id from favorites") {
                expect(favorites.isFavorite(id: testFavorite)).to(beFalse())
            }
        }
    }
}
