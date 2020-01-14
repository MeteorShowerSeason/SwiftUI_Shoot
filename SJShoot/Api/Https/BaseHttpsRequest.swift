//
//  BaseHttpsRequest.swift
//  SJShoot
//
//  Created by limo on 2019/12/18.
//  Copyright © 2019 limo. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON

class AsyncHttpsResponse{

    let baseNvps: [String: String] = ["versionName":"1.0","versionCode":"20191111","channel":"shiji","platform":"ios","project":"shoot"]
    
    public var nvps:[String: String] = [:]
    public var baseResponse = BaseResponse()
    public var headers: HTTPHeaders = []
    
    public var requestFailture: RequestFailture?
    
    init(failture: @escaping RequestFailture) {
        self.requestFailture = failture
    }

    //获取接口请求的链接
    func getResponseUrl() -> String {
        return ""
    }
    
    //设置接口请求的参数
    func setResponseBody() {
        nvps.removeAll()
    }
    
    func setResponseHeaders() {
        if UserDefaults.standard.string(forKey: "token") != nil {
            headers.add(name:"token", value: UserDefaults.standard.string(forKey: "token")!)
        }
    }
    
    //是否加载更多
    final func setLoadMore(isLoadMore: Bool){
        self.baseResponse.loadMore = isLoadMore
    }
    
    //设置请求标识
    final func setRequestType(requestType: Int){
        self.baseResponse.requestType = requestType
    }
    
    //Post请求
   public func executePost(){
        let url = BASE_URL + getResponseUrl()
        
        setResponseBody()
        setResponseHeaders()
        
        print(" ------------------------------- ")
        print(url)
        for item in nvps {
            print("key: \(item.key) -- value: \(item.value)")
        }
        print(" ----------------------------- ")
        
        //添加通用请求体
        for (key, value) in baseNvps {
            print(" setResponseBody key: \(key) -- value: \(value)")
            nvps.updateValue(value, forKey: key)
        }
        
        AF.request(url, method: .post, parameters: nvps, encoding: URLEncoding.default, headers: headers).responseJSON{
            (response) in
            
            switch response.result {
            case .success( _):
                print(response)
                    self.onSuccess(json: JSON(response.data!))
                
            case .failure(let error):
                let statusCode = response.response?.statusCode
                print("\(statusCode ?? 0) 请求失败")
                
                self.baseResponse.code = error.responseCode ?? -1
                self.baseResponse.msg = error.errorDescription ?? "未知错误"
                
                self.requestFailture!(self.baseResponse)
            }
        }
    }
    
    //请求成功 json解析处理
    private func onSuccess(json: JSON){

//        do{
            let code = json["code"].intValue
            let msg = json["msg"].stringValue
            self.baseResponse.code = code
            self.baseResponse.msg = msg
            
            print("code: \(code) ** msg: \(msg)")
            
            switch code {
            case 200://请求成功
                let result = json["result"].stringValue
                let jsonResult = JSON(result)
                self.parseResponse(json: jsonResult)
            default://请求失败
                self.requestFailture!(self.baseResponse)
            }
//        } catch {
//            self.requestFailture!(self.baseResponse)
//        }
    }
    
    func parseResponse(json: JSON) {
        
    }
    
}

typealias RequestFailture = (_ baseResponse: BaseResponse) -> Void

struct BaseResponse {
    var requestType: Int = 1
    var loadMore: Bool = false
    var code: Int = -1
    var msg: String = ""
}
