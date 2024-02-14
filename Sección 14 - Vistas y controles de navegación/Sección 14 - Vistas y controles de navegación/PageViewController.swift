//
//  PageViewController.swift
//  Sección 14 - Vistas y controles de navegación
//
//  Created by Jacob Aguilar on 14-02-24.
//

import UIKit

class PageViewController: UIPageViewController {
    
    private var myControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let myGreenVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "vcGreen") //Los identifiers lo ponemos en los atributos en el identity inspector del storyboard
        let myPinkVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "vcPink")
        
        myControllers.append(myGreenVC)
        myControllers.append(myPinkVC)
        
        setViewControllers([myGreenVC], direction: .forward, animated: true) //El primer controlador que se muestra
        
        dataSource = self //Para implementar el dataSource de la extensión
    }
}

//Indicamos a nuestra app qué hacer cuando se haga un scroll horizontal
extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = myControllers.firstIndex(of: viewController)
        return index == 0 ? myControllers.last : myControllers.first
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = myControllers.firstIndex(of: viewController)
        return index == 0 ? myControllers.last : myControllers.first
    }
    
    
}
