//
//  ViewController.swift
//  MapDirections
//
//  Created by Hugo Flores Perez on 4/20/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    private let addressField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let getDirectionsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get Directions",for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(onGetDirectionsPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    private let headerSView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.isLayoutMarginsRelativeArrangement = true
        stack.spacing = 8
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return stack
    }()
    
    private let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Directions"
        //myLabel.text = "Hola"
        setUpView()
        setUpLocationManager()
    }
    
    func setUpView() {
        view.backgroundColor = .white
        headerSView.addArrangedSubview(addressField)
        headerSView.addArrangedSubview(getDirectionsButton)
        view.addSubview(headerSView)
        view.addSubview(mapView)
        setUpLayout()
    }

    func setUpLayout() {
        headerSView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerSView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerSView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        mapView.topAnchor.constraint(equalTo: headerSView.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setUpLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    @objc func onGetDirectionsPressed(sender: UIButton) {
        getAddress()
    }
    
    func getAddress() {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(addressField.text!) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
            else {
                print("No Location found")
                return
            }
            print(location)
        }
    }

}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }
}

