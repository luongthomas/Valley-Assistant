//
//  ItemName.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 10/10/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

enum ItemName: String, Codable {
    case daffodil, axe, barn, bigBarn, basicFertilizer, qualityFertilizer, basicRetainingSoil, qualityRetainingSoil, speedGro, deluxeSpeedGro, wallpaper, flooring, cherrySapling, apricotSapling, orangeSapling, peachSapling, pomegranateSapling, appleSapling, catalogue, bouquet, largePack, deluxePack, anyFish, stone, clay, pineTar, oakResin

    case energyTonic, muscleRemedy
    
    case copperOre, ironOre, coal, goldOre, copperBar, ironBar, goldBar, iridiumBar, iridiumOre, refinedQuartz
    
    case copperHoe, copperPickaxe, copperAxe, copperWateringCan, steelHoe, steelPickaxe, steelAxe, steelWateringCan, goldHoe, goldPickaxe, goldAxe, goldWateringCan, iridiumHoe, iridiumPickaxe, iridiumAxe, iridiumWateringCan
    
    case jojaCola, jColaLight, jojaWallpaper, minecarts, panning, bridge, greenhouse, bus
    
    case hashbrownsRecipe, omeletRecipe, pancakesRecipe, breadRecipe, tortillaRecipe, pizzaRecipe, makiRollRecipe
    
    case goldenPumpkin, pearl, rabbitsFoot
    
    case vinegar, hardwood
    
    case driftwood, batteryPack, lightningRod
    
    // Monster drops
    case batWing, voidEssence, solarEssence

    // Artifacts
    case dwarfGadget, dwarfScrollI, dwarfScrollIi, dwarfScrollIii, dwarfScrollIv, dwarvishHelm, chippedAmphora, arrowhead, ancientDoll, elvishJewelry, chewingStick, ornamentalFan, dinosaurEgg, rareDisc, ancientSword, rustySpoon, rustySpur, rustyCog, chickenStatue, ancientSeed, prehistoricTol, driedStarfish, anchor, glassShards, boneFlute, prehistoricHandaxe, ancientDrum, goldenMask, goldenRelic, strangeDoll, prehistoricScapula, prehistoricTibia, prehistoricSkull, skeletalRib, prehistoricVertebra, skeletalTail, nautilusFossil, amphibianFossil, palmFossil, trilobite

    // Seeds
    case parsnipSeeds, beanStarter, cauliflowerSeeds, potatoSeeds, tulipBulb, kaleSeeds, jazzSeeds, garlicSeeds, melonSeeds, tomatoSeeds, blueberrySeeds, pepperSeeds, wheatSeeds, radishSeeds, poppySeeds, spangleSeeds, hopsStarter, cornSeeds, sunflowerSeeds, redCabbageSeeds, eggplantSeeds, pumpkinSeeds, bokChoySeeds, yamSeeds, cranberrySeeds, fairySeeds, amaranthSeeds, grapeStarter, artichokeSeeds, grassStarter, fallSeeds, winterSeeds, summerSeeds, springSeeds, cactusSeeds, mapleSeed, rareSeed, ancientSeeds, starfruitSeeds, strawberrySeeds
    
    
    // Recipes
    case friedEgg, omelet, salad, cheeseCauliflower, bakedFish, parsnipSoup, vegetableMedley, completeBreakfast, friedCalamari, strangeBun, luckyLunch, friedMushroom, pizza, beanHotpot, glazedYams, carpSurprise, hashbrowns, pancakes, salmonDinner, fishTaco, crispyBass, pepperPoppers, bread, tomKhaSoup, troutSoup, chocolateCake, pinkCake, rhubarbPie, cookie, spaghetti, friedEel, spicyEel, sashimi, makiRoll, tortilla, redPlate, eggplantParmesan, ricePudding, iceCream, blueberryTart, autumnsBounty, pumpkinSoup, superMeal, cranberrySauce, stuffing, farmersLunch, survivalBurger, dishOTheSea, minersTreat, rootsPlatter, algaeSoup, paleBroth, plumPudding, artichokeDip, stirFry, roastedHazelnuts, pumpkinPie, radishSalad, fruitSalad, blackberryCobbler, cranberryCandy, bruschetta, coleslaw, fiddleheadRisotto,poppyseedMuffin, chowder, lobsterBisque, escargot, fishStew, mapleBar, crabCakes, fieldSnack, lifeElixir, oilOfGarlic
    
    // Crops
    case blueJazz, cauliflower, coffeeBean, garlic, greenBean, kale, parsnip, potato, rhubarb, strawberry, tulip, blueberry, corn, hops, hotPepper, melon, poppy, radish, redCabbage, starfruit, summerSpangle, sunflower, tomato, wheat, amaranth, artichoke, beet, bokChoy, cranberries, eggplant, fairyRose, grape, pumpkin, yam, ancientFruit, cactusFruit, sweetGemBerry
    
    // Foraged Goods
    case blackberry, caveCarrot, commonMushroom, dandelion, coconut, fiddleheadFern, hazelnut, leek, morel, wildPlum, winterRoot, coral, seaUrchin, rainbowShell, crocus, holly, crystalFruit, snowYam, chanterelle, spiceBerry, sweetPea, sap, wildHorseradish, springOnion, salmonberry, redMushroom, purpleMushroom

    // Tree Products
    case apple, apricot, mapleSyrup, cherry, orange, peach, pomegranate
    
    // Animal Products
    case egg, milk, largeMilk, duckFeather, duckEgg, goatMilk, largeEgg, largeGoatMilk, slime, slimeBall, truffle, voidEgg, wool, largeBrownEgg, brownEgg
    
    // Artisan Goods
    case honey, wine, paleAle, beer, mead, cheese, goatCheese, juice, coffee, cloth, mayonnaise, duckMayonnaise, voidMayonnaise, truffleOil, oil, pickles, jelly
    
    // Fish
    case pufferfish, anchovy, tuna, sardine, bream, largemouthBass, smallmouthBass, rainbowTrout, salmon, walleye, perch, carp, catfish, pike, sunfish, redMullet, herring, eel, octopus, redSnapper, squid, seaCucumber, superCucumber, ghostfish, stonefish, icePip, lavaEel, sandfish, scorpionCarp, sturgeon, tigerTrout, bullhead, tilapia, chub, dorado, albacore, shad, lingcod, halibut, woodskip, voidSalmon, slimejack, midnightSquid, spookFish, blobfish, crimsonfish, angler, legend, glacierfish, mutantCarp, seaweed, greenAlgae, whiteAlgae
    
    // Crab Pot items
    case lobster, clam, crayfish, crab, cockle, mussel, shrimp, snail, periwinkle, oyster
    
    // General Store Items
    case sugar, wheatFlour, rice
    
    // Gems
    case emerald, aquamarine, ruby, amethyst, topaz, jade, diamond, prismaticShard
    
    // Geode Minerals
    case tigerseye, opal, fireOpal, alamite, bixite, baryte, aerinite, calcite, dolomite, esperite, fluorapatite, geminite, helvite, jamborite, jagoite, kyanite, lunarite, malachite, neptunite, lemonStone, nekoite, orpiment, petrifiedSlime, thunderEgg, pyrite, oceanStone, ghostCrystal, jasper, celestine, marble, sandstone, granite, basalt, limestone, soapstone, hematite, mudstone, obsidian, slate, fairyStone, starShards
    
    // Geodes
    case geode, frozenGeode, magmaGeode, omniGeode
    
    // Forged Minerals
    case earthCrystal, fireQuartz, frozenTear, quartz

    
}
