//
//  TableViewCell.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 01/11/2022.
//

import UIKit
import Reusable
import RxSwift

class TableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var searchLable: UILabel!

    private let disposeBag = DisposeBag()
    var viewModel: SearchCellViewModel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setDataCell() {
        searchLable.text = viewModel.searchText
    }
}
