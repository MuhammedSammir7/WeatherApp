//
//  ChangeCityVC.swift
//  WeatherApp
//
//  Created by ios on 18/02/2024.
//

import UIKit

class ChangeCityVC: UIViewController {
    
    var citiesArray = [City(name: "Cairo",id: "360630"),
                       City(name: "Alexandria",id: "361058"),
                       City(name: "Sohag",id: "347796"),
                       City(name: "Asyut",id: "359783"),
                       City(name: "Sinai",id: "349401"),
                       City(name: "Al Minya",id: "360686"),
                       City(name: "Suez",id: "359796"),
                       City(name: "Aswan",id: "359792"),
                       City(name: "Bani Suwayf",id: "359173"),
                       City(name: "Port Said",id: "358619"),
                       City(name: "Damietta",id: "358048"),
                       City(name: "Bani Suwayf",id: "361320"),
                       City(name: "Kafr Al Shaykh",id: "354502"),
                       City(name: "Mersa Matruh",id: "352733"),
                       City(name: "Qina",id: "350550"),
                       City(name: "Sharm el-Sheikh",id: "349340"),
                       City(name: "Damanhur",id: "358448"),
                       City(name: "al Qalyūbīyah",id: "360621"),
                       City(name: "Luxor",id: "360502"),
                       City(name: "Al Khārijah",id: "360923"),
                       City(name: "Giza",id: "360995"),
                       City(name: "Ismailia",id: "361055"),
                       City(name: "Hurghada",id: "361291"),
                       City(name: "Al Fayyūm",id: "361320")
                      ]
    var selectedCity : City?
    
    @IBOutlet weak var pickCityPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pickCityPickerView.delegate = self
        pickCityPickerView.dataSource = self
    }
    
    @IBAction func choseCityButtonClicked(_ sender: Any) {
        if let city = selectedCity {
            NotificationCenter.default.post(name: NSNotification.Name("cityNameChanged"), object: nil, userInfo: ["city": city])
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
extension ChangeCityVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return citiesArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return citiesArray[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCity = citiesArray[row]
    }
}
