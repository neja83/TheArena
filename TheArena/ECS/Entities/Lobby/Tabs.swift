//
//  Tabs.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 03.09.2021.
//

import GameplayKit

class Tabs: GKEntity {
    
    override init() {
        super.init()
        
        let visualComponent      = VisualComponent(textureName: "tabsBackground")
        let shapeComponent       = FrameComponent(size: LobbyElements.tabsSize, color: .systemPink)
        let tabsPanelComponent   = TabsPanelComponent()
        let tabsStateComponent   = TabsStateComponent()
        
        addComponent(visualComponent)
        addComponent(shapeComponent)
        addComponent(tabsPanelComponent)
        addComponent(tabsStateComponent)
        
        configurateTabsPanel(for: tabsPanelComponent)
    }
    
    func configurateTabsPanel(for component: TabsPanelComponent) {
        component.configurateButton(type: .stats, textureName: "statsButton") { [weak self] _ in
            if let tabsState = self?.component(ofType: TabsStateComponent.self) {
                tabsState.setSelected(.stats)
            }
        }
        component.configurateButton(type: .skills, textureName: "skillsButton") { [weak self] _ in
            if let tabsState = self?.component(ofType: TabsStateComponent.self) {
                tabsState.setSelected(.skills)
            }
        }
        component.configurateButton(type: .inventoty, textureName: "inventoryButton") { [weak self] _ in
            if let tabsState = self?.component(ofType: TabsStateComponent.self) {
                tabsState.setSelected(.inventoty)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
