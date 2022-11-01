//
//  SearchViewController.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 01/11/2022.
//

import UIKit
import RxSwift

final class SearchViewController: UIViewController {
    @IBOutlet weak var searchTableView: UITableView!

    var disposeBag = DisposeBag()
    var viewModel: SearchViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
    }
}

extension SearchViewController: Bindable {
    func bindViewModel() {
    }
}
