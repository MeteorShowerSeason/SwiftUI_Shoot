//
//  LoginRequest.swift
//  SJShoot
//
//  Created by limo on 2019/12/18.
//  Copyright © 2019 limo. All rights reserved.
//
import SwiftUI
import SwiftyJSON

class LoginRequest: AsyncHttpsResponse {
    
    public static let LOGIN_ACCOUNT_TYPE = 1;//账号密码登录
    public static let LOGIN_VERIFY_TYPE = 2;//手机验证码登录+注册
    public static let LOGIN_WX_TYPE = 3;// 微信登录
    public static let LOGIN_TOKEN_TYPE = 4;//Token登录
    
    var type: Int = LoginRequest.LOGIN_VERIFY_TYPE

    var requestLogin: RequestLogin?
    var loginAttr: LoginAttr?

    init(requestLogin: @escaping RequestLogin, failture: @escaping RequestFailture){
        super.init(failture: failture)
        self.requestLogin = requestLogin
    }
    
    override func getResponseUrl() -> String {
        return LOGIN_URL
    }
    
    override func setResponseBody() {
        super.setResponseBody()
        if loginAttr == nil {
            return
        }
        nvps.updateValue(String(type), forKey: "type");
        switch type {
        case LoginRequest.LOGIN_VERIFY_TYPE://验证码登陆
            nvps.updateValue(loginAttr!.account, forKey: "phone")
            nvps.updateValue(loginAttr!.code, forKey: "code")
        case LoginRequest.LOGIN_TOKEN_TYPE://token登陆
            nvps.updateValue(loginAttr!.account, forKey: "phone");
            nvps.updateValue(UserDefaults.standard.string(forKey: "token")!, forKey: "Token");
        default:
            return
        }
    }
    
    override func parseResponse(json: JSON) {
        self.requestLogin!(json)
    }
    
    func setLoginAttr(loginAttr: LoginAttr) -> LoginRequest{
        self.loginAttr = loginAttr
        return self
    }
    
    func setType(type: Int) -> LoginRequest {
        self.type = type;
        return self
    }
}

typealias RequestLogin = (_ json: JSON) -> Void

struct LoginAttr {
    var account: String = "" //手机号
    var code: String = ""//验证码
}
