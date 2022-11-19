//
//  BeerFinderViewModelTest.swift
//  PunkTests
//
//  Created by Ximena Arriagada on 19/11/2022.
//

import Foundation
import Quick
import Nimble

@testable import Punk

class BeerFinderViewModelTest: QuickSpec {
    
    override func spec() {
        
        describe("Given a search") {
            
            var fetchDataIsFinishedWasCalled: Bool = false
            var noResultFoundWasCalled: Bool = false
            
            afterEach {
                fetchDataIsFinishedWasCalled = false
                noResultFoundWasCalled = false
            }
            
            context("When is successfully") {
                it("Then should get de results") {
                    let service = BeerFinderServiceMock(withStatus: .success)
                    let viewModel = BeerFinderViewModel(withService: service)
                    
                    viewModel.fetchDataIsFinished = {
                        fetchDataIsFinishedWasCalled = true
                    }
                    
                    viewModel.noResultFound = {
                        noResultFoundWasCalled = true
                    }
                    
                    viewModel.searchBeerFor(food: "chicken")
                    
                    guard let beers = viewModel.beers else {
                        fail("beers is not defined")
                        return
                    }
                    
                    expect(beers.count).to(equal(5))
                    
                    expect(viewModel.getIdForBeer(withIndex:0)).to(equal(1))
                    expect(viewModel.getNameForBeer(withIndex:0)).to(equal("Buzz"))
                    expect(viewModel.getTaglineForBeer(withIndex:0)).to(equal("A Real Bitter Experience."))
                    
                    expect(viewModel.getIdForBeer(withIndex:4)).to(equal(20))
                    expect(viewModel.getNameForBeer(withIndex:4)).to(equal("Rabiator"))
                    expect(viewModel.getTaglineForBeer(withIndex:4)).to(equal("Imperial Wheat Beer"))
                    
                    expect(fetchDataIsFinishedWasCalled).to(beTrue())
                    expect(noResultFoundWasCalled).to(beFalse())
                }
            }
            
            context("when is unsuccessfully") {
                it("then shouldn't results and should alert no result found") {
                    let service = BeerFinderServiceMock(withStatus: .error)
                    let viewModel = BeerFinderViewModel(withService: service)
                    
                    viewModel.fetchDataIsFinished = {
                        fetchDataIsFinishedWasCalled = true
                    }
                    
                    viewModel.noResultFound = {
                        noResultFoundWasCalled = true
                    }
                    
                    viewModel.searchBeerFor(food: "chicken")
                    
                    expect(fetchDataIsFinishedWasCalled).to(beFalse())
                    expect(noResultFoundWasCalled).to(beTrue())
                }
            }
        }
    }
}
