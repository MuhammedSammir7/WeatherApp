//
//  ViewController.swift
//  WeatherApp
//
//  Created by ios on 16/02/2024.
//

import UIKit
import Alamofire

class MainVC: UIViewController {
    
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var pressureLbl: UILabel!
    @IBOutlet weak var loaderActivityIndecator: UIActivityIndicatorView!
    var cityId = "361058"
    @IBOutlet weak var cityNameLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self,selector: #selector(cityChosed), name: NSNotification.Name(rawValue:"cityNameChanged"), object: nil)
        ApiRequest()
        
        
    }
}


extension MainVC {
    func ApiRequest(){
        let prams = ["id": cityId, "appid": "55a35a027df386a4fcdba69bcb984b06"]
        loaderActivityIndecator.isHidden = false
        loaderActivityIndecator.startAnimating()
        AF.request("https://api.openweathermap.org/data/2.5/weather", parameters: prams, encoder: URLEncodedFormParameterEncoder.default).responseJSON { response in
            if let result = response.value {
                let jsonDictionary = result as! NSDictionary
                let main = jsonDictionary["main"] as! NSDictionary
                var temp = main["temp"] as! Double
                var humidity = main["humidity"] as! Int
                var pressure = main["pressure"] as! Int
                temp = temp - 273.15
                self.loaderActivityIndecator.stopAnimating()
                self.loaderActivityIndecator.isHidden = true
                self.temperatureLbl.text = "\((Int)(temp))°c"
                self.humidityLbl.text = "\(humidity)°"
                self.pressureLbl.text = "\(pressure)°"
                
                
            }
        }
    }
    
    @objc func cityChosed(notification: Notification){
        if let city = notification.userInfo?["city"] as? City {
            self.cityNameLbl.text = city.name
            self.cityId = city.id
            ApiRequest()
        }
    }
    
}
