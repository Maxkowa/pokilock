local Unlocker, awful, poki = ...
local player = awful.player
local pet = awful.pet
local wasCasting = {}
local target, focus, healer, enemyHealer = awful.target, awful.focus, awful.healer, awful.enemyHealer
awful.DevMode = true
poki.warlock = {}
poki.warlock.demo = awful.Actor:New({ spec = 2, class = "warlock"})
local demo = poki.warlock.demo
local spell = awful.Spell
local NewItem = awful.NewItem
awful.ttd = true

--TODO
-- try working on toggle pannel for cd's etc


awful.Populate({
    banish = spell({710, 18647}, { effect = "magic", targeted = true }),
    challengingHowl = spell({5484}, { effect = "magic", targeted = true }),
    createHealthstone = spell({6201, 6202, 5699, 11729, 11730, 27230}, { beneficial = true }),
    demonArmor = spell({706, 1086, 11733, 11734, 11735, 27260, 47889, 47890}, { beneficial = true }),
    demonCharge = spell({54785}, { damage = "magic", targeted = true }),
    demonSkin = spell({687, 696}, { beneficial = true }),
    demonicCircleSummon = spell({48018}, { beneficial = true }),
    demonicCircleTeleport = spell({48020}, { beneficial = true }),
    demonicEmpowerment = spell({47193}, { beneficial = true }),
    detectInvisibility = spell({132}, { beneficial = true }),
    enslaveDemon = spell({1098, 11726, 11725, 19444, 19443, 19442, 19445, 61191}, { effect = "magic", targeted = true }),
    eyeOfKilrogg = spell({126}, { beneficial = true }),
    felArmor = spell({28176, 47893, 47894, 47895}, { beneficial = true }),
    felDomination = spell({18708}, { beneficial = true }),
    healthFunnel = spell({755, 3698, 3699, 3700, 11693, 11694, 11695, 27259}, { beneficial = true }),
    immolationAura = spell({50589}, { damage = "magic", targeted = true }),
    inferno = spell({1122}, { damage = "magic", targeted = true }),
    manaFeed = spell({100}, { beneficial = true }),
    metamorphosis = spell({47241, 61610, 59672}, { beneficial = true }),
    ritualOfDoom = spell({18540}, { beneficial = true }),
    ritualOfSummoning = spell({698}, { beneficial = true }),
    senseDemons = spell({5500}, { beneficial = true }),
    shadowCleave = spell({50581}, { damage = "magic", targeted = true }),
    shadowWard = spell({6229, 28610, 28611, 28612, 47891, 47892}, { beneficial = true }),
    soulLink = spell({19028}, { beneficial = true }),
    soulshatter = spell({29858}, { beneficial = true }),
    summonFelhunter = spell({691}, { beneficial = true }),
    summonImp = spell({688}, { beneficial = true }),
    summonSuccubus = spell({712}, { beneficial = true }),
    summonVoidwalker = spell({697}, { beneficial = true }),
    unendingBreath = spell({5697}, { beneficial = true }),
    createFirestone = spell({17951, 17952, 17953, 17954, 17955, 27230}, { beneficial = true }),
    createSoulstone = spell({27238}, { beneficial = true }),
    createSpellstone = spell({47888}, { beneficial = true }),
    amplifyCurse = spell({18223}, { effect = "magic", targeted = true }),
    atrocity = spell({12345}, { effect = "magic", targeted = true }),
    corruption = spell({172, 6222, 6223, 7648, 11671, 11672, 25311, 27216}, { damage = "magic", targeted = true }),
    curseOfAgony = spell({980, 1014, 6217, 11711, 11712, 11713, 27218}, { damage = "magic", targeted = true }),
    curseOfDoom = spell({603, 30910, 47867}, { damage = "magic", targeted = true }),
    curseOfExhaustion = spell({18223}, { effect = "magic", targeted = true }),
    curseOfElements = spell({1490, 11721, 11722, 27228, 47865}, { effect = "magic", targeted = true }),
    curseOfTongues = spell({1714, 11719}, { effect = "magic", targeted = true }),
    curseOfWeakness = spell({702, 1108, 6205, 7646, 11707, 11708, 27228}, { effect = "magic", targeted = true }),
    darkPact = spell({18220, 18937, 18938, 27265, 59092}, { beneficial = true }),
    deathCoil = spell({6789, 17925, 17926, 27223, 47859, 47860}, { damage = "magic", targeted = true }),
    drainLife = spell({47857}, { damage = "magic", targeted = true }),
    drainMana = spell({5138}, { target = true }),
    fear = spell({5782, 6213, 6215}, { effect = "magic", targeted = true }),
    haunt = spell({48181, 59164, 59165, 59166}, { damage = "magic", targeted = true }),
    howlOfTerror = spell({5484, 17928}, { effect = "magic", targeted = true }),
    lifeTap = spell({1454, 1455, 1456, 11687, 11688, 11689, 27222, 47855, 47856}, { beneficial = true }),
    seedOfCorruption = spell({27243, 47843, 47844}, { damage = "magic", targeted = true}),
    unstableAffliction = spell({30108, 30404, 30405, 47843, 47844}, { damage = "magic", targeted = true }),
    drainSoul = spell({1120, 8288, 8289, 11675, 11676, 27217}, { damage = "magic", targeted = true }),
    chaosBolt = spell({50796, 59172, 59173, 59174, 59175}, { damage = "magic", targeted = true }),
    conflagrate = spell({17962}, { damage = "magic", targeted = true }),
    hellfire = spell({1949, 11683, 11684, 11685, 27213}, { damage = "magic", targeted = false }),
    immolate = spell({47811}, { damage = "magic", targeted = true }),
    incinerate = spell({29722, 32231, 47837, 47838}, { damage = "magic", targeted = true }),
    rainOfFire = spell({5740, 6219, 11677, 11678, 27212, 47836, 47837}, { damage = "magic", targeted = false }),
    searingPain = spell({17919, 17920, 17921, 17922, 17923, 17924, 27210, 47843, 47844, 47845}, { damage = "magic", targeted = true }),
    shadowBolt = spell({686, 695, 705, 1088, 1106, 7641, 11659, 11660, 25307, 27209, 47843, 47808, 47809}, { damage = "magic", targeted = true }),
    shadowBoltFiller = spell({686, 695, 705, 1088, 1106, 7641, 11659, 11660, 25307, 27209, 47843, 47808, 47809}, { damage = "magic", targeted = true }),
    shadowburn = spell({17877, 18867, 18868, 18869, 18870, 18871, 47843, 47844, 47845, 47846, 47847}, { damage = "magic", targeted = true }),
    shadowflame = spell({47897, 61290}, { damage = "magic", targeted = true }),
    shadowfury = spell({30283, 30413, 30414, 47847, 47848}, { damage = "magic", targeted = true }),
    soulFire = spell({6353, 17924, 27211, 47843, 47844, 47845}, { damage = "magic", targeted = true }),
    felguard = spell({30146}, { beneficial = true , targeted = false }),
    spellstoneTest = spell({41196}, { beneficial = true }),
}, demo, getfenv(1))

awful.powerTypes = {
	["mana"] = 0,
	["rage"] = 1,
	["focus"] = 2,
	["energy"] = 3,
	["combopoints"] = 4,
	["cp"] = 4,
	["runes"] = 5,
	["runicpower"] = 6,
	["soulshards"] = 7,
	["shards"] = 7,
	["astralpower"] = 8,
	["ap"] = 8,
	["lunarpower"] = 8,
	["holypower"] = 9,
	["alternatepower"] = 10,
	["maelstrom"] = 11,
	["chi"] = 12,
	["insanity"] = 13,
	["arcanecharges"] = 16,
	["fury"] = 17,
	["pain"] = 18,
    ["essence"] = 19
}

local yellow = {148, 130, 201, 1}
local white = {255, 255, 255, 1}
local dark = {21, 21, 21, 0.45}

local ui, settings, cmd = awful.UI:New("pokilock", {
    title = {'Poki', 'lock'},
    show = true, 
    colors = {
        title = {white, yellow},  
        primary = white,
        accent = yellow,
        background = dark,
    }
})

ui:Tab("Welcome")

ui.tabs["Welcome"]:Text({
    text = awful.textureEscape(47241, 18, "0:2") .. "Welcome to the Devil",  
    position = {0, 70},  
    size = 14,
    paddingBottom = 10,
})

local warlockClassColor = "|cFF9482C9" -- Warlock class color

ui.tabs["Welcome"]:Text({
    text = "|cFFFFFFFFuse " .. warlockClassColor .. "/burst |cFFFFFFFFfor Metamorphosis",
    position = {0, 100},
    size = 10,
    paddingBottom = 80,
})

ui.tabs["Welcome"]:Text({
    text = "Send me feedback, suggestions, and questions via |cFF5865F2Discord: poki1901",
    position = {0, 0},
    size = 8,
})


ui:Tab("Combat")

ui.tabs["Combat"]:Checkbox({
    text = "Single Target",
    var = "singleTarget",
    tooltip = "Enable to force single target mode",
})

ui.tabs["Combat"]:Slider({
    text = "Using Healthstone",
    var = "useHealthstone",
    min = 0,
    max = 100,
    step = 1,
    default = 30,
    valueType = "%",
    tooltip = "Health percentage to use healthstone"
})

ui.tabs["Combat"]:Slider({
    text = "Drain Life Health %",
    var = "drainLifeHealth",
    min = 0,
    max = 100,
    step = 1,
    default = 20,
    valueType = "%",
    tooltip = "Health percentage to start using Drain Life"
})

--ui.tabs["Combat"]:Slider({
--    text = "Kick Slider %",
--    var = "kickSlider",
--    min = 0,
--    max = 100,
--    step = 1,
--    default = 50,
--    valueType = "%",
--    tooltip = "Health percentage to start using Kick"
--})

ui:Tab("Curse")
ui.tabs["Curse"]:Dropdown({
    var = "curseType",
    tooltip = "Select the type of curse",
    options = {
        { label = "Curse of Elements", value = "curseOfElements" },
        { label = "Curse of Doom", value = "curseOfDoom" },
    },
    placeholder = "Select a curse",
    header = "Curse Type:",
    default = "curseOfElements"  
})

ui:Tab("Misc")
ui.tabs["Misc"]:Checkbox({
    text = "Farming Soulshard",
    var = "farm", 
    tooltip = "Enable Farm",
})

ui.tabs["Misc"]:Slider({
    text = "Delete Soul Shard",
    var = "deleteSoulShard",
    min = 1,
    max = 30,
    step = 1,
    default = 20,
    tooltip = "Number of Soul Shards to hold"
})

local statusFrame = ui:StatusFrame({
    colors = {
        background = dark,
        enabled = white,
    },
    maxWidth = 450,
    column = true
})

statusFrame:Toggle({
    label = "Force Single Target",
    var = "singleTarget",
    onClick = function()
        settings.singleTarget = not settings.singleTarget
    end
})

statusFrame:Toggle({
    label = "Farming Soulshard",
    var = "farm",
    onClick = function()
        settings.farm = not settings.farm
    end
})

statusFrame:Toggle({
    label = "Curse: ",
    var = "curseType",
    onClick = function()
        settings.curseType = (settings.curseType == "curseOfElements") and "curseOfDoom" or "curseOfElements"
    end
})

statusFrame:Show()


local healthstone = awful.Item(36892, 36893, 36894)
local soulShard = awful.Item(6265)
local soulShardCount = GetItemCount(6265)
local soulstone = awful.Item(36895)

local function hasSoulstone()
    return soulstone.count > 0
end

local function hasHealthstone()
    return healthstone.count > 0
end

local function deleteExcessSoulShards()
    local itemID = 6265 
    local soulShardCount = GetItemCount(itemID)

    if soulShardCount > settings.deleteSoulShard then
        local excessShards = soulShardCount - settings.deleteSoulShard
        for bag = 0, 4 do
            for slot = 1, C_Container.GetContainerNumSlots(bag) do
                if excessShards <= 0 then
                    return 
                end

                if C_Container.GetContainerItemID(bag, slot) == itemID then
                    C_Container.PickupContainerItem(bag, slot) 
                    DeleteCursorItem() 
                    excessShards = excessShards - 1 
                end
            end
        end
    end
end

local function hasSoulShards()
    local soulShardCount = GetItemCount(6265) 
    return soulShardCount >= 1
end


awful.Populate(items, actor, getfenv(1))

function WasCastingCheck()
    local time = awful.time
    if player.casting then
        wasCasting[player.castingid] = time
    end
    for spell, when in pairs(wasCasting) do
        if time - when > 0.100 + awful.buffer then
            wasCasting[spell] = nil
        end
    end
end

createSoulstone:Callback(function(spell)
    if not player.combat then
        if not hasSoulstone() and hasSoulShards() then
            spell:Cast()
        end
    end
end)

createHealthstone:Callback(function(spell)
    if not player.combat then
        if not hasHealthstone() and hasSoulShards() then
            spell:Cast()
        end
    end
end)

local function useHealthstone()
    if player.hp <= settings.useHealthstone and player.combat then
        if healthstone:Usable() and healthstone:Use() then
            awful.alert("Used Healthstone!", createHealthstone.id)
        end
    end
end

local spellstone = awful.Item(41196) 

createSpellstone:Callback(function(spell)
    if not player.combat and hasSoulShards() then
        if spellstone.count == 0 then
            spell:Cast()
        end
    end
end)

function Buff()
    local spellstonelist = { 41196, 41191, 41192, 41193, 41194, 41195 }

    function _Use(item)
        local name, bag, slot = SecureCmdItemParse(item)
        if slot or GetItemInfo(name) then
            SecureCmdUseItem(name, bag, slot)
        end
    end

    local hasMH, mhExpires, _, _, hasOH, ohExpires, _ = GetWeaponEnchantInfo()

    if not (hasMH and mhExpires) and not player.moving and hasSoulShards() then
        for i = 1, #spellstonelist do
            if GetItemCount(spellstonelist[i]) >= 1 and (C_Container.GetItemCooldown(spellstonelist[i])) == 0 then
                local CurrentWeapon = GetInventoryItemID("player", 16)
                local spellstonename = GetItemInfo(spellstonelist[i])
                if spellstonename then
                    _Use(spellstonename)
                    UseInventoryItem(16)
                    spellstonecount = 0
                end
            end
        end
    end
end

function UseItemInSlot10()
    local itemID = GetInventoryItemID("player", 10)
    if not itemID then return end 

    local item = awful.Item(itemID)

    if player.combat and target.enemy and item:Usable() then
        UseInventoryItem(10)
    end
end



local function trinketBuff()
    return player.buff(64713)
end

local function checkTrinketBuff()
    if trinketBuff() then
        awful.alert("Burst???")
    end
end


function trinket2()
    local itemID = GetInventoryItemID("player", 14)
    if not itemID then return end 

    local item = awful.Item(itemID)

    if player.combat and target.enemy and item:Usable() and player.buff(47241) then
        UseInventoryItem(14)
    end
end

function trinket1()
    local itemID = GetInventoryItemID("player", 13)
    if not itemID then return end 

    local item = awful.Item(itemID)

    if player.combat and target.enemy and item:Usable() and player.buff(47241) then
        UseInventoryItem(13)
    end
end




felguard:Callback(function(spell)
    local felguardID = 30147
    if wasCasting[felguardID] then return end
    if not pet.exists and hasSoulShards() then
        return spell:Cast()
    end
end)

drainLife:Callback(function(spell)
    if player.hp <= settings.drainLifeHealth and player.combat then
        return spell:Cast(target)
    end
end)

local isExecuted = false

local function petAttack()
    if pet.exists and not isExecuted then
        SendChatMessage("/petattack", "SAY")
        isExecuted = true
    end
end

lifeTap:Callback(function(spell)
        if player.mana > 22000 and player.buff(63321)then return end
            if player.mana < 10000 or not player.buff(63321) or not player.combat then
        spell:Cast()
    end
end)

curseOfDoom:Callback(function(spell)
    if target.enemy then
        local debuffElements = target.debuff("Curse of the Elements")
        local debuffDoom = target.debuffFrom({"Curse of Doom"}, player)
        
        if debuffElements and debuffElements.friend then
            spell:Cast(target)
        elseif settings.curseType == "curseOfDoom" and not debuffDoom and target.ttd > 50 then
            spell:Cast(target)
        end
    end
end)

curseOfAgony:Callback(function(spell)
    if target.enemy then
        local debuffAgony = target.debuffFrom({47864}, player)

        if not debuffAgony and target.ttd > 24 and target.ttd < 50 and not checkTrinketBuff() and not settings.curseType == "curseOfElements" then
            spell:Cast(target)
        end
    end
end)

soulLink:Callback(function(spell)
    if pet.exists and not player.buff(25228) then
        spell:Cast()
    end
end)

curseOfElements:Callback(function(spell)
    if target.enemy then
        if settings.curseType == "curseOfElements" and not target.debuff("Curse of the Elements") then
            spell:Cast(target)
        end
    end
end)

immolate:Callback(function(spell)
    local immolateID = 47811
    if target.enemy then
        if wasCasting[immolateID] then return end
        local debuff = target.debuffFrom({"Immolate"}, player)
        if not debuff and not checkTrinketBuff() then
            spell:Cast(target)
        end
    end
end)


metamorphosis:Callback("burst", function(spell)
    if target.enemy then
        spell:Cast()
    end
end)

drainSoul:Callback(function(spell)
    if target.enemy then
        if settings.farm then
            spell:Cast(target)
        end
    end
end)

function countEnemiesInRange(range)
    local count = 0
    awful.enemies.loop(function(enemy)
        if enemy.distanceTo(player) <= range then
            count = count + 1
        end
    end)
    return count
end

immolationAura:Callback(function(spell)
    local count, total, objects = enemies.around(player, 10)
    if count > 2 or player.buff(47241) and player.buffRemains(47241) < 15 then
        if spell:Cast() then
            awful.alert("Move Meele!", 50589)
        end
    end
end)



demonicEmpowerment:Callback(function(spell)
    if pet.exists and player.combat and target.enemy then
        spell:Cast()
    end
end)


soulFire:Callback(function(spell)
    if target.enemy then
        if target.combat and hasSoulShards() then 
            local buffRemains = player.buffRemains(63167)
            if player.buff(63167) and spell.castTime < buffRemains then
                spell:Cast(target)
            end
        end
    end
end)

corruption:Callback(function(spell)
    if target.enemy then
        local debuff = target.debuffFrom({"Corruption"}, player)
        if not debuff and not target.debuff(47836) and not checkTrinketBuff() then
            spell:Cast(target)
        end
    end
end)

incinerate:Callback(function(spell)
    local incinerateID = 47838
    if target.enemy then
        if not player.buff(63167) then
            local casted = awful.enemies.loop(function(enemy)
                if enemy.combat and enemy.hp <= 35 then
                    return spell:Cast(enemy)
                end
            end)
            if casted then return end
        end
        if not player.buff(71165) then
            return
        end
        if player.buffStacks(71165) == 1 and wasCasting[incinerateID] then
            return
        end
        spell:Cast(target)
    end
end)

shadowBolt:Callback(function(spell)
    local shadowBoltID = 47809
    if target.enemy then
        if wasCasting[shadowBoltID] then return end
        if not target.debuff(17800) then
        spell:Cast(target)
        end
    end
end)

felDomination:Callback(function(spell)
    if not pet.exists and player.combat and hasSoulShards() then
        spell:Cast()
    end
end)

felArmor:Callback(function(spell)
    if not player.buff(47893) then
        spell:Cast()
    end
end)

shadowBoltFiller:Callback(function(spell)
    if target.enemy then
        spell:Cast(target)
    end
end)

local lastTarget = nil 

seedOfCorruption:Callback(function(spell)
    if target.enemy and not settings.forceSingleTarget then
        local count = 0
        enemies.loop(function(enemy)
            if enemy.distanceTo(target) < 15 and enemy.combat then 
                if not enemy.debuff(47836) then 
                    count = count + 1
                    if count > 2 then 
                        spell:Cast(enemy) 
                        lastTarget = enemy 
                        return true 
                    end
                end
            end
        end)
    end
end)
  

shadowflame:Callback(function(spell)
    if target.enemy then
        local numTargetsInRange = 0
        for _, unit in ipairs(awful.units) do
            numTargetsInRange = numTargetsInRange + 1
            if numTargetsInRange > 3 then
                spell:Cast(target)
                return
            end
        end
    end
end)



demo:Init(function()
    if player.mounted then
        return
    end 
    if awful.burst then
        metamorphosis("burst")
    end
    trinket2()
    trinket1()
    drainSoul()
    WasCastingCheck()
    Buff()
    soulLink()
    createHealthstone()
    createSpellstone()
    createSoulstone()
    felArmor()
    checkTrinketBuff()
    lifeTap()
    felDomination()
    felguard()
    useHealthstone()
    drainLife()
    petAttack()
    seedOfCorruption()
    immolate()
    corruption()
    curseOfDoom()
    curseOfElements()
    curseOfAgony()
    UseItemInSlot10()
    shadowBolt()
    soulFire()
    incinerate()
    demonicEmpowerment()
    immolationAura()
    shadowflame()
    shadowBoltFiller()
    deleteExcessSoulShards()
end)










