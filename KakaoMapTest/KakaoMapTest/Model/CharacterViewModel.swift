//
//  CharacterViewModel.swift
//  KakaoMapTest
//
//  Created by 이민영 on 10/12/24.
//

import Foundation
import Alamofire
 
class CViewModel: ObservableObject {
    private let url = "https://kmasgmt.mockable.io/pokemons"
    
    @Published var characters: [Character] = [] // @Published를 사용하여 데이터 변경 시 뷰에 알림

   // 데이터를 가져오는 함수
   func fetchData() {
       AF.request(url, method: .get, parameters: nil)
           .validate(statusCode: 200..<300)
           .responseDecodable(of: [Character].self) { response in
               switch response.result {
               case .success(let result):
                   DispatchQueue.main.async {
                       self.characters = result // 성공 시 데이터를 업데이트
                   }
               case .failure(let error):
                   print("Error: \(error)")
               }
           }
   }
    
//    func handleNetworkError(_ error: AFError) {
//        switch error {
//        case .sessionTaskFailed(let sessionError):
//            if let urlError = sessionError as? URLError {
//                switch urlError.code {
//                case .notConnectedToInternet:
//                    print("인터넷에 연결되어 있지 않습니다.")
//                case .timedOut:
//                    print("요청이 시간 초과되었습니다.")
//                case .cannotFindHost:
//                    print("호스트를 찾을 수 없습니다.")
//                default:
//                    print("알 수 없는 네트워크 오류: \(urlError.localizedDescription)")
//                }
//            } else {
//                print("세션 오류 발생: \(sessionError.localizedDescription)")
//            }
//            
//        default:
//            print("기타 오류 발생: \(error.localizedDescription)")
//        }
//    }

}

