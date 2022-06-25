//
//  HomeViewModel.swift
//  PS_TASK
//
//  Created by NourAllah Ahmed on 20/06/2022.
//

import Foundation
import Network
protocol CategoryVMProtocol{
    func getCategory()
}
protocol ItemsVMProtocol{
    func getItems(categoryId: String)
}
class HomeViewModel : ObservableObject , CategoryVMProtocol {
    @Published var CategoryList = [Results]()
    var networkApiCategory : CategoryAPIProtocol = NetworkAPI()
    
    
    //TODO: Items Calling
    var networkApiItem : ItemsAPIProtocol = NetworkAPI()
    @Published var ItemsList = [ItemsResults]()

    //TODO: Internet
    @Published var NetworkState : Bool = true
    let queue = DispatchQueue(label: "InternetConnectionMonitor")
    let monitor = NWPathMonitor()
    
    func getCategory() {
        print("Entered")
     
        
        
        monitor.pathUpdateHandler = { [weak self] pathUpdateHandler  in
           

            if pathUpdateHandler.status == .satisfied {
                DispatchQueue.main.sync {
                    self?.NetworkState = true

                }
                self?.networkApiCategory.getCategoryDetails(completion: { result in
                    self?.CategoryList = try!  result.get()?.Results ?? []
                    print(self?.CategoryList.map{
                        $0.Name
                    })
                })
            }
            else{
                DispatchQueue.main.sync {
                    self?.NetworkState = false
                    print(pathUpdateHandler.status)
                }
            }
        }
        monitor.start(queue: queue)
    }
    
    
}

extension HomeViewModel : ItemsVMProtocol{
    func getItems(categoryId: String) {
        
        
        monitor.pathUpdateHandler = { [weak self] pathUpdateHandler  in
           

            if pathUpdateHandler.status == .satisfied {
                DispatchQueue.main.sync {
                    self?.NetworkState = true

                }
                self?.networkApiItem.getItemsDetails(Categoryid: categoryId , completion: { result in
                    self?.ItemsList = try!  result.get()?.itemsResults ?? []
                })
            }
            else{
                DispatchQueue.main.sync {
                    self?.NetworkState = false
                }
            }
        }
        monitor.start(queue: queue)
    }
}
