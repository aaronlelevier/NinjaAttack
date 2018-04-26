//
//  GameOver.swift
//  NinjaAttack
//
//  Created by Aaron Lelevier on 4/26/18.
//  Copyright © 2018 aaronlelevier. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {

    init(size: CGSize, won:Bool) {
        super.init(size: size)

        // 1
        backgroundColor = SKColor.whiteColor()

        // 2
        let message = won ? "You Won!" : "You Lose :["

        // 3
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = message
        label.fontSize = 40
        label.fontColor = SKColor.blackColor()
        label.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(label)

        // 4
        runAction(SKAction.sequence([
            SKAction.waitForDuration(3.0),
            SKAction.runBlock( { [weak self] in
                // 5
                guard let `self` = self else { return }
                let reveal = SKTransition.flipHorizontalWithDuration(0.5)
                let scene = GameScene(size: size)
                self.view?.presentScene(scene, transition:reveal)
                })
            ]))
    }

    // 6
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

