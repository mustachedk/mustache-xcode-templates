
import Combine
import Foundation
import MustacheFoundation
import MustacheServices
import MustacheUIKit
//import MustacheCombine
import Resolver
import UIKit

class ___FILEBASENAME___: UIViewController {
    
    // :MARK @IBOutlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    // :MARK ViewModel
    
    @Injected
    private var viewModel: PinViewModelType
    
    // :MARK Coordinator
    
    var coordinator: CoordinatorType!
    
    // :MARK Delegate
    
    weak var delegate: Delegate?
    
    // :MARK Cancellable
    
    private var cancellables = Set<AnyCancellable>()
    
    // :MARK UI State Variables (Avoid if possible)
    
    var finishedPlaying: Bool
    
    // :MARK LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
        self.configureBindings()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // :MARK Configure
    
    private func configure() {}
    
    private func configureBindings() {}
    
    // :MARK @IBActions
    
    @IBAction func pop() {}
    
    // :MARK Override UIViewController functions
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    deinit {
        debugPrint("deinit \(self)")
    }
    
    
}

// :MARK Extensions
extension ___FILEBASENAME___ {}
