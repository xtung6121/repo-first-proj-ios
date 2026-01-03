
import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var bgContainerView: UIImageView!
    @IBOutlet weak var bgViewHeader: UIView!
    @IBOutlet weak var bgImageLayer: UIImageView!
    @IBOutlet weak var bgViewHeaderLabel: UIView!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var searchTextField: MTextField!
    @IBOutlet weak var scrollContainer: UIScrollView!
    @IBOutlet weak var lbStackviewHeader: UILabel!
    @IBOutlet weak var scLbStackViewHeader: UILabel!
    @IBOutlet weak var imageDiscountView: UIImageView!
    
    @IBOutlet private weak var categoriesCollectionView: UICollectionView!
    @IBOutlet private weak var bestSellerCollectionView: UICollectionView!
    @IBOutlet private weak var recommendCollectionView: UICollectionView!
    
    // MARK: - Data
    private var categories: [Category] = Category.getDummyDatas()
    private var bestSellers: [Category] = Category.getDummyDatas()
    private var recommendFood: [Category] = Category.getDummyDatas()
    
    // MARK: - Data Sources 
    private var categoriesDataSource: UICollectionViewDiffableDataSource<Int, Category>!
    private var bestSellersDataSource: UICollectionViewDiffableDataSource<Int, Category>!
    private var recommendDataSource: UICollectionViewDiffableDataSource<Int, Category>!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBackground()
        setupHeaderLabels()
        setupSearchTextField()
        setupCollectionViews()
        setupDiscountView()
        applyInitialData() // data
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        overrideUserInterfaceStyle = .light
    }
    
    private func setupBackground() {
        bgContainerView.backgroundColor = ColorSet.yellowPrimary.color
        bgImageLayer.image = UIImage(named: "Frame 6")
        bgViewHeader.backgroundColor = .clear
        bgViewHeaderLabel.backgroundColor = .clear
        scrollContainer.backgroundColor = .clear
        viewContent.backgroundColor = .clear
    }
    
    private func setupHeaderLabels() {
        lbStackviewHeader.text = "Good Morning"
        lbStackviewHeader.font = .systemFont(ofSize: 28, weight: .semibold)
        lbStackviewHeader.textColor = .white
        
        scLbStackViewHeader.text = "Rise and shine! It's Breakfast Time"
        scLbStackViewHeader.textColor = .red
    }
    
    private func setupSearchTextField() {
        searchTextField.configView(placeHolder: "Search", textColor: .black, font: .systemFont(ofSize: 14))
    }
    
    private func setupDiscountView() {
        imageDiscountView.image = UIImage(named: "Frame 71")
    }
    
    // MARK: - Collection Views Setup
    private func setupCollectionViews() {
        configureCategoriesCollectionView()
        configureBestSellersCollectionView()
        configureRecommendCollectionView()
    }
    
    private func configureCategoriesCollectionView() {
        
        let registration = UICollectionView.CellRegistration<CategoriesCollectionCell, Category> { cell, indexPath, category in
            
                cell.layer.cornerRadius = 12
                cell.imgViewCollection?.image = UIImage(named: category.image)
        }
        
        categoriesDataSource = UICollectionViewDiffableDataSource<Int, Category>(collectionView: categoriesCollectionView) { collectionView, indexPath, category in
            collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: category)
            
            
            
        }
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.backgroundColor = .clear
        categoriesCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func configureBestSellersCollectionView() {
        let registration = UICollectionView.CellRegistration<BestSellerCollectionCell, Category> { cell, indexPath, category in
            cell.imageCollectionView.image = UIImage(named: category.image) ?? UIImage(systemName: "Rectangle 133")
            cell.titleLabel?.text = category.category
            cell.layer.cornerRadius = 12
            cell.layer.borderWidth = 1

        }
        
        bestSellersDataSource = UICollectionViewDiffableDataSource<Int, Category>(collectionView: bestSellerCollectionView) { collectionView, indexPath, category in
            collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: category)
        }
        
        bestSellerCollectionView.delegate = self
        bestSellerCollectionView.backgroundColor = .clear
        bestSellerCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func configureRecommendCollectionView() {
        let registration = UICollectionView.CellRegistration<RecommendCollectionCell, Category> { cell, indexPath, category in

//            cell.imageCollectionView?.image = UIImage(named: category.image) ?? UIImage(systemName: "Rectangle 133")
            cell.contentView.backgroundColor = .systemPink.withAlphaComponent(0.3)
            cell.layer.cornerRadius = 12
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.blue.cgColor
        }
        
        recommendDataSource = UICollectionViewDiffableDataSource<Int, Category>(collectionView: recommendCollectionView) { collectionView, indexPath, category in
            collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: category)
        }
        
        recommendCollectionView.delegate = self
        recommendCollectionView.backgroundColor = .clear
        recommendCollectionView.showsHorizontalScrollIndicator = false
    }
    
    // MARK: - Apply Data // chưa hiểu lắm
    private func applyInitialData() {
        // Categories
        var snapshot = NSDiffableDataSourceSnapshot<Int, Category>()
        snapshot.appendSections([0])
        snapshot.appendItems(categories)
        categoriesDataSource.apply(snapshot, animatingDifferences: false)
        
        // Best Sellers
        snapshot = NSDiffableDataSourceSnapshot<Int, Category>()
        snapshot.appendSections([0])
        snapshot.appendItems(bestSellers)
        bestSellersDataSource.apply(snapshot, animatingDifferences: false)
        
        // Recommend
        snapshot = NSDiffableDataSourceSnapshot<Int, Category>()
        snapshot.appendSections([0])
        snapshot.appendItems(recommendFood)
        recommendDataSource.apply(snapshot, animatingDifferences: false)
    }
}

// MARK: - UICollectionViewDelegate (chỉ để bắt chọn item)
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        // Lấy item được chọn từ dataSource tương ứng
        let dataSource = collectionView.dataSource as? UICollectionViewDiffableDataSource<Int, Category>
        guard let category = dataSource?.itemIdentifier(for: indexPath) else { return }
        
        let type: String
        if collectionView == categoriesCollectionView {
            type = "Categories"
        } else if collectionView == bestSellerCollectionView {
            type = "Best Sellers"
        } else {
            type = "Recommend"
        }
        
        print("Selected from \(type): \(category.category)")
    }
}

// MARK: - UICollectionViewDelegateFlowLayout (custom layout)
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
