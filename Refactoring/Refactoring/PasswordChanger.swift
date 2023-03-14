//
//  PasswordChanger.swift
//  Refactoring
//
//  Created by Ayush Bhatt on 13/03/23.
//

import Foundation

private struct SuccessOrFailureTimer{
    let onSuccess: () -> Void
    let onFailure: (String) -> Void
    let timer: Timer
}

final class PasswordChanger{
    private static var pretendToSucceed = true
    private var successOrFailureTimer: SuccessOrFailureTimer?
    
    func change(securityToken: String, oldPassword: String, newPassword: String, onSuccess: @escaping () -> Void, onFailure: @escaping (String) -> Void){
        print("Initiate Password change sequence")
        print("Security code: \(securityToken)")
        print("Old password: \(oldPassword)")
        print("New password: \(newPassword)")
        successOrFailureTimer = SuccessOrFailureTimer(onSuccess: onSuccess, onFailure: onFailure, timer: Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { [weak self] _ in
            self?.callSuccessOrFailure()
        }))
    }
    
    func callSuccessOrFailure(){
        if PasswordChanger.pretendToSucceed{
            successOrFailureTimer?.onSuccess()
        }
        else{
            successOrFailureTimer?.onFailure("Sorry, something went wrong!")
        }
        PasswordChanger.pretendToSucceed.toggle()
        successOrFailureTimer?.timer.invalidate()
        successOrFailureTimer = nil
    }
}
