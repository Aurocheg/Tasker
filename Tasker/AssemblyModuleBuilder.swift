//
//  AssemblyModuleBuilder.swift
//  Tasker
//
//  Created by Aurocheg on 6.11.22.
//

import UIKit

protocol AssemblyBuilderProtocol {
    // MARK: - Onboarding
    func createOnboardingModule(router: RouterProtocol) -> UIPageViewController
    
    // MARK: - Authorization
    func createSignUpModule(router: RouterProtocol) -> UIViewController
    func createSignInModule(router: RouterProtocol) -> UIViewController
    func createForgotPasswordModule(router: RouterProtocol) -> UIViewController
    func createOTPModule(router: RouterProtocol) -> UIViewController
    func createResetPasswordModule(router: RouterProtocol) -> UIViewController
    func createWorkspaceModule(router: RouterProtocol) -> UIViewController
    func createChoosePlanModule(router: RouterProtocol) -> UIViewController
    
    // MARK: - Main
    func createTabBarModule(router: RouterProtocol) -> UITabBarController
    func createHomeModule(router: RouterProtocol) -> UIViewController
    func createChatModule(router: RouterProtocol) -> UIViewController
    func createNotificationModule(router: RouterProtocol) -> UIViewController
    func createSettingsModule(router: RouterProtocol) -> UIViewController
}

final class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    // MARK: - Onboarding
    func createOnboardingModule(router: RouterProtocol) -> UIPageViewController {
        let view = OnboardingViewController()
        let presenter = OnboardingPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    // MARK: - Authorization
    func createSignUpModule(router: RouterProtocol) -> UIViewController {
        let view = SignUpViewController()
        let presenter = SignUpPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createSignInModule(router: RouterProtocol) -> UIViewController {
        let view = SignInViewController()
        let presenter = SignInPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createForgotPasswordModule(router: RouterProtocol) -> UIViewController {
        let view = ForgotPasswordViewController()
        let presenter = ForgotPasswordPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createOTPModule(router: RouterProtocol) -> UIViewController {
        let view = OTPViewController()
        let presenter = OTPPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createResetPasswordModule(router: RouterProtocol) -> UIViewController {
        let view = ResetPasswordViewController()
        let presenter = ResetPasswordPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createWorkspaceModule(router: RouterProtocol) -> UIViewController {
        let view = CreateWorkspaceViewController()
        let presenter = CreateWorkspacePresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createChoosePlanModule(router: RouterProtocol) -> UIViewController {
        let view = ChoosePlanViewController()
        let presenter = ChoosePlanPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    // MARK: - Main
    func createTabBarModule(router: RouterProtocol) -> UITabBarController {
        let tabBarController = TabBarController()
        
        let homeModule = createHomeModule(router: router)
        let chatModule = createChatModule(router: router)
        let notificationModule = createNotificationModule(router: router)
        let settingsModule = createSettingsModule(router: router)
        
        homeModule.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home"), tag: 0)
        chatModule.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "chat"), tag: 1)
        notificationModule.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "notification"), tag: 2)
        settingsModule.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "settings"), tag: 3)
        
        tabBarController.viewControllers = [homeModule, chatModule, notificationModule, settingsModule]
                
        return tabBarController
    }
    
    func createHomeModule(router: RouterProtocol) -> UIViewController {
        let view = HomeViewController()
        let presenter = HomePresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createChatModule(router: RouterProtocol) -> UIViewController {
        let view = ChatViewController()
        let presenter = ChatPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createNotificationModule(router: RouterProtocol) -> UIViewController {
        let view = NotificationViewController()
        let presenter = NotificationPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createSettingsModule(router: RouterProtocol) -> UIViewController {
        let view = SettingsViewController()
        let presenter = SettingsPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
}
