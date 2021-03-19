//
//  LocationManager.swift
//  mapToAR
//
//  Created by 小島伊織 on 2021/03/19.
//

import MapKit

//現在地を取得するためのクラス
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    //ロケーションマネージャーを作る
    let manager = CLLocationManager()
    //領域の更新をパブリッシュする
    @Published var region = MKCoordinateRegion()
    
    override init() {
        super.init()
        manager.delegate = self //デリゲートの設定
        manager.requestWhenInUseAuthorization() //プライバシー設定の確認
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.distanceFilter = 2 //更新距離(m)
        manager.startUpdatingLocation() //追従を開始する
    }
    //領域の更新(デリゲートメソッド)
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //locationsの最後の様子に対して実行する
        locations.last.map {
            let center = CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude) //現在地を取得
            region = MKCoordinateRegion(center: center, latitudinalMeters: 1000.0, longitudinalMeters: 1000.0) //表示する領域の更新
        }
    }
}
