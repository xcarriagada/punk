//
//  BeerDetailViewModelTest.swift
//  PunkTests
//
//  Created by Ximena Arriagada on 19/11/2022.
//

import Foundation
import Quick
import Nimble

@testable import Punk

class BeerDetailViewModelTest: QuickSpec {
    
    override func spec() {
        
        describe("Given a search by Beer Id") {
            
            var fetchDataIsFinishedWasCalled: Bool = false
            var showErrorWasCalled: Bool = false
            
            afterEach {
                fetchDataIsFinishedWasCalled = false
                showErrorWasCalled = false
            }
            
            context("When is successfully") {
                it("Then should get de result") {
                    let service = BeerFinderServiceMock(withStatus: .success)
                    let viewModel = BeerDetailViewModel(withBeerId: 3, service: service)
                    
                    viewModel.fetchDataIsFinished = {
                        fetchDataIsFinishedWasCalled = true
                    }
                    
                    viewModel.showError = {
                        showErrorWasCalled = true
                    }
                    
                    viewModel.fetchData()
                    
                    expect(viewModel.beerId).to(equal(3))
                    expect(viewModel.imageURL).toNot(beNil())
                    expect(viewModel.name).to(equal("Berliner Weisse With Yuzu - B-Sides"))
                    expect(viewModel.description).to(equal("Japanese citrus fruit intensifies the sour nature of this German classic."))
                    expect(viewModel.tagline).to(equal("Japanese Citrus Berliner Weisse."))
                    expect(viewModel.abv).to(equal("ABV: 4.2"))
                    expect(viewModel.ibu).to(equal("IBU: 8.0"))
                    expect(viewModel.ebc).to(equal("EBC: 8.0"))
                    expect(viewModel.ingredients.count).to(equal(3))
                    expect(viewModel.foods.count).to(equal(3))
                    expect(viewModel.tips).to(equal("Clean everything twice. All you want is the clean sourness of lactobacillus."))
                    
                    expect(fetchDataIsFinishedWasCalled).to(beTrue())
                    expect(showErrorWasCalled).to(beFalse())
                }
            }
            
            context("when is unsuccessfully") {
                it("then shouldn't result and should alert error") {
                    let service = BeerFinderServiceMock(withStatus: .error)
                    let viewModel = BeerDetailViewModel(withBeerId: 44, service: service)
                    
                    viewModel.fetchDataIsFinished = {
                        fetchDataIsFinishedWasCalled = true
                    }
                    
                    viewModel.showError = {
                        showErrorWasCalled = true
                    }
                    
                    viewModel.fetchData()
                    
                    expect(viewModel.beerId).to(equal(44))
                    expect(viewModel.beer).to(beNil())
                    
                    expect(fetchDataIsFinishedWasCalled).to(beFalse())
                    expect(showErrorWasCalled).to(beTrue())
                }
            }
        }
    }
}
