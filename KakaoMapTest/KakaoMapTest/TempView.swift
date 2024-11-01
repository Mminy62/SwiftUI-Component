////
////  TempView.swift
////  KakaoMapTest
////
////  Created by 이민영 on 10/17/24.
////
//
//import SwiftUI
//import CoreLocation
//import KakaoMapsSDK
//
//struct TempView: View {
//    //    @EnvironmentObject var locationManager: LocationManager
//    @State var draw: Bool = false   //뷰의 appear 상태를 전달하기 위한 변수.
//    var body: some View {
//        KakaoMapView(draw: $draw)
//            .onAppear {
//                self.draw = true
//            }
//            .onDisappear {
//                self.draw = false
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//        
//    }
//}
//
//#Preview {
//    TempView()
//}
//
//struct KakaoMapView: UIViewRepresentable {
//    @EnvironmentObject var locationManager: LocationManager
//    @Binding var draw: Bool
//    
//    func makeUIView(context: Self.Context) -> KMViewContainer {
//        //need to correct view size
//        let view: KMViewContainer = KMViewContainer(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
//        context.coordinator.createController(view)
//        
//        return view
//    }
//
//    /// Updates the presented `UIView` (and coordinator) to the latest
//    /// configuration.
//    func updateUIView(_ uiView: KMViewContainer, context: Self.Context) {
//        print("updating UIVIew", locationManager.userLocation)
//        if draw {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                if context.coordinator.controller?.isEnginePrepared == false {
//                    context.coordinator.controller?.prepareEngine()
//                }
//                
//                if context.coordinator.controller?.isEngineActive == false {
//                    context.coordinator.controller?.activateEngine()
//                }
//            }
//        }
//        else {
//            context.coordinator.controller?.pauseEngine()
//            context.coordinator.controller?.resetEngine()
//        }
//    }
//    
//    func makeCoordinator() -> KakaoMapCoordinator {
//        return KakaoMapCoordinator(locationManager: locationManager)
//    }
//
//    /// Cleans up the presented `UIView` (and coordinator) in
//    /// anticipation of their removal.
//    static func dismantleUIView(_ uiView: KMViewContainer, coordinator: KakaoMapCoordinator) {
//        coordinator.controller?.resetEngine()
//    }
//    
//    class KakaoMapCoordinator: NSObject, MapControllerDelegate {
//        var locationManager: LocationManager
//        init(locationManager: LocationManager) {
//            self.locationManager = locationManager
//            first = true
//            auth = false
//            super.init()
//            registerNotifications()
//        }
//        
//        func createController(_ view: KMViewContainer) {
//            container = view
//            controller = KMController(viewContainer: view)
//            controller?.delegate = self
//        }
//        
//        func addViews() {
//            let defaultPosition: MapPoint = MapPoint(longitude: locationManager.userLocation.longitude, latitude: locationManager.userLocation.latitude)
//            let mapviewInfo: MapviewInfo = MapviewInfo(viewName: "mapview", viewInfoName: "map", defaultPosition: defaultPosition)
//            
//            controller?.addView(mapviewInfo)
//        }
//        
//        func addViewSucceeded(_ viewName: String, viewInfoName: String) {
//            print("OK")
//            let view = controller?.getView("mapview")
//            view?.viewRect = container!.bounds
//        }
//        
//        func containerDidResized(_ size: CGSize) {
//            let mapView: KakaoMap? = controller?.getView("mapview") as? KakaoMap
//            mapView?.viewRect = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: size)
//            if first {
//                let cameraUpdate: CameraUpdate = CameraUpdate.make(target: MapPoint(longitude: 126.978365, latitude: 37.566691), mapView: mapView!)
//                mapView?.moveCamera(cameraUpdate)
//                first = false
//            }
//        }
//        
//        func authenticationSucceeded() {
//            auth = true
//        }
//        
//        // MARK: NotificationCenter 등록
//        func registerNotifications() {
//            NotificationCenter.default.addObserver(forName: NSNotification.Name("moveCurrentLocation"), object: nil, queue: .main) { notification in
//                print("Notifications", type(of: notification.object))
//                if let location = notification.object as? CLLocationCoordinate2D {
//                    print(location)
//                    self.moveCameraToLocation(location)
//                }
//            }
//        }
//        
//        // MARK: NotificationCenter 해제
//        func removeNotifications() {
//            NotificationCenter.default.removeObserver(self, name: NSNotification.Name("moveCurrentLocation"), object: nil)
//        }
//        
//        
//        // MARK: 카메라를 특정 위치로 이동하는 함수
//        func moveCameraToLocation(_ location: CLLocationCoordinate2D) {
//            print("in Camera Function")
//            let view = controller?.getView("mapview") as? KakaoMap
//            let targetPoint = MapPoint(longitude: location.longitude, latitude: location.latitude)
//            
//            if let mapView = view {
//                let cameraUpdate = CameraUpdate.make(target: targetPoint, mapView: mapView)
//                mapView.moveCamera(cameraUpdate)
//                print("moving!!!")
//            }
//        }
//        
//        var controller: KMController?
//        var container: KMViewContainer?
//        var first: Bool
//        var auth: Bool
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        KakaoMapView(draw: .constant(false))
//    }
//}
//
//
//
////                    if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
////                        print("image downloading??")
////
////                        let iconStyle1 = PoiIconStyle(symbol: UIImage(named: "defaultMarker")?.resized(toMaxWidth: 25, maxHeight: 25), anchorPoint: CGPoint(x: 0.0, y: 0.0))
////                        let iconStyle2 = PoiIconStyle(symbol: image.resized(toMaxWidth: 25, maxHeight: 25), anchorPoint: CGPoint(x: 0.0, y: 0.0))
////                        let poiStyle = PoiStyle(styleID:"CustomStyle_\(character.id)", styles: [
////                            PerLevelPoiStyle(iconStyle: iconStyle1, level: 0),
////                            PerLevelPoiStyle(iconStyle: iconStyle2, level: 12)
////                        ])
////
////                        manager.addPoiStyle(poiStyle)
////                        print("add marker")
////                    }
