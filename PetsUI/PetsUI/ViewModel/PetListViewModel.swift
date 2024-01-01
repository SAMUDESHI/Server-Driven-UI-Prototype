//
//  PetListViewModel.swift
//  PetsUI
//
//  Created by Mishal_Office_Mac on 30/12/23.
//

import Foundation

@MainActor
class PetListViewModel: ObservableObject{
    
    private var service : WebService
    @Published var components: [UIComponents] = []
    
    init(service: WebService){
        self.service = service
    }
    
    func load() async{
        do{
            let screenModel = try await service.load(resource: Constant.Urls.petListing)
            components = try screenModel.buildComponents()
        }catch{
            print(error)
        }
    }
}
