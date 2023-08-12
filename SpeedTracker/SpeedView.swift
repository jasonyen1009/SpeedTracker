//
//  SpeedView.swift
//  SpeedTracker
//
//  Created by Yen Hung Cheng on 2023/8/6.
//

//import SwiftUI
//import CoreLocation
////import Combine
//
//class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
//
//    private let locationManager = CLLocationManager()
//    @Published var speedInMetersPerSecond: Double = 0.0
//    @Published var speedInKmPerHour: Double = 0.0
//
//
//    override init() {
//        super.init()
//
//        self.locationManager.delegate = self
//        self.locationManager.requestWhenInUseAuthorization()
//        self.locationManager.startUpdatingLocation()
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        // 获取最新的位置信息
//        if let location = locations.last {
//            // 获取速度
//            let speed = location.speed
//            self.speedInMetersPerSecond = speed
//            self.speedInKmPerHour = speed * 3.6
//        }
//    }
//}
//
//struct SpeedView: View {
//    @ObservedObject var locationManager = LocationManager()
//
////    var speed: Double {
////            locationManager.speedInKmPerHour
////    }
//
//    @Binding var tt: String
//
//    var speed: String {
//        String(format: "%.2f", locationManager.speedInKmPerHour)
//    }
//
//    var body: some View {
//        VStack {
////            Text("當前速度: \(locationManager.speedInMetersPerSecond, specifier: "%.2f") 米/秒")
//            Text("當前速度: \(locationManager.speedInKmPerHour, specifier: "%.2f") 公里/小時")
//
//            Text("\(speed)")
//        }
//        .padding()
//
//    }
//}
//
//
//struct SpeedView_Previews: PreviewProvider {
//    static var previews: some View {
//        SpeedView(tt: .constant("0"))
//    }
//}

//import SwiftUI
//import MapKit
//
//class MappViewModel: ObservableObject {
//    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.500702, longitude: -0.124562), latitudinalMeters: 1000, longitudinalMeters: 1000)
//}
//
//
//struct MapView: View {
//    @StateObject private var viewModel = MappViewModel()
//
//    var body: some View {
//        VStack {
//            Map(coordinateRegion: $viewModel.region)
//                .ignoresSafeArea()
//        }
//    }
//}



import SwiftUI
import MapKit
import CoreLocation



//struct MappView: View {
//
//    @StateObject private var locationManager = LocationManager()
//    @State private var region: MKCoordinateRegion
//
//    init() {
//        // 初始化 region
//        _region = State(initialValue: MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: 51.500702, longitude: -0.124562),
//            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
//        ))
//    }
//
//    var body: some View {
//        Map(coordinateRegion: $region, showsUserLocation: true)
//            .onAppear {
//                locationManager.requestAuthorization()
//                locationManager.startUpdatingLocation()
//            }
//
//            .onChange(of: locationManager.location) { newLocation in
//                if let newLocation = newLocation?.coordinate {
//                    DispatchQueue.main.async {
//                        region.center = newLocation
//                    }
//                }
//            }
//
//            .onDisappear {
//                locationManager.stopUpdatingLocation()
//            }
//    }
//}




struct MapTestView3: View {
    
    @State var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.3769, longitude: 8.5417), latitudinalMeters: 2000, longitudinalMeters: 2000)
    
    @State var tracking = MapUserTrackingMode.follow // 初始值改為 follow
    
    @StateObject private var locationManager = LocationManager()

    // 目前的時速
    var mySpeed: Int = 0
    
    var speed: String {
        String(format: "%.0f", locationManager.speedInKmPerHour)
    }
    
    var latitude: String {
        locationManager.latitude
    }
    
    var longitude: String {
        locationManager.longitude
    }
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: $tracking)
                .task {
                    locationManager.requestAuthorization()
                    locationManager.startUpdatingLocation() // 啟動位置更新
                    tracking = .follow // 在初始畫面上開始追蹤
                }
                .ignoresSafeArea()
            
            HStack {
                SpeedViewModel(frameHeight: 150, angle: 220.0 + Double(2 * (Double(speed) ?? 0.0)) - 0.0, speedText: speed)
                    .frame(height: 150)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("latitude : \n\(latitude)")
                    Text("longitude : \n\(longitude)")
                }
                .frame(maxWidth: 400, alignment: .leading)
                .font(.title3)
            }

            
            
        }
    }
}


struct MapTestView3_Previews: PreviewProvider {
    static var previews: some View {
        MapTestView3()
    }
}
