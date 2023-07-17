
import MustacheFoundation
import UIKit
import MustacheUIKit
import MustacheServices

import FloatingPanel
import Resolver

protocol ___FILEBASENAME___Type: CoordinatorType {
    
}

class ___FILEBASENAME___: NSObject, ___FILEBASENAME___Type {
    
    var baseController: UIViewController? { return self.navigationController }
    
    weak var navigationController: UINavigationController?
    weak var parent: CoordinatorType?
    
    @Injected
    private var service: SomeServiceType
    
    @Injected
    var loggingService: LoggingServiceType
    
    init(parent: CoordinatorType, navigationController: UINavigationController) {
        self.parent = parent
        self.navigationController = navigationController
        super.init()
    }
    
    func start() throws {
        let controller = AppStoryboard.more.viewController(class: MoreViewController.self)
        controller.coordinator = self
        self.navigationController?.viewControllers = [controller]
    }
    
    func stop() throws {}
    
    func route(to route: Route) { }
    
    deinit {
        debugPrint("deinit \(self)")
    }
    
}

enum SomeTransition: Transition {
    case profile
}

extension ___FILEBASENAME___ {
    
    // swiftlint:disable cyclomatic_complexity function_body_length
    func transition(to transition: Transition) throws {
        
        if let transition = transition as? MoreTransition {
            switch transition {
                case .profile:
                    let controller = AppStoryboard.more.viewController(class: ProfileViewController.self)
                    controller.coordinator = self
                    self.navigationController?.pushViewController(controller, animated: true)
                    self.loggingService.log(event: .profile)
            }
        } else {
            try self.parent?.transition(to: transition)
        }
    }
    
    // swiftlint:enable cyclomatic_complexity function_body_length
}

extension ___FILEBASENAME___: Delegate {
    
    func someDelegate() {
        debugPrint("Delegate.someDelegate")
    }
}

