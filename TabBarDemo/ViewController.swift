//
//  ViewController.swift
//  TabBarDemo
//
//  Created by Hasan Ali Şişeci on 5.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    private let button: UIButton = {
            //UIButton tipinde bir buton nesnesi oluşturuyor ve boyutlarını belirliyoruz.
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
            //Butonumuzun daha şık görünmesi için cornerRadius değeri atıyoruz.
            button.layer.cornerRadius = 10
            //Butonumuz için gölge opaklığı ve butona göre konumunu belirliyoruz.
            button.layer.shadowOpacity = 0.5
            button.layer.shadowOffset = CGSize(width: 0, height: 5)
            //Butonumuzun arkaplan rengini, başlığını ve başlık yazısının rengini belirliyoruz.
            button.backgroundColor = .white
            button.setTitle("Log In", for: .normal)
            button.setTitleColor(.black, for: .normal)
            //Ardından buton nesnemizi döndürüyoruz.
            return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        //Ekranımızın arkaplan rengini atıyoruz.
        view.backgroundColor = .systemBlue
        //Ekranımıza butonumuzu ekliyoruz.
        view.addSubview(button)
        //Butonumuzu sayfaya göre ortalıyoruz.
        button.center = view.center
        //Buton nesnemiz ile fonksiyonumuzu ilişkilendiriyoruz
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    @objc func didTapButton() {
        //Create and present tab bar controller
        let tabBarVC = UITabBarController()
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        
        
        vc1.title = "Home"
        vc2.title = "Settings"
        vc3.title = "About"
     

        tabBarVC.setViewControllers([vc1,vc2,vc3], animated: false)
        
        //tab bar itemlerimizi bir diziye atıyoruz.
        let items = tabBarVC.tabBar.items
        
        //Kullanacağımız ikon isimlerini de bir listeye atıyoruz.
        let images = ["house","gear","person.circle"]
        
        // Ardından for döngüsü yardımıyla bu itemlere ikonlarını atarken, itemlerin badgeValue sayılarını da for döngüsündeki integer değeri kullanarak örnek olması adına ekliyoruz.
        for item in 0..<items!.count {
            //Sekme ikonlarını atıyoruz.
            items![item].image = UIImage(systemName: images[item])
            //Bildirim sayısı için badgeValue değeri atıyoruz.
            items![item].badgeValue = String(item+1)
        }
        
        //Tab Bar Controller'ın nasıl görüntüleneceğini belirliyoruz.
        tabBarVC.modalPresentationStyle = .fullScreen
        //Ardından tab bar controller'ımızı
        present(tabBarVC,animated: true)
    }
}

class FirstViewController: UIViewController {
    let label = createLabel(str: "Home Page")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Home"
        view.addSubview(label)
        label.center = view.center
    }
}

class SecondViewController: UIViewController {
    let label = createLabel(str: "Settings Page")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        title = "Settings"
        view.addSubview(label)
        label.center = view.center
    }
}

class ThirdViewController: UIViewController {
    
    let label = createLabel(str: "About Page")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        title = "About"
        view.addSubview(label)
        label.center = view.center
    }
}


func createLabel(str : String) -> UILabel {
    //Label'ımızı oluşturup konum vermeden boyutlarını atıyoruz.
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
    //Parametre olarak gelen string değeri label text olarak atıyoruz.
    label.text = "\(str)"
    //Fontumuzu ve font size'ı atıyoruz.
    label.font = UIFont(name: label.font.familyName, size: 50)
    //Yazımızı hizalıyoruz.
    label.textAlignment = .center
    //Text rengi olarak beyaz rengini belirledik.
    label.textColor = .white
    //Ve oluşturduğumuz label nesnesini geri döndürüyoruz.
    return label
}



