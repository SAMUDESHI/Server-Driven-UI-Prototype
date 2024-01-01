//
//  PetListViewModel.swift
//  PetsUI
//
//  Created by Mishal_Office_Mac on 30/12/23.
//

import Foundation

class PetListViewModel: ObservableObject{
    
    private var service : WebService
    
    init(service: WebService){
        self.service = service
    }
    
    func load() async{
        do{
            let screenModel = try await service.load(resource: Constant.Urls.petListing)
        }catch{
            print(error)
        }
    }
}
