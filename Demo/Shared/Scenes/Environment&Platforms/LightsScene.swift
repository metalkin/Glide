//
//  LightsScene.swift
//  glide Demo
//
//  Copyright (c) 2019 cocoatoucher user on github.com (https://github.com/cocoatoucher/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import GlideEngine
import SpriteKit

class LightsScene: BaseLevelScene {
    
    override func setupScene() {
        super.setupScene()
        
        tileMaps.decorationTileMaps.forEach {
            $0.lightingBitMask = DemoLightMask.torch.rawValue
            $0.setNormalTextures()
        }
        
        let parallaxSprite = parallaxBackgroundEntity.component(ofType: SpriteNodeComponent.self)
        parallaxSprite?.spriteNode.lightingBitMask = DemoLightMask.torch.rawValue
        
        addEntity(torchEntity(at: TiledPoint(12, 12)))
        addEntity(torchEntity(at: TiledPoint(20, 12)))
        addEntity(torchEntity(at: TiledPoint(25, 12)))
        
        addEntity(playerEntity)
    }
    
    lazy var playerEntity: GlideEntity = {
        let playerEntity = SimplePlayerEntity(initialNodePosition: defaultPlayerStartLocation, playerIndex: 0)
        
        let sprite = playerEntity.component(ofType: SpriteNodeComponent.self)?.node as? SKSpriteNode
        sprite?.lightingBitMask = DemoLightMask.torch.rawValue
        sprite?.shadowedBitMask = DemoLightMask.torch.rawValue
        
        return playerEntity
    }()
    
    func torchEntity(at position: TiledPoint) -> TorchEntity {
        return TorchEntity(initialNodePosition: position.point(with: tileSize))
    }
}
