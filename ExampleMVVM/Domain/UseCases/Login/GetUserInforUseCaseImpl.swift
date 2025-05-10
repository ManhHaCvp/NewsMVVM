//
//  GetUserInforUseCaseImpl.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/23/25.
//

protocol GetUserInfoUseCase {
    func execute(completion: @escaping (Result<(Account, Bool), Error>) -> Void)
}

class GetUserInfoUseCaseImpl: GetUserInfoUseCase {
    private let inforRepository: UserInfoRepository

    init(inforRepository: UserInfoRepository) {
        self.inforRepository = inforRepository
    }

    func execute(completion: @escaping (Result<(Account, Bool), Error>) -> Void) {
        inforRepository.getUserInfo(completion: completion)
    }
}
