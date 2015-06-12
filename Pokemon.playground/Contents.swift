//: Playground - noun: a place where people can play

import UIKit

class Pokemon {
  
  var name: String?
  var type:[String] = []
  var level = 1
  var health = 100
  var abilities: [String] = []
  var attacks: [String] = []
  var opponent: String?
  
  init (startingLevel: Int, abilities:[String], attacks: [String]) {
    self.level = startingLevel
    self.abilities = abilities
    self.attacks = attacks
  }
  
  func damage()-> Int {
    health = health - 10
    return health
  }
  
  func biggerDamage() -> Int {
    health = health - 20
    return health
  }
  
  func megaDamage() -> Int {
    health = health - 60
    return health
  }
}

class Bulbasaur: Pokemon {
  init() {
    super.init(startingLevel: 10, abilities: ["Over grow","Chlorophyl"], attacks: ["Beam","Seeds","Vine"])
    self.type += ["Grass", "Poison"]
  }
  
  func solarBeam(opponent: Pokemon) {
    opponent.damage()
  }
  
  func shootingSeeds(opponent: Pokemon) {
    opponent.damage()
  }
  
  func vineAttack(opponent: Pokemon)  {
    opponent.damage()
  }
}

class Ivysaur: Bulbasaur {
  override init() {
    super.init()
    self.level = 16
  }
  func razorLeaf(opponent: Pokemon) {
    opponent.biggerDamage()
  }
}

class Venusaur: Ivysaur {
  override init() {
    super.init()
    self.level = 32
    abilities += ["Thick Fat"]
  }
  
  func earthquake(opponent: Pokemon) {
    opponent.megaDamage()
  }
  
  func sleepPowder(opponent: Pokemon) {
    opponent.megaDamage()
  }
}

class Charmander: Pokemon {
  init() {
    super.init(startingLevel: 5, abilities: ["Blaze", "Solar Power"], attacks: ["Rage"])
    type = ["Fire"]
  }
  
  func rage(opponent: Pokemon) {
    opponent.damage()
  }
}

class Charmeleon: Charmander {
  override init() {
    super.init()
    level = 16
  }
  
  func blaze(opponent: Pokemon) {
    opponent.biggerDamage()
  }
}

class Charizard: Charmeleon {
  override init() {
    super.init()
    level = 36
    type += ["dragon"]
    abilities += ["Tough Claws", "Drought"]
  }
  func fireSpin(opponent: Pokemon) {
    opponent.megaDamage()
  }
}

class Mew: Pokemon {
  init() {
    super.init(startingLevel: 10, abilities: ["Synchronize"], attacks: ["Psychic Attack", "Learn Opponent Attacks"])
    self.type = ["Psychic"]
  }
  
  func clonedAttack(opponent: Pokemon) {
    opponent.damage()
  }
  
  func biggerClonedAttack(opponent: Pokemon) {
    opponent.biggerDamage()
  }
  
  func megaClonedAttack(opponent: Pokemon) {
    opponent.megaDamage()
  }
}

class Mewtwo: Mew {
  override init () {
    super.init()
    level = 32
    abilities += ["Pressure", "Unnerve", "Steadfast", "Insomnia"]
    attacks += ["Psystrike"]
    type += ["Fighting"]
  }
  
  func Psystrike(opponent: Pokemon) {
    opponent.damage()
  }
}

class Pichu: Pokemon {
  
  init() {
    super.init(startingLevel: 10, abilities: ["Static", "Lightning Rod"], attacks: ["thundershock"])
    self.type += ["electric"]
  }
  
  func thunderShock(opponent: Pokemon) ->Int{
    var healthAfterDamageInflicted = opponent.damage()
    return healthAfterDamageInflicted
  }
}

class Pikachu: Pichu {
  override init() {
    super.init()
    level = 16
  }
  
  func thunderboltAttack(opponent: Pokemon)  {
    var damageInflicted = opponent.biggerDamage()
  }
}

let myPikachu = Pikachu()
let myPichu = Pichu()
let babyPichu = Pichu()
let myBulbasaur = Bulbasaur()
let myVenasaur = Venusaur()
let myIvysaur = Ivysaur()
let myMew = Mew()
let myMewtwo = Mewtwo()

//myPichu vs myPikachu
myPichu.thunderShock(myPikachu)
println(myPikachu.health)
myPikachu.thunderShock(myPichu)
println(myPichu.health)
myPichu.thunderShock(myPikachu)
println(myPikachu.health)
myPikachu.thunderboltAttack(myPichu)
println(myPichu.health)

//myVenasaur vs myPikachu
myVenasaur.earthquake(myPikachu)
println(myPikachu.health)
myPikachu.thunderShock(myVenasaur)
println(myVenasaur.health)
myVenasaur.sleepPowder(myPikachu)
println(myPikachu.health)
myPikachu.thunderShock(myVenasaur)
println(myVenasaur.health)
myVenasaur.earthquake(myPikachu)
println(myPikachu.health)

//babyPichu vs myIvysaur
babyPichu.thunderShock(myIvysaur)
babyPichu.thunderShock(myIvysaur)
babyPichu.thunderShock(myIvysaur)
println(myIvysaur.health)
myIvysaur.solarBeam(babyPichu)
println(babyPichu.health)
myIvysaur.razorLeaf(babyPichu)
println(babyPichu.health)
myIvysaur.vineAttack(babyPichu)
println(babyPichu.health)

//myBulbasaur vs myMewtwo
myBulbasaur.solarBeam(myMewtwo)
println(myMewtwo.health)
myMewtwo.biggerClonedAttack(myBulbasaur)
println(myBulbasaur.health)
myBulbasaur.shootingSeeds(myMewtwo)
println(myMewtwo.health)
myMewtwo.Psystrike(myBulbasaur)
println(myBulbasaur.health)


















