//
//  SearchViewController.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 01/11/2022.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable
import Then

final class SearchViewController: UIViewController {
    @IBOutlet private weak var searchTableView: UITableView!
    
    private var disposeBag = DisposeBag()
    var viewModel: SearchViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
    }
    
    private func configViews () {
        title = "Search"
        searchTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        searchTableView.do {
            $0.rowHeight = 80
            $0.delegate = self
            $0.register(cellType: TableViewCell.self)
            $0.separatorStyle = .none
        }
    }
}

extension SearchViewController: Bindable {
    func bindViewModel() {
        let input = SearchViewModel.Input(loadTrigger: Driver.just(()))
        let output = viewModel.transform(input: input, disposeBag: disposeBag)
        output.listData.drive(searchTableView.rx.items) { tableview, index, text in
            let indexPath = IndexPath(item: index, section: 0)
            let cell: TableViewCell = tableview.dequeueReusableCell(for: indexPath)
            cell.viewModel = SearchCellViewModel(searchText: text)
            cell.setDataCell()
            return cell
        }
        .disposed(by: disposeBag)
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
